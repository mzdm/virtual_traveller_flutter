import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/data/models/hotel.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/utils/extensions.dart';
import 'package:virtual_traveller_flutter/utils/utils.dart';

import 'local_widgets/image_sliver_app_bar.dart';

class HotelDetailsPage extends StatelessWidget {
  static Route route({
    @required Hotel hotel,
  }) {
    return MaterialPageRoute(
      builder: (_) {
        return HotelDetailsPage();
      },
      settings: RouteSettings(
        arguments: hotel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Hotel hotel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          buildSliverAppBar(
            context,
            hotelName: hotel.name.toPascalCase(),
            location: Location(
              latitude: hotel?.latitude ?? 0,
              longitude: hotel?.longitude ?? 0,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, _) => buildPageContent(context),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  ImageSliverAppBar buildSliverAppBar(
    BuildContext context, {
    @required String hotelName,
    @required Location location,
  }) {
    return ImageSliverAppBar(
      title: hotelName,
      twoLineTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.navigation_outlined),
          tooltip: 'Show on map',
          onPressed: () {
            Utils.launchGeoUrl(
              context,
              location: location,
            );
          },
        ),
      ],
    );
  }

  Container buildPageContent(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detailed hotel info',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 1400),
        ],
      ),
    );
  }
}
