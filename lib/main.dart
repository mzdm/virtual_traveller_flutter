import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_traveller_flutter/blocs/bloc_observer.dart';
import 'package:virtual_traveller_flutter/blocs/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:virtual_traveller_flutter/utils/theme_utils.dart';

import 'presentation/pages/flights_page/search_flights_page.dart';
import 'presentation/pages/home_page/home_page.dart';
import 'presentation/pages/settings_page/settings_page.dart';
import 'presentation/pages/watchlist_page/watchlist_page.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: ColorUtils.primaryDefaultColorBlue,
    ),
  );

  runApp(
    BlocProvider<BottomNavBarCubit>(
      create: (_) => BottomNavBarCubit(),
      child: MainApp(),
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
                HomePage(
                  onSettingsTap: () {
                    context.bloc<BottomNavBarCubit>().changeNavBarItem(3);
                    context.bloc<BottomNavBarCubit>().pageTransitionEffect(
                          _pageController,
                          isFromSettingsIcon: true,
                        );
                  },
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
              currentIndex: context.bloc<BottomNavBarCubit>().state,
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
