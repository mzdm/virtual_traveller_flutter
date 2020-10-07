import 'package:flutter/material.dart';

import 'local_widgets/favorite_list_tile.dart';

class WatchlistPage extends StatelessWidget {
  static const favorites = <String>[
    'London',
    'Los Angeles',
    'Paris',
    'Berlin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destinations Watchlist'),
      ),
      body: Container(
        child: Center(
          child: favorites.isEmpty
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
                    itemCount: favorites.length,
                    itemBuilder: (_, index) {
                      final item = favorites[index];

                      return FavoriteListTile(
                        item: item,
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
