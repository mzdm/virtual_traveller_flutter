import 'package:flutter/material.dart';

import 'local_widgets/favorite_list_tile.dart';

class WatchlistPage extends StatelessWidget {
  static const cityNames = <String>[
    'London',
    'Los Angeles',
    'Paris',
    'Berlin',
  ];

  static const cityCodes = <String>[
    'LON',
    'LAX',
    'PAR',
    'BER',
  ];

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
                  child: ListView.builder(
                    itemCount: cityNames.length,
                    itemBuilder: (context, index) {
                      return FavoriteListTile(
                        cityCode: cityCodes[index],
                        cityName: cityNames[index],
                        onPressed: () {
                          print('clicked favorite');
                        },
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
