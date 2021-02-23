import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:virtual_traveller_flutter/blocs/destination/poi/pois_cubit.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/ui/pages/destination/local_widgets/expansion_card.dart';

class PoisPage extends StatelessWidget {
  static Route route(
    BuildContext context, {
    @required String cityName,
  }) {
    return MaterialPageRoute(
      settings: RouteSettings(arguments: cityName),
      builder: (_) {
        return BlocProvider<PoisCubit>.value(
          value: context.read<PoisCubit>(),
          child: PoisPage(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String cityName = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Points of Interests'),
      ),
      body: Container(
        child: BlocBuilder<PoisCubit, PoisState>(
          builder: (context, state) {
            if (state is PoisLoading) {
              return buildPoiLoading();
            }

            if (state is PoisSuccess) {
              return buildPoisSuccess(cityName, state.pois);
            }

            if (state is PoisEmpty) {
              print('empty');
            }

            if (state is PoisFailure) {
              print('failure');
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget buildPoiLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (_, index) {
          return buildExpansionCard(poi: null, poiLocation: null);
        },
      ),
    );
  }

  Widget buildPoisSuccess(String cityName, List<POI> pois) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: pois.length,
        itemBuilder: (context, index) {
          final poi = pois[index];
          final poiLocation = poi.geoCode;

          return buildExpansionCard(
            cityName: cityName,
            poi: poi,
            poiLocation: poiLocation,
          );
        },
      ),
    );
  }

  Padding buildExpansionCard({
    String cityName,
    @required POI poi,
    @required Location poiLocation,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ExpansionCard(
        cityName: cityName,
        poiName: poi?.name ?? '',
        poiCategory: poi?.category,
        poiLocation: poiLocation == null
            ? null
            : Location(
                latitude: poiLocation.latitude,
                longitude: poiLocation.longitude,
              ),
      ),
    );
  }
}
