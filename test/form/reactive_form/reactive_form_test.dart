import 'package:flutter/widgets.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Form > ReactiveForm > ReactiveForm.', () {
    testWidgets('ReactiveForm is initialized.', (WidgetTester tester) async {
      ReactiveFormBuilder formBuilder = new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'control1': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        ),
      );

      await tester.pumpWidget(ReactiveForm(
        formBuilder: formBuilder,
        builder: (context, _) {
          return new Container();
        },
      ));
    });
  });
}
