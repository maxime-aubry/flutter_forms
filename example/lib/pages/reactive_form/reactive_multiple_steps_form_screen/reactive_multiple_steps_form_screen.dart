import 'package:example/custom_drawer.dart';
import 'package:example/models.dart';
import 'package:example/pages/reactive_form/reactive_multiple_steps_form_screen/profile.dart';
import 'package:example/pages/reactive_form/reactive_multiple_steps_form_screen/social_links_array.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forms/flutter_forms.dart';

class ReactiveMultipleStepsFormScreen extends StatefulWidget {
  static const String routeName = '/reactiveMultipleStepsForm';

  @override
  _ReactiveMultipleStepsFormScreenState createState() =>
      _ReactiveMultipleStepsFormScreenState();
}

class _ReactiveMultipleStepsFormScreenState
    extends State<ReactiveMultipleStepsFormScreen> {
  @override
  void initState() {
    ListItemsProvider.clear();

    ListItemsProvider.register<EGender>(
      'getListOfGenders',
      () async => [
        new SelectListItem<EGender>(EGender.male, 'male'),
        new SelectListItem<EGender>(EGender.female, 'female'),
      ],
    );

    ListItemsProvider.register<ESocialNetwork>(
      'getListOfSocialNetwork',
      () async => [
        new SelectListItem<ESocialNetwork>(ESocialNetwork.facebook, 'Facebook'),
        new SelectListItem<ESocialNetwork>(ESocialNetwork.github, 'Github'),
        new SelectListItem<ESocialNetwork>(ESocialNetwork.pub, 'Pub.dev'),
        new SelectListItem<ESocialNetwork>(ESocialNetwork.twitter, 'Twitter'),
      ],
    );

    super.initState();
  }

  @override
  void dispose() {
    ListItemsProvider.close('getListOfGenders');
    ListItemsProvider.close('getListOfSocialNetwork');

    super.dispose();
  }

  List<Step> steps = [
    new Step(
      title: const Text('Profile'),
      isActive: true,
      content: new Profile(),
    ),
    new Step(
      title: const Text('Social links'),
      isActive: true,
      content: new SocialLinksArray(),
    ),
  ];
  int currentStep = 0;

  void next() {
    bool isNotLastPage = ((this.currentStep + 1) != this.steps.length);
    if (isNotLastPage) goTo(this.currentStep + 1);
  }

  void cancel() {
    if (this.currentStep > 0) goTo(this.currentStep - 1);
  }

  void goTo(int step) {
    setState(() => this.currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text("Reactive multiple steps form")),
      drawer: new CustomDrawer(),
      body: new MultipleStepFormContainer(
        builder: (context, _) {
          return new Stepper(
            type: StepperType.horizontal,
            steps: this.steps,
            currentStep: currentStep,
            onStepContinue: () async {
              List<String> stepsNames =
                  context.readMultipleStepFormStateIndexer().keys.toList();

              ReactiveFormState formState = context.readFormState(
                step: stepsNames[currentStep],
              );

              if (await formState.validate()) {
                // Data treatment and post to server here...
                displayAlert(context, 'Form is valid !');
                next();
              } else {
                displayAlert(context, 'Form is invalid !');
              }
            },
            onStepTapped: (step) => goTo(step),
            onStepCancel: cancel,
          );
        },
      ),
    );
  }
}
