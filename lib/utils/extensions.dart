extension ListExt on List {
  /// Converts a List of elements to comma separated String
  /// without any spaces.
  ///
  /// Used for calling APIs as a query parameter.
  ///
  /// E.g.:
  /// ```
  /// INPUT: <String>['SYD', 'PAR']
  /// OUTPUT: 'SYD,PAR'
  /// ```
  ///
  /// ```
  /// INPUT: <int>[5, 4, 3]
  /// OUTPUT: '5,4,3'
  /// ```
  ///
  /// ```
  /// INPUT: <CategoryPOI>[CategoryPOI.NIGHTLIFE, CategoryPOI.RESTAURANT]
  /// OUTPUT: 'NIGHTLIFE,RESTAURANT'
  /// ```
  String toCommaString() {
    // TODO: Move describeEnum function to here
    final str = toString();
    return str.substring(1, str.length - 1).replaceAll(' ', '');
  }
}
