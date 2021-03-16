/// [SelectListItem] with [TValue] generic type is class used to provide items to widgets.
/// {@category Utilities}
class SelectListItem<TValue> {
  SelectListItem(
    this.value,
    this.text,
  )   : assert(value != null),
        assert(text != null),
        assert(text != '');

  TValue value;
  String text;
}
