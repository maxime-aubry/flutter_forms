import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../form/reactive_form/parts/initializer/initializer.dart';

class NavigatorTester with FormValidatorNavigator {}

void main() {
  group('Annotations > Validators > FormValidatorNavigator.', () {
    test('Remote String parameter is found.', () {
      FormGroup root = new FormGroup(
        controls: {
          'target': new FormControl<String>(value: 'ytreza', validators: []),
        },
        validators: [],
      );
      initializeRoot(root);
      NavigatorTester navigator = new NavigatorTester();

      String parameter = navigator.getRemoteValidatorParameter<String>(
        defaultValue: 'azerty',
        localParameterName: 'target',
        remoteParameterName: 'target',
        formGroup: root,
      );
      expect(parameter, isNotNull);
      expect(parameter, 'ytreza');
    });

    test('Remote DateTime parameter is found.', () {
      FormGroup root = new FormGroup(
        controls: {
          'target': new FormControl<DateTime>(
            value: new DateTime(2021, 1, 1),
            validators: [],
          ),
        },
        validators: [],
      );
      initializeRoot(root);
      NavigatorTester navigator = new NavigatorTester();

      DateTime parameter = navigator.getRemoteValidatorParameter<DateTime>(
        defaultValue: const ConstantDateTime('2021-01-02T00:00:00'),
        localParameterName: 'target',
        remoteParameterName: 'target',
        formGroup: root,
      );
      expect(parameter, isNotNull);
      expect(parameter, new DateTime(2021, 1, 1));
    });

    test(
        'Throws exception of FormValidatorNavigator_Throws type when default value is not a ConstantDateTime.',
        () {
      FormGroup root = new FormGroup(
        controls: {
          'target': new FormControl<DateTime>(
            value: new DateTime(2021, 1, 1),
            validators: [],
          ),
        },
        validators: [],
      );
      initializeRoot(root);
      NavigatorTester navigator = new NavigatorTester();

      expect_exception<ValidatorParameterException>(() {
        navigator.getRemoteValidatorParameter<DateTime>(
          defaultValue: new DateTime(2021, 1, 2),
          localParameterName: 'target',
          remoteParameterName: 'target',
          formGroup: root,
        );
      }, '''Cannot get datetime from remote parameter.
            This one is not a ConstantDateTime object, its type is DateTime.
            Please, provide a ConstantDateTime object, just like this :
            @Validator(parameter: ConstantDateTime('yyyy-MM-ddTHH:mm:ssZ'))''');
    });

    test(
        'Throws exception of FormValidatorNavigator_Throws type when remote parameter name is empty.',
        () {
      FormGroup root = new FormGroup(
        controls: {},
        validators: [],
      );
      initializeRoot(root);
      NavigatorTester navigator = new NavigatorTester();

      expect_exception<ValidatorParameterException>(() {
        navigator.getRemoteValidatorParameter<DateTime>(
          defaultValue: const ConstantDateTime('2021-01-01T00:00:00'),
          localParameterName: 'target',
          remoteParameterName: '',
          formGroup: root,
        );
      }, 'Cannot get remote parameter with an empty parameter name.');
    });
  });
}
