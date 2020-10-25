import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:virtual_traveller_flutter/blocs/destination/hotels/hotels_cubit.dart';
import 'package:virtual_traveller_flutter/data/models/hotel.dart';

class HotelsPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(
      builder: (context) {
        return HotelsPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels'),
      ),
      body: Container(
        child: BlocBuilder<HotelsCubit, HotelsState>(
          builder: (context, state) {
            if (state is HotelsLoading) {
              return buildHotelsLoading();
            }

            if (state is HotelsSuccess) {
              return buildHotelsSuccess(state.hotels);
            }

            if (state is HotelsEmpty) {
              return buildHotelsEmpty(context);
            }

            if (state is HotelsFailure) {
              return buildHotelsFailure(state.message);
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget buildHotelsLoading() {
    return kIsWeb
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey[200],
                child: ListTile(
                  title: Text('Name'),
                  trailing: Icon(
                    Icons.star,
                    size: 15.0,
                  ),
                ),
              );
            },
          );
  }

  // TODO: List hotels
  Widget buildHotelsSuccess(List<Hotel> hotels) {
    return Container();
  }

  Widget buildHotelsEmpty(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No hotels found.',
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          OutlinedButton(
            child: Text('Go back', textAlign: TextAlign.center),
            style: ButtonStyle(
              side: MaterialStateProperty.resolveWith(
                (states) => BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget buildHotelsFailure(String message) {
    return Center(
      child: Container(
        child: Text(
          'Unexpected error:\n\n$message',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
