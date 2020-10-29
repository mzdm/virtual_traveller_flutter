import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/blocs/destination/hotels/hotels_cubit.dart';
import 'package:virtual_traveller_flutter/blocs/destination/poi/pois_cubit.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';
import 'package:virtual_traveller_flutter/presentation/pages/destination/hotels_page.dart';
import 'package:virtual_traveller_flutter/presentation/pages/destination/local_widgets/rounded_icon_card.dart';
import 'package:virtual_traveller_flutter/presentation/pages/destination/local_widgets/rounded_vertical_card.dart';
import 'package:virtual_traveller_flutter/presentation/pages/destination/pois_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_traveller_flutter/utils/extensions.dart';

import 'local_widgets/image_sliver_app_bar.dart';

class DestinationInfoPage extends StatelessWidget {
  static Route route(
    BuildContext context, {
    bool displayFlights = true,
  }) {
    final amadeusRepo = context.repository<AmadeusRepository>();
    return MaterialPageRoute(
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<HotelsCubit>(
              create: (_) => HotelsCubit(
                amadeusRepository: amadeusRepo,
              )..fetchHotels(
                  cityCode: 'LON',
                  language: null,
                ),
            ),
            BlocProvider<PoisCubit>(
              create: (_) => PoisCubit(
                amadeusRepository: amadeusRepo,
              )..fetchPois(
                  location: Location(
                    latitude: 40.416775,
                    longitude: -3.703790,
                  ),
                ),
            ),
          ],
          child: DestinationInfoPage(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  child: Column(
                    children: [
                      SizedBox(height: 10.0),
                      buildInfoContent(context),
                      SizedBox(height: 20.0),
                      buildExploreContent(context),
                      SizedBox(height: 20.0),
                      buildBottomContent(),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  ImageSliverAppBar buildSliverAppBar() {
    return ImageSliverAppBar(
      title: 'London'.toPascalCase(),
      assetName: 'most_popular_destination3.jpg',
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_border),
          tooltip: '(Un)favorite',
          onPressed: () {
            print('to favorites');
          },
        ),
      ],
    );
  }

  Widget buildInfoContent(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: RoundedIconCard(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.blue,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '20 °C sasa sdfsd',
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        Text(
                          'Detailed location\n\n',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Color(0x8a000000),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: RoundedIconCard(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.thermostat_outlined,
                      color: Colors.redAccent,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '20 °C sasa sdfsd',
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline4.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        ),
                        Text(
                          'Avg. temperature last week',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Color(0x8a000000),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // TODO: hardcoded assetNames
  Widget buildExploreContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Explore',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: RoundedVerticalCard(
                title: 'Hotels',
                assetName: 'destination_hotels.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    HotelsPage.route(context),
                  );
                },
              ),
            ),
            SizedBox(width: 8.0),
            Flexible(
              child: RoundedVerticalCard(
                title: 'Points of Interests',
                assetName: 'destination_pois.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    PoisPage.route(context),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  // TODO:
  Widget buildBottomContent() {
    return SizedBox(height: 20.0);
  }
}
