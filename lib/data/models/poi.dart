import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';

part 'poi.freezed.dart';

part 'poi.g.dart';

/// Points of Interests
enum CategoryPOI { SIGHTS, NIGHTLIFE, RESTAURANT, SHOPPING, BEACH_PARK, HISTORICAL }

class CategoryMatcherData {
  CategoryMatcherData({
    @required CategoryPOI poiCategory,
  })  : color = _dataMatcher(Color, poiCategory),
        icon = _dataMatcher(IconData, poiCategory);

  final Color color;
  final IconData icon;

  static T _dataMatcher<T>(Object type, CategoryPOI poiCategory) {
    IconData icon;
    Color color;

    // ignore: missing_enum_constant_in_switch
    switch (poiCategory) {
      case CategoryPOI.RESTAURANT:
        color = Colors.brown[700];
        icon = Icons.restaurant;
        break;
      case CategoryPOI.NIGHTLIFE:
        color = Colors.black;
        icon = Icons.nightlife;
        break;
      case CategoryPOI.SHOPPING:
        color = Colors.green;
        icon = Icons.shopping_cart;
        break;
      case CategoryPOI.BEACH_PARK:
        color = Colors.orange;
        icon = Icons.beach_access;
        break;
      case CategoryPOI.HISTORICAL:
        color = Colors.blueGrey;
        icon = Icons.location_city;
        break;
      default:
        // SIGHTS
        color = Colors.blue;
        icon = Icons.camera_alt;
    }

    if (type == IconData) {
      return icon as T;
    } else if (type == Color) {
      return color as T;
    } else {
      return null;
    }
  }
}

@freezed
abstract class POI with _$POI {
  const factory POI({
    @required String name,
    @required CategoryPOI category,
    Location geoCode,
  }) = _POI;

  factory POI.fromJson(Map<String, dynamic> json) => _$POIFromJson(json);
}
