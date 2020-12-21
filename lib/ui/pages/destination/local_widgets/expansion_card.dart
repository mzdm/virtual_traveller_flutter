import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/utils/extensions.dart';
import 'package:virtual_traveller_flutter/utils/utils.dart';

class ExpansionCard extends StatelessWidget {
  ExpansionCard({
    Key key,
    this.cityName,
    @required this.poiName,
    @required this.poiCategory,
    this.poiLocation,
  })  : categoryMatcherData = CategoryMatcherData(poiCategory: poiCategory),
        super(key: key);

  final String cityName;
  final String poiName;
  final CategoryPOI poiCategory;
  final Location poiLocation;

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
          name: poiName,
          category: poiCategory,
        ),
        childrenPadding: const EdgeInsets.all(12.0),
        children: _buildHiddenContent(
          context,
          poiLocation: poiLocation,
          poiName: poiName,
        ),
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
                category?.replaceUnderscores() ?? '',
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

  List<Widget> _buildHiddenContent(
    BuildContext context, {
    @required Location poiLocation,
    @required String poiName,
  }) {
    return <Widget>[
      Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Utils.copyToClipboard(context, textCopyData: poiName);
          },
          child: ListTile(
            title: Text('Copy name'),
            trailing: _buildListTileIcon(
              tooltip: 'Copy name',
              icon: Icons.copy,
            ),
          ),
        ),
      ),
      if (poiLocation != null)
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Utils.launchGeoUrl(context, location: poiLocation);
            },
            child: ListTile(
              title: Text(
                'GPS coordinates',
                style: TextStyle(color: Colors.black),
              ),
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
          onTap: () {
            final cityStr = cityName == null ? '' : '+$cityName';
            Utils.launchUrl(
              context,
              url:
                  'http://images.google.com/images?um=1&hl=en&safe=active&nfpr=1&q=',
              queryParam: '$poiName$cityStr',
            );
          },
          child: ListTile(
            title: Text('Browse pictures'),
            trailing: _buildListTileIcon(
              tooltip: 'Browse pictures',
              icon: Icons.open_in_new_sharp,
            ),
          ),
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
