import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_traveller_flutter/blocs/home/event/logo_counter_cubit.dart';
import 'package:virtual_traveller_flutter/blocs/settings/settings_bloc.dart';
import 'package:virtual_traveller_flutter/utils/responsive_extensions.dart';

import 'blocs/bloc_observer.dart';
import 'blocs/home/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'blocs/home/flight_destination_switcher/flight_destination_switcher_cubit.dart';
import 'blocs/home/most_popular_destinations/most_popular_destinations_cubit.dart';
import 'config/app/debug_config.dart';
import 'config/theme/theme_config.dart';
import 'data/data_providers/remote/amadeus_api/api_service.dart';
import 'data/data_providers/remote/amadeus_api/fake_data.dart';
import 'data/data_providers/remote/amadeus_api/remote_data.dart';
import 'data/repositories/amadeus_repository.dart';
import 'ui/pages/flights/search_flights_page.dart';
import 'ui/pages/home/home_page.dart';
import 'ui/pages/settings/settings_page.dart';
import 'ui/pages/watchlist/watchlist_page.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final amadeusBaseDataProvider = DebugConfig.quotaSaveMode
      ? AmadeusFakeDataProvider()
      : AmadeusRemoteDataProvider(ApiService());

  runApp(
    RepositoryProvider<AmadeusRepository>(
      create: (_) => AmadeusRepository(
        amadeusBaseDataProvider: amadeusBaseDataProvider,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SettingsBloc>(
            create: (_) => SettingsBloc(),
          ),
          BlocProvider<BottomNavBarCubit>(
            create: (_) => BottomNavBarCubit(),
          ),
          BlocProvider<LogoCounterCubit>(
            create: (_) => LogoCounterCubit(),
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

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  bool quotaInfoShown = false;

  final pages = <Widget>[
    HomePage(),
    SearchFlightsPage(),
    WatchlistPage(),
    SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.defaultDarkBlueTheme,
      home: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: Builder(
              builder: (context) {
                if (DebugConfig.quotaSaveMode && kIsWeb && !quotaInfoShown) {
                  quotaInfoShown = true;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'App is running in quota save mode. '
                      'This means that the app uses fake data instead API calls. See more in README.',
                    ),
                  ));
                }

                return MultiBlocProvider(
                  providers: [
                    BlocProvider<FlightDestinationSwitcherCubit>(
                      create: (_) => FlightDestinationSwitcherCubit(),
                    ),
                    BlocProvider<MostPopularDestinationsCubit>(
                      create: (_) => MostPopularDestinationsCubit(
                        context.read<AmadeusRepository>(),
                      )..fetchMostPopularDestinations('MAD'),
                    ),
                  ],
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final page = state == 0
                          ? HomePage(
                              onSettingsTap: () {
                                context
                                    .read<BottomNavBarCubit>()
                                    .changeNavBarItem(3);
                                setState(() => _tabController.animateTo(3));
                              },
                            )
                          : pages[state];

                      if (constraints.maxWidth <= 720) {
                        return page;
                      }

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: webMenu(state),
                          ),
                          Flexible(
                            flex: 4,
                            child: page,
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            bottomNavigationBar: context.isMobileSize
                ? buildBottomNavigationBar(
                    context,
                    currentIndex: state,
                  )
                : null,
          );
        },
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(
    BuildContext context, {
    required int currentIndex,
  }) {
    return BottomNavigationBar(
      onTap: (index) {
        context.read<BottomNavBarCubit>().changeNavBarItem(index);
      },
      currentIndex: currentIndex,
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
    );
  }

  Widget webMenu(int currentIndex) {
    return Container(
      height: double.infinity,
      width: 200.0,
      color: Colors.black.withOpacity(0.1),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 50.0),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            selected: _tabController.index == 0 ? true : false,
            onTap: () {
              context.read<BottomNavBarCubit>().changeNavBarItem(0);
              setState(() => _tabController.animateTo(0));
            },
          ),
          SizedBox(height: 20.0),
          ListTile(
            leading: Icon(Icons.flight),
            title: Text('Flights'),
            selected: _tabController.index == 1 ? true : false,
            onTap: () {
              context.read<BottomNavBarCubit>().changeNavBarItem(1);
              setState(() => _tabController.animateTo(1));
            },
          ),
          SizedBox(height: 5.0),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Watchlist'),
            selected: _tabController.index == 2 ? true : false,
            onTap: () {
              context.read<BottomNavBarCubit>().changeNavBarItem(2);
              setState(() => _tabController.animateTo(2));
            },
          ),
          SizedBox(height: 5.0),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            selected: _tabController.index == 3 ? true : false,
            onTap: () {
              context.read<BottomNavBarCubit>().changeNavBarItem(3);
              setState(() => _tabController.animateTo(3));
            },
          ),
        ],
      ),
    );
  }
}
