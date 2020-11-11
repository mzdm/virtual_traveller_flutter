import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/utils/extensions.dart';

class ExpansionCard extends StatelessWidget {
  ExpansionCard({
    Key key,
    @required this.name,
    @required this.category,
    this.location,
  })  : categoryMatcherData = CategoryMatcherData(poiCategory: category),
        super(key: key);

  final String name;
  final CategoryPOI category;
  final Location location;

  final CategoryMatcherData categoryMatcherData;

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
        title: _buildVisibleContent(
          context,
          name: name,
          category: category,
        ),
        childrenPadding: const EdgeInsets.all(12.0),
        children: _buildHiddenContent(location),
      ),
    );
  }

  Widget _buildVisibleContent(
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
                category.replaceUnderscores(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: categoryMatcherData.color,
              avatar: Icon(
                categoryMatcherData.icon,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildHiddenContent(Location location) {
    return <Widget>[
      SizedBox(
        width: double.infinity,
        height: 170.0,
        child: ListView(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Copy name'),
                  trailing: _buildListTileIcon(
                    tooltip: 'Copy name',
                    icon: Icons.copy,
                  ),
                ),
              ),
            ),
            if (location != null)
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('GPS coordinates', style: TextStyle(color: Colors.black)),
                    trailing: Wrap(
                      spacing: 10.0,
                      children: [
                        _buildListTileIcon(
                          tooltip: 'View on the map',
                          icon: Icons.navigation_outlined,
                        ),
                        _buildListTileIcon(
                          tooltip: 'Copy GPS coordinates',
                          icon: Icons.copy,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Browse pictures'),
                  trailing: _buildListTileIcon(
                    tooltip: 'Browse pictures',
                    icon: Icons.open_in_new_sharp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Tooltip _buildListTileIcon({
    @required String tooltip,
    @required IconData icon,
  }) {
    return Tooltip(
      message: tooltip,
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
