extension DateTimeParsing on String {
  /// [toDateTime] converts a [String] value to a [DateTime].
  DateTime toDateTime() {
    if (this == null) return null;
    return DateTime.tryParse(this) ?? null;
  }

  /// [toDouble] converts a [String] value to a [num].
  double toDouble() {
    if (this == null) return null;
    return double.tryParse(this) ?? null;
  }

  /// [toInt] converts a [String] value to a [int].
  int toInt() {
    if (this == null) return null;
    return int.tryParse(this) ?? null;
  }

  /// [toNumber] converts a [String] value to a [num].
  num toNumber() {
    if (this == null) return null;
    return num.tryParse(this) ?? null;
  }
}

// extension ListStringParsing on List<String> {
//   List<DateTime> toDateTimeList() {
//     if (this == null) return null;
//     List<DateTime> values =
//         Collection(this).select((arg1) => arg1.toDateTime()).toList();
//     return values ?? null;
//   }

//   List<num> toNumberList() {
//     if (this == null) return null;
//     List<num> values =
//         Collection(this).select((arg1) => arg1.toNumber()).toList();
//     return values ?? null;
//   }
// }
