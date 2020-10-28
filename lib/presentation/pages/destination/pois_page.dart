import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_traveller_flutter/blocs/destination/poi/pois_cubit.dart';

class PoisPage extends StatelessWidget {
  static Route route(BuildContext context) {
    return MaterialPageRoute(
      builder: (_) {
        return BlocProvider<PoisCubit>.value(
          value: context.repository<PoisCubit>(),
          child: PoisPage(),
        );
      },
    );
  }

  // TODO: Collapsable cards
  // TODO: Show info: name, gps coords, category
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
            }

            if (state is PoisSuccess) {
              print('success');
              return Center(
                child: Text(
                  state.pois.toString(),
                ),
              );
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
}
