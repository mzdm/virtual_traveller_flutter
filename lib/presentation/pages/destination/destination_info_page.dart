import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/blocs/destination/hotels/hotels_cubit.dart';
import 'package:virtual_traveller_flutter/presentation/pages/destination/hotels_page.dart';
import 'package:virtual_traveller_flutter/presentation/pages/destination/local_widgets/rounded_card.dart';
import 'package:virtual_traveller_flutter/presentation/pages/destination/pois_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_traveller_flutter/utils/extensions.dart';

import 'local_widgets/image_sliver_app_bar.dart';

class DestinationInfoPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(
      builder: (context) {
        return DestinationInfoPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<HotelsCubit>().resetState();
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            buildSliverAppBar(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Theme.of(context).primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'BUTTON TO SEARCH FLIGHTS (if from watchlist/home page)\n\nBasic info: City name, Country name, Country abbreviation',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                  Text(
                                    '\nLocation\nlat: xyz longitude: xyz',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                  Text(
                                    '\nAverage temperature last week: xyz',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }

  ImageSliverAppBar buildSliverAppBar() {
    return ImageSliverAppBar(
      title: 'London'.toPascalCase(),
      assetName: 'most_popular_destination3.jpg',
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_border),
          tooltip: '(Un)favorite',
          onPressed: () {
            print('to favorites');
          },
        ),
      ],
    );
  }

  Widget buildCategories(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    Placeholder(
                      fallbackHeight: 250.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategoryRoundedCard(
                          title: 'as',
                          assetName: 'most_popular_destination0.jpg',
                          onTap: () {
                            final hotelsBloc = context.bloc<HotelsCubit>();
                            if (hotelsBloc.state is HotelsInitial) {
                              hotelsBloc.fetchHotels(
                                cityCode: 'LON',
                                language: null,
                              );
                            }
                            Navigator.push(
                              context,
                              HotelsPage.route(),
                            );
                          },
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
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryRoundedCard(
                    title: 'as',
                    assetName: 'most_popular_destination0.jpg',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PoisPage()));
                    },
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
          ],
        ),
      ],
    );
  }
}
