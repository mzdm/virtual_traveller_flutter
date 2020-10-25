import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/presentation/pages/destination/local_widgets/rounded_card.dart';
import 'package:virtual_traveller_flutter/utils/extensions.dart';

class DestinationInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
            pinned: true,
            floating: true,
            actions: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                tooltip: '(Un)favorite',
                onPressed: () {
                  print('to favorites');
                },
              ),
            ],
            flexibleSpace: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/most_popular_destination3.jpg'),
                  )),
                ),
                FlexibleSpaceBar(
                  title: Text('London'.toPascalCase()),
                ),
              ],
            ),
          ),
          // Next, create a SliverList
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 150.0,
                        child: Card(
                          color: Colors.redAccent,
                        ),
                      ),
                      SizedBox(height: 20),
                      buildCategories(context),
                      SizedBox(height: 400),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  Row buildCategories(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryRoundedCard(
                  title: 'as',
                  assetName: 'most_popular_destination0.jpg',
                  onTap: () {},
                ),
                SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Points of Interests',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8.0),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryRoundedCard(
                title: 'as',
                assetName: 'most_popular_destination0.jpg',
                onTap: () {},
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  'Hotels',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
