import 'package:flutter/material.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:smart_select/smart_select.dart';

class CustomSingleDropdown<TProperty> extends StatefulWidget {
  final String label;
  final List<S2Choice<TProperty>> dataSource;
  final FormControl<TProperty> formControl;

  CustomSingleDropdown({
    Key key,
    @required this.label,
    @required this.dataSource,
    @required this.formControl,
  })  : assert(label != null),
        assert(dataSource != null),
        super(key: key);

  @override
  _CustomDropdownState<TProperty> createState() =>
      _CustomDropdownState<TProperty>();
}

class _CustomDropdownState<TProperty>
    extends State<CustomSingleDropdown<TProperty>> {
  Color errorColor = Colors.redAccent[700];

  Widget _getErrorText(String error) {
    return new Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          error,
          style: new TextStyle(color: errorColor, fontSize: 12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) =>
      new FormControlProvider<TProperty>.value(
        value: widget.formControl,
        builder: (context, _) {
          FormControl<TProperty> watchedFormControl =
              context.watchFormControl<TProperty>();
          FormControl<TProperty> readFormControl =
              context.readFormControl<TProperty>();

          return new Column(
            children: [
              SmartSelect<TProperty>.single(
                title: widget.label,
                value: context.watchFormControl<TProperty>().value,
                choiceItems: widget.dataSource,
                onChange: (state) => readFormControl.setValue(state.value),
                modalType: S2ModalType.bottomSheet,
                modalConfirm: true,
                modalFilter: true,
                choiceGrouped: false,
                tileBuilder: (context, state) {
                  return S2Tile.fromState(
                    state,
                    isTwoLine: false,
                    title: Text(
                      widget.label,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    padding: EdgeInsets.zero,
                  );
                },
              ),
              Container(
                decoration: BoxDecoration(
                  border: new Border(
                    top: new BorderSide(
                      color: (watchedFormControl.status ==
                              EAbstractControlStatus.invalid)
                          ? errorColor
                          : Colors.grey,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                child: new Container(),
              ),
              (watchedFormControl.status == EAbstractControlStatus.invalid)
                  ? this._getErrorText(watchedFormControl.error?.message)
                  : new Container(),
            ],
          );
        },
      );
}
