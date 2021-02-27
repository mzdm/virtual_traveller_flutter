import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/consts/asset_names.dart';
import 'package:virtual_traveller_flutter/data/models/hotel.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/utils/extensions.dart';
import 'package:virtual_traveller_flutter/utils/utils.dart';

import 'local_widgets/image_sliver_app_bar.dart';
import 'local_widgets/toolbar_clipper.dart';

class HotelDetailsPage extends StatelessWidget {
  static Route route({
    required Hotel hotel,
  }) {
    return MaterialPageRoute(
      builder: (_) => HotelDetailsPage(),
      settings: RouteSettings(
        arguments: hotel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hotel = ModalRoute.of(context)!.settings.arguments as Hotel;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          buildSliverAppBar(
            context,
            hotelName: hotel.name.toPascalCase(),
            location: Location(
              latitude: hotel.latitude,
              longitude: hotel.longitude,
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
    required String hotelName,
    required Location location,
  }) {
    return ImageSliverAppBar(
      title: hotelName,
      twoLineTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.navigation_outlined),
          tooltip: 'Show on the map',
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

  Widget buildPageContent(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildHeaderContents(context),
          SizedBox(height: 1400),
        ],
      ),
    );
  }

  Widget buildHeaderContents(BuildContext context) {
    return Stack(
      children: [
        ...buildToolbarClipper(context),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: SizedBox(
            width: 140.0,
            height: 180.0,
            child: Card(
              elevation: 0.0,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: AssetImage(
                          Utils.getImageAsset(ImageAssetNames.hotelDetails),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Room\nPictures',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          Spacer(),
                          Flexible(
                            child: Icon(
                              Icons.open_in_new_sharp,
                              color: Colors.white,
                              size: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> buildToolbarClipper(BuildContext context) {
    return [
      Container(
        height: 40,
        color: Theme.of(context).primaryColor,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 39.9),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .1,
          child: ClipPath(
            clipper: ToolbarClipper(),
            child: Container(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    ];
  }
}
