import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';

class ExpansionCard extends StatelessWidget {
  const ExpansionCard({
    Key key,
    @required this.name,
    @required this.category,
    this.location,
  }) : super(key: key);

  final String name;
  final CategoryPOI category;
  final Location location;

  // TODO: Move this somewhere else
  // TODO: Add Tooltips
  IconData _matchCategoryIcon(CategoryPOI category) {
    switch (category) {
      case CategoryPOI.RESTAURANT:
        return Icons.restaurant;
      case CategoryPOI.NIGHTLIFE:
        return Icons.nightlife;
      case CategoryPOI.SHOPPING:
        return Icons.shopping_cart;
      case CategoryPOI.BEACH_PARK:
        return Icons.beach_access;
      case CategoryPOI.HISTORICAL:
        return Icons.location_city;
      default:
        return Icons.camera_alt;
    }
  }

  Color _matchCategoryColor(CategoryPOI category) {
    switch (category) {
      case CategoryPOI.RESTAURANT:
        return Colors.brown[700];
      case CategoryPOI.NIGHTLIFE:
        return Colors.black;
      case CategoryPOI.SHOPPING:
        return Colors.green;
      case CategoryPOI.BEACH_PARK:
        return Colors.orange;
      case CategoryPOI.HISTORICAL:
        return Colors.blueGrey;
      default:
        return Colors.blue;
    }
  }

  String _matchCategoryLabel(CategoryPOI category) {
    return describeEnum(category).replaceAll('_', ' ');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 2.5,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: ExpansionTile(
        backgroundColor: Colors.white,
        title: _buildVisible(
          context,
          name: name,
          category: category,
        ),
        childrenPadding: const EdgeInsets.all(12.0),
        children: _buildHidden(location),
      ),
    );
  }

  Widget _buildVisible(
    BuildContext context, {
    @required String name,
    @required CategoryPOI category,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: RawChip(
              label: Text(
                _matchCategoryLabel(category),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: _matchCategoryColor(category),
              avatar: Icon(
                _matchCategoryIcon(category),
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildHidden(Location location) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            Text('Copy name'),
            Spacer(),
            Icon(Icons.copy),
          ],
        ),
      ),
      if (location != null)
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Tooltip(
                    message: 'GPS coordinates',
                    child: Text(
                      'GPS coordinates',
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Tooltip(
                    message: 'Navigate',
                    child: Icon(
                      Icons.navigation_outlined,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Tooltip(
                    message: 'Copy GPS coordinates',
                    child: Icon(
                      Icons.copy,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            Text('Browse pictures'),
            Spacer(),
            Icon(Icons.open_in_new_sharp),
          ],
        ),
      ),
    ];
  }
}
