import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_traveller_flutter/blocs/settings/settings_bloc.dart';

import 'blocs/bloc_observer.dart';
import 'blocs/destination/hotels/hotels_cubit.dart';
import 'blocs/home/bottom_nav_bar_cubit.dart';
import 'blocs/home/flight_destination_switcher_cubit.dart';
import 'blocs/home/most_popular_destinations/most_popular_destinations_cubit.dart';
import 'data/data_providers/remote/amadeus_api/api_service.dart';
import 'data/data_providers/remote/amadeus_api/mocked_data.dart';
import 'data/data_providers/remote/amadeus_api/remote_data.dart';
import 'data/repositories/amadeus_repository.dart';
import 'presentation/pages/flights/search_flights_page.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/settings/settings_page.dart';
import 'presentation/pages/watchlist/watchlist_page.dart';
import 'config/app/debug_config.dart';
import 'config/theme/theme_config.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarIconBrightness: Brightness.light,
  //     statusBarColor: ColorUtils.primaryDefaultColorBlue,
  //   ),
  // );

  final amadeusBaseDataProvider = DebugConfig.quotaSaveMode
      ? AmadeusMockedDataProvider()
      : AmadeusRemoteDataProvider(ApiService());

  final amadeusRepository = AmadeusRepository(
    amadeusBaseDataProvider: amadeusBaseDataProvider,
  );

  runApp(
    RepositoryProvider<AmadeusRepository>(
      create: (_) => amadeusRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SettingsBloc>(
            create: (_) => SettingsBloc(),
          ),
          BlocProvider<BottomNavBarCubit>(
            create: (_) => BottomNavBarCubit(),
          ),
          BlocProvider<HotelsCubit>(
            create: (_) => HotelsCubit(
              amadeusRepository: amadeusRepository,
            ),
          ),
        ],
        child: MainApp(),
      ),
    ),
  );
}

// TODO: Use Navigator 2.0 (not priority)
class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.defaultDarkBlueTheme,
      home: BlocBuilder<BottomNavBarCubit, int>(
        // TODO: Create a state for page transition effect
        builder: (context, state) {
          return Scaffold(
            body: MultiBlocProvider(
              providers: [
                BlocProvider<FlightDestinationSwitcherCubit>(
                  create: (_) => FlightDestinationSwitcherCubit(),
                ),
                BlocProvider<MostPopularDestinationsCubit>(
                  create: (_) => MostPopularDestinationsCubit(
                    context.repository<AmadeusRepository>(),
                  )..fetchMostPopularDestinations('MAD'),
                ),
              ],
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  HomePage(
                    onSettingsTap: () {
                      context.bloc<BottomNavBarCubit>().changeNavBarItem(3);
                      context
                          .bloc<BottomNavBarCubit>()
                          .pageTransitionEffect(_pageController, isFromSettingsIcon: true);
                    },
                  ),
                  SearchFlightsPage(),
                  WatchlistPage(),
                  SettingsPage(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                context.bloc<BottomNavBarCubit>().changeNavBarItem(index);
                context.bloc<BottomNavBarCubit>().pageTransitionEffect(_pageController);
              },
              currentIndex: state,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: 'Flights',
                  icon: Icon(Icons.flight),
                ),
                BottomNavigationBarItem(
                  label: 'Watchlist',
                  icon: Icon(Icons.favorite),
                ),
                BottomNavigationBarItem(
                  label: 'Settings',
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
