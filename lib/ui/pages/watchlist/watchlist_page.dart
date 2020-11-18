import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/ui/pages/destination/destination_info_page.dart';

import 'local_widgets/favorite_list_tile.dart';

class WatchlistPage extends StatefulWidget {
  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

// TODO: Get data from Watchlist bloc
// TODO: Add remove icon to Dismissible
class _WatchlistPageState extends State<WatchlistPage> {
  void _reorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final watchListItem = watchListItems.removeAt(oldIndex);
      watchListItems.insert(newIndex, watchListItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destinations Watchlist'),
      ),
      body: Container(
        child: Center(
          child: watchListItems.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You have not favorited a destination yet.',
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.0),
                    OutlinedButton.icon(
                      icon: Icon(Icons.search),
                      label: Text('Search for destinations', textAlign: TextAlign.center),
                      onPressed: () {},
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: ReorderableListView(
                    onReorder: (oldIndex, newIndex) => _reorder(oldIndex, newIndex),
                    children: [
                      for (var i = 0; i < watchListItems.length; i++)
                        // Dismissible(
                        //   key: UniqueKey(),
                        //   onDismissed: (direction) {
                        //     if (direction == DismissDirection.endToStart) {
                        //       setState(() {
                        //         watchListItems.removeAt(i);
                        //         print(watchListItems.isEmpty);
                        //       });
                        //     }
                        //   },
                        FavoriteListTile(
                          key: UniqueKey(),
                          cityCode: watchListItems[i].cityCode,
                          cityName: watchListItems[i].cityName,
                          onPressed: () {
                            print('clicked favorite');
                            Navigator.push(
                              context,
                              DestinationInfoPage.route(
                                context,
                                // TODO: reduce code duplication
                                cityCode: watchListItems[i].cityCode,
                                cityName: watchListItems[i].cityName,
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

// temporary model for fake watchlist
class WatchListItemModel {
  const WatchListItemModel(
    this.cityCode,
    this.cityName,
    this.location,
  );

  final String cityCode;
  final String cityName;
  final Location location;
}

// (these data would be retrieved otherwise from Flights API which is not yet implemented)
// data of these items are passed to blocs in DestinationInfo page to fetch hotels, pois, geo info, ...
final watchListItems = <WatchListItemModel>[
  WatchListItemModel('SFO', 'San Francisco', Location(latitude: 37.773972, longitude: -122.431297)),
  WatchListItemModel('PAR', 'Paris', Location(latitude: 48.864716, longitude: 2.349014)),
  WatchListItemModel('NYC', 'New York', Location(latitude: 40.730610, longitude: -73.935242)),
  WatchListItemModel('LON', 'London', Location(latitude: 51.509865, longitude: -0.118092)),
  WatchListItemModel('DFW', 'Dallas', Location(latitude: 32.779167, longitude: -96.808891)),
  WatchListItemModel('BER', 'Berlin', Location(latitude: 52.520008, longitude: 13.404954)),
  WatchListItemModel('BCN', 'Barcelona', Location(latitude: 41.390205, longitude: 2.154007)),
  WatchListItemModel('BLR', 'Bangalore', Location(latitude: 12.972442, longitude: 77.580643)),
];
