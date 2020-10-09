import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_traveller_flutter/blocs/bloc_observer.dart';
import 'package:virtual_traveller_flutter/blocs/home/flight_destination_search_switcher/flight_destination_search_switcher_cubit.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/api_service.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/mocked_data.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/remote_data.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';
import 'package:virtual_traveller_flutter/utils/debug_options.dart';
import 'package:virtual_traveller_flutter/utils/theme_utils.dart';

import 'blocs/home/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'presentation/pages/flights/search_flights_page.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/settings/settings_page.dart';
import 'presentation/pages/watchlist/watchlist_page.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: ColorUtils.primaryDefaultColorBlue,
    ),
  );

  final amadeusBaseDataProvider = DebugOptions.quotaSaveMode
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
          BlocProvider<BottomNavBarCubit>(
            create: (_) => BottomNavBarCubit(),
          ),
        ],
        child: MainApp(),
      ),
    ),
  );
}

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
      theme: ThemeUtils.defaultDarkBlueTheme,
      home: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                BlocProvider<FlightDestinationSearchSwitcherCubit>(
                  create: (_) => FlightDestinationSearchSwitcherCubit(),
                  child: HomePage(
                    onSettingsTap: () {
                      context.bloc<BottomNavBarCubit>().changeNavBarItem(3);
                      context.bloc<BottomNavBarCubit>().pageTransitionEffect(
                            _pageController,
                            isFromSettingsIcon: true,
                          );
                    },
                  ),
                ),
                SearchFlightsPage(),
                WatchlistPage(),
                SettingsPage(),
              ],
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
