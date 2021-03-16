import 'package:example/models.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:queries/collections.dart';
import 'package:smart_select/smart_select.dart';

class AddSocialLink extends StatefulWidget {
  @override
  _AddSocialLinkState createState() => _AddSocialLinkState();
}

class _AddSocialLinkState extends State<AddSocialLink> {
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
    FormArray socialLinks = context.readFormArray();

    return ReactiveForm(
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        FormGroup root = context.watchFormGroup();

        return new Scaffold(
          appBar: new AppBar(title: Text("Add social link")),
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
                FormGroup socialLinkToAdd = context.readFormGroup();
                this._saveForm(socialLinks, socialLinkToAdd);
              }
            },
          ),
        );
      },
    );
  }

  ReactiveFormBuilder _getFormBuilder() => new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'social_network': new FormControl<ESocialNetwork>(
              value: null,
              validators: [
                Required(error: 'social network is required.'),
                SingleSelect(
                  serviceName: 'getListOfSocialNetwork',
                  error: 'unknown social network.',
                )
              ],
            ),
            'url': new FormControl<String>(
              value: null,
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

  Future<void> _saveForm(
    FormArray socialLinks,
    FormGroup model,
  ) async {
    await socialLinks.addGroup(model);
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
