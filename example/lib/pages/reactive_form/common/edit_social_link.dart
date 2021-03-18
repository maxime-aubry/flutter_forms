import 'package:example/models.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:queries/collections.dart';
import 'package:smart_select/smart_select.dart';

class EditSocialLink extends StatefulWidget {
  @override
  _EditSocialLinkState createState() => _EditSocialLinkState();
}

class _EditSocialLinkState extends State<EditSocialLink> {
  List<S2Choice<ESocialNetwork>> socialNetworks = [];

  @override
  void initState() {
    () async {
      this.socialNetworks.addAll(
            Collection(
              await ListItemsProvider.provide<ESocialNetwork>(
                'getListOfSocialNetwork',
              )(),
            )
                .select((arg1) => S2Choice(value: arg1.value, title: arg1.text))
                .toList(),
          );
    }();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FormGroup socialLink = context.readFormGroup();

    return ReactiveForm(
      formBuilder: this._getFormBuilder(socialLink.getClone()),
      builder: (context, _) {
        FormGroup root = context.watchFormGroup();

        return new Scaffold(
          appBar: new AppBar(title: Text("Edit social link")),
          body: new Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: new Column(
              children: [
                this._socialNetworkInput(
                  root.getFormControl<ESocialNetwork>('social_network'),
                ),
                this._urlInput(root.getFormControl<String>('url')),
              ],
            ),
          ),
          floatingActionButton: new FloatingActionButton(
            child: Icon(Icons.done),
            onPressed: () async {
              ReactiveFormState formState = context.readFormState();
              if (await formState.validate()) {
                FormGroup socialLinkToEdit = context.readFormGroup();
                displayAlert(context, 'Form is valid !');
                this._saveForm(socialLink, socialLinkToEdit);
              } else {
                displayAlert(context, 'Form is invalid !');
              }
            },
          ),
        );
      },
    );
  }

  ReactiveFormBuilder _getFormBuilder(FormGroup socialLink) {
    ESocialNetwork socialNetwork =
        socialLink.getFormControl<ESocialNetwork>('social_network').value;
    String url = socialLink.getFormControl<String>('url').value;

    ReactiveFormBuilder formBuilder = new ReactiveFormBuilder(
      group: new FormGroup(
        controls: {
          'social_network': new FormControl<ESocialNetwork>(
            value: socialNetwork,
            validators: [
              Required(error: 'social network is required.'),
              SingleSelect(
                serviceName: 'getListOfSocialNetwork',
                error: 'unknown social network.',
              )
            ],
          ),
          'url': new FormControl<String>(
            value: url,
            validators: [
              Required(error: 'url is required.'),
              Url(
                protocols: [EUrlProtocol.http, EUrlProtocol.https],
                error: 'invalid URL.',
              ),
            ],
          ),
        },
        validators: [],
      ),
    );
    return formBuilder;
  }

  Future<void> _saveForm(
    FormGroup socialLink,
    FormGroup socialLinkToEdit,
  ) async {
    // get new data
    ESocialNetwork socialNetwork =
        socialLinkToEdit.getFormControl<ESocialNetwork>('social_network').value;
    String url = socialLinkToEdit.getFormControl<String>('url').value;

    // save data
    await socialLink
        .getFormControl<ESocialNetwork>('social_network')
        .setValue(socialNetwork);
    await socialLink.getFormControl<String>('url').setValue(url);

    Navigator.of(context).pop();
  }

  Widget _socialNetworkInput(FormControl<ESocialNetwork> formControl) =>
      new CustomSingleDropdown<ESocialNetwork>(
        label: 'social network',
        dataSource: this.socialNetworks,
        formControl: formControl,
      );

  Widget _urlInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'url', formControl: formControl);
}
