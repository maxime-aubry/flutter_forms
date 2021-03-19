import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// [FormProvider] provides a [MultiProvider] implementation for the form.
/// {@category Form}
/// {@subCategory Providers}
class FormProvider extends MultiProvider {
  FormProvider({
    Key key,
    @required List<SingleChildWidget> providers,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          providers: providers,
          builder: builder,
          child: child,
        );
}
