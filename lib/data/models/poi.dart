import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';

part 'poi.freezed.dart';

part 'poi.g.dart';

/// Points of Interests
enum CategoryPOI { SIGHTS, NIGHTLIFE, RESTAURANT, SHOPPING, BEACH_PARK, HISTORICAL}

@freezed
abstract class POI with _$POI {
  const factory POI({
    @required String name,
    @required CategoryPOI category,
    Location geoCode,
  }) = _POI;

  factory POI.fromJson(Map<String, dynamic> json) => _$POIFromJson(json);
}
