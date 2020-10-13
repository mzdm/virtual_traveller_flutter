extension ListExt on List {
  String toCommaString() {
    final str = toString();
    return str.substring(1, str.length - 1).replaceAll(' ', '');
  }
}
