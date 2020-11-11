import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_traveller_flutter/blocs/destination/poi/pois_cubit.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/ui/pages/destination/local_widgets/expansion_card.dart';

class PoisPage extends StatelessWidget {
  static Route route(BuildContext context) {
    return MaterialPageRoute(
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Points of Interests'),
      ),
      body: Container(
        child: BlocBuilder<PoisCubit, PoisState>(
          builder: (context, state) {
            if (state is PoisLoading) {
              print('loading');
              return buildPoiLoading();
            }

            if (state is PoisSuccess) {
              print('success');
              return buildPoisSuccess(state.pois);
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
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildPoisSuccess(List<POI> pois) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: pois.length,
        itemBuilder: (context, index) {
          final poi = pois[index];
          final poiLocation = poi.geoCode;

          return Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ExpansionCard(
              name: poi.name,
              category: poi.category,
              location: poiLocation == null
                  ? null
                  : Location(
                      latitude: poiLocation.latitude,
                      longitude: poiLocation.longitude,
                    ),
            ),
          );
        },
      ),
    );
  }
}
