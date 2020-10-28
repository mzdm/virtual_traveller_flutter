import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:virtual_traveller_flutter/blocs/destination/hotels/hotels_cubit.dart';
import 'package:virtual_traveller_flutter/data/models/hotel.dart';
import 'package:virtual_traveller_flutter/presentation/pages/destination/hotel_details_page.dart';
import 'package:virtual_traveller_flutter/utils/extensions.dart';

class HotelsPage extends StatelessWidget {
  static Route route(BuildContext context) {
    return MaterialPageRoute(
      builder: (_) {
        return BlocProvider<HotelsCubit>.value(
          value: context.repository<HotelsCubit>(),
          child: HotelsPage(),
        );
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
                baseColor: Colors.grey[350],
                highlightColor: Colors.grey[100],
                child: SizedBox(
                  height: 130.0,
                  child: Card(
                    color: Colors.transparent,
                    elevation: 1.5,
                    child: ListTile(
                      title: Text(
                        'Hotel name',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(
                        Icons.star,
                        size: 15.0,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }

  // TODO: Make a separate widget
  // TODO: Pagination
  Widget buildHotelsSuccess(List<Hotel> hotels) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        final hotel = hotels[index];

        return SizedBox(
          height: 130.0,
          child: Card(
            elevation: 1.5,
            child: Stack(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        HotelDetailsPage.route(hotel: hotel),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
                  child: Column(
                    children: [
                      IgnorePointer(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                hotel.name.toPascalCase(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(width: 65.0),
                            Icon(
                              Icons.star,
                              size: 15.0,
                            ),
                            SizedBox(width: 1.0),
                            Text(
                              hotel.stars,
                              style: TextStyle(
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(width: 4.0),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      IgnorePointer(
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            hotel.address?.cityName ?? '',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Tooltip(
                                message: 'Distance from the city center to the hotel',
                                child: AbsorbPointer(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.directions_walk,
                                        size: 15.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.hotel_outlined,
                                        size: 15.0,
                                      ),
                                      SizedBox(width: 1.0),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          '${hotel.hotelDistance?.distance?.toString() ?? '-'} ${hotel.hotelDistance?.distanceUnit ?? '-'}',
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 4.0),
                                    ],
                                  ),
                                ),
                              ),
                              IgnorePointer(
                                child: Icon(
                                  Icons.navigate_next_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
