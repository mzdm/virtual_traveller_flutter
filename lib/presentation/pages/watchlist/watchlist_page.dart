import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'local_widgets/favorite_list_tile.dart';

class WatchlistPage extends StatefulWidget {
  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  final cityNames = <String>[
    'London',
    'Los Angeles',
    'Paris',
    'Berlin',
  ];

  final cityCodes = <String>[
    'LON',
    'LAX',
    'PAR',
    'BER',
  ];

  void _reorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final cityNameItem = cityNames.removeAt(oldIndex);
      final cityCodeItem = cityCodes.removeAt(oldIndex);

      cityNames.insert(newIndex, cityNameItem);
      cityCodes.insert(newIndex, cityCodeItem);
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
          child: cityNames.isEmpty
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have not favorited a destination yet.',
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1,
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
                for (var i = 0; i < cityNames.length; i++)
                  Dismissible(
                    key: UniqueKey(),

                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        setState(() {
                          cityNames.remove(i);
                          cityCodes.remove(i);
                          print(cityNames.isEmpty);
                        });
                      }
                    },
                    child: FavoriteListTile(
                      cityCode: cityCodes[i],
                      cityName: cityNames[i],
                      onPressed: () {
                        print('clicked favorite');
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
