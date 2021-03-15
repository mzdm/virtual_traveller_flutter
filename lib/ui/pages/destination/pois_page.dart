import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_traveller_flutter/blocs/destination/poi/pois_cubit.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/ui/pages/destination/local_widgets/expansion_card.dart';
import 'package:virtual_traveller_flutter/ui/pages/destination/local_widgets/poi_shimmer_loading.dart';

class PoisPage extends StatelessWidget {
  static Route route(
    BuildContext context, {
    required String cityName,
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
    final cityName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Points of Interests'),
      ),
      body: Container(
        child: BlocBuilder<PoisCubit, PoisState>(
          builder: (_, state) {
            if (state is PoisLoading) {
              return PoiShimmerLoading();
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

            return const SizedBox();
          },
        ),
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

  Widget buildExpansionCard({
    required String cityName,
    required POI poi,
    Location? poiLocation,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ExpansionCard(
        cityName: cityName,
        poiName: poi.name,
        poiCategory: poi.category,
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
