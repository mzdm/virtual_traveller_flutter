import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/blocs/destination/geo/geo_cubit.dart';
import 'package:virtual_traveller_flutter/blocs/destination/hotels/hotels_cubit.dart';
import 'package:virtual_traveller_flutter/blocs/destination/poi/pois_cubit.dart';
import 'package:virtual_traveller_flutter/blocs/destination/safety_rate/safety_rate_cubit.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_traveller_flutter/ui/pages/destination/pois_page.dart';
import 'package:virtual_traveller_flutter/utils/extensions.dart';

import 'hotels_page.dart';
import 'local_widgets/image_sliver_app_bar.dart';
import 'local_widgets/rounded_icon_card.dart';
import 'local_widgets/rounded_vertical_card.dart';

class DestinationInfoPage extends StatelessWidget {
  static Route route(
    BuildContext context, {
    bool displayFlights = true,
    @required String cityCode,
    @required String cityName,
  }) {
    final amadeusRepo = context.read<AmadeusRepository>();

    return MaterialPageRoute(
      settings: RouteSettings(
        arguments: cityName,
      ),
      builder: (_) {
        final geoCubit = GeoCubit(
          amadeusRepository: amadeusRepo,
        )..fetchCityGeoData(inputCityCode: cityCode);

        return MultiBlocProvider(
          providers: [
            BlocProvider<GeoCubit>(
              create: (context) => geoCubit,
            ),
            BlocProvider<SafetyRateCubit>(
              create: (_) => SafetyRateCubit(
                geoCubit: geoCubit,
                amadeusRepository: amadeusRepo,
              ),
            ),
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
    final String cityName = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          buildSliverAppBar(cityName ?? ''),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  child: Column(
                    children: [
                      SizedBox(height: 10.0),
                      buildGeoContent(context),
                      buildStatsContent(context),
                      SizedBox(height: 20.0),
                      buildExploreContent(context),
                      SizedBox(height: 20.0),
                      buildBottomContent(context),
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

  ImageSliverAppBar buildSliverAppBar(String cityName) {
    return ImageSliverAppBar(
      title: cityName.toPascalCase(),
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

  Widget buildGeoContent(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: RoundedIconCard(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Info',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            fontSize: 28.0,
                            color: Colors.black,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            buildGeoBloc(),
          ],
        ),
      ),
    );
  }

  Widget buildGeoBloc() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<GeoCubit, GeoState>(
          builder: (context, state) {
            if (state is GeoSuccess) {
              final address = state.geoData.address;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Text(
                      'Region code: ${address?.regionCode}\n'
                      'Country: ${address?.countryName}\n'
                      'Country code: ${address?.countryCode}',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Color(0x8a000000),
                          ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(width: 15.0),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Text(
                      'Latitude: ${state.geoData.geoCode?.latitude}\n'
                      'Longitude: ${state.geoData.geoCode?.longitude}\n',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Color(0x8a000000),
                          ),
                    ),
                  ),
                ],
              );
            }

            return Container(
              child: Text('...'),
            );
          },
        ),
      ],
    );
  }

  // TODO: Refactor (reuse widgets)
  Widget buildStatsContent(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO: Fetch Weather API (OpenWeather ?)
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
                    Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '- °C',
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
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Tooltip(
              message: 'Safety rating ranges from 0 to 100, where 0 means the best/very safe and '
                  '100 score means worst/very dangerous. Based on this value is displayed appropriate text.',
              child: RoundedIconCard(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.healing,
                        color: Colors.green,
                      ),
                      Center(
                        child: Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Safety',
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.headline4.copyWith(
                                        fontSize: 28.0,
                                        color: Colors.black,
                                      ),
                                ),
                                SizedBox(height: 5.0),
                                BlocBuilder<SafetyRateCubit, SafetyRateState>(
                                  builder: (context, state) {
                                    if (state is SafetyRateSuccess) {
                                      return Text(
                                        state.result.text.toUpperCase(),
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                                              color: state.result.color,
                                            ),
                                      );
                                    }

                                    return Text(
                                      '-',
                                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                                            color: Color(0x8a000000),
                                          ),
                                    );
                                  },
                                ),
                                SizedBox(height: 10.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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

  // TODO: Add actions (copy name, gps coords, pictures link, ...)
  Widget buildBottomContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'More actions',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
        SizedBox(height: 200.0),
      ],
    );
  }
}
