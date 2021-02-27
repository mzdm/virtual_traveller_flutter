import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:virtual_traveller_flutter/consts/asset_names.dart';
import 'package:virtual_traveller_flutter/data/models/hotel.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/ui/pages/destination/local_widgets/rounded_icon_card.dart';
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

  late Hotel _hotel;

  @override
  Widget build(BuildContext context) {
    _hotel = ModalRoute.of(context)!.settings.arguments as Hotel;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          buildSliverAppBar(
            context,
            hotelName: _hotel.name.toPascalCase(),
            location: Location(
              latitude: _hotel.latitude,
              longitude: _hotel.longitude,
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
          buildInfoContent(context),
          buildAmenities(context),
          SizedBox(height: 200),
        ],
      ),
    );
  }

  Widget buildHeaderContents(BuildContext context) {
    return Stack(
      children: [
        ...buildToolbarClipper(context),
        Row(
          children: [
            buildHeaderCard(context),
            SizedBox(width: 20.0),
            buildHeaderDesc(),
          ],
        ),
      ],
    );
  }

  Padding buildHeaderCard(BuildContext context) {
    return Padding(
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
                        style: Theme.of(context).textTheme.headline5!.copyWith(
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
    );
  }

  Widget buildHeaderDesc() {
    return Column(
      children: [
        SizedBox(height: 20.0),
        Text(
          'Rating: ',
          style: TextStyle(fontSize: 15.0),
        ),
        SizedBox(height: 6.0),
        RatingBarIndicator(
          rating: double.parse(_hotel.stars),
          itemSize: 30.0,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }

  Widget buildInfoContent(BuildContext context) {
    final address = _hotel.address?.lines.reduce((v, e) => v + ' ' + e) ?? '';

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: double.infinity,
        height: 200.0,
        child: RoundedIconCard(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.0),
                      SelectableText(
                        'Country: ${_hotel.address?.countryCode}\n'
                        'City: ${_hotel.address?.cityName.toPascalCase()}\n'
                        'Address: ${address.toPascalCase()}\n'
                        '\n'
                        'Phone: ${_hotel.contact?.phone}\n'
                        'Email: ${_hotel.contact?.email}\n'
                        'Fax: ',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0x8a000000),
                              fontSize: 15.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Icon(
                    Icons.help,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAmenities(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Available amenities:',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 2.0,
              runSpacing: 4.0,
              children: _hotel.amenities
                  .map(
                    (e) => RawChip(
                      label: Text(
                        e,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
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
