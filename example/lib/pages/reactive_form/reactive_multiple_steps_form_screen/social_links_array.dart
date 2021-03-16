import 'package:example/pages/reactive_form/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forms/flutter_forms.dart';

class SocialLinksArray extends StatefulWidget {
  @override
  _SocialLinksArrayState createState() => _SocialLinksArrayState();
}

class _SocialLinksArrayState extends State<SocialLinksArray> {
  @override
  Widget build(BuildContext context) {
    return new ReactiveForm(
      step: 'social_links',
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        FormGroup root = context.watchFormGroup();

        return new SingleChildScrollView(
          child: new Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: new Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () => this._goToAddPage(
                      root.getFormArray('social_links'),
                    ),
                    style: ButtonStyle(),
                    icon: Icon(Icons.add),
                    label: Text('Add'),
                  ),
                ),
                new SocialLinksSlidable(),
              ],
            ),
          ),
        );
      },
    );
  }

  ReactiveFormBuilder _getFormBuilder() => new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'social_links': new FormArray(
              groups: [],
              validators: [
                NbItems(
                  min: 1,
                  max: 3,
                  error: 'There must be between 1 and 3 items.',
                )
              ],
            ),
          },
          validators: [],
        ),
      );

  void _goToAddPage(FormArray socialLinks) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FormProvider(
            providers: [
              new FormArrayProvider.value(value: socialLinks),
            ],
            child: new AddSocialLink(),
          ),
        ),
      );
}
