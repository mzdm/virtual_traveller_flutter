import 'package:flutter/foundation.dart';

class Location {
  Location({
    @required this.lat,
    @required this.long,
  })  : assert(lat != null),
        assert(long != null);

  final double lat;
  final double long;
}
