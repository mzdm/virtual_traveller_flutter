import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shimmer/shimmer.dart';
import 'package:virtual_traveller_flutter/blocs/home/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:virtual_traveller_flutter/blocs/home/event/logo_counter_cubit.dart';
import 'package:virtual_traveller_flutter/blocs/home/flight_destination_switcher/flight_destination_switcher_cubit.dart';
import 'package:virtual_traveller_flutter/blocs/home/most_popular_destinations/most_popular_destinations_cubit.dart';
import 'package:virtual_traveller_flutter/consts/local_keys.dart';
import 'package:virtual_traveller_flutter/data/models/airport.dart';
import 'package:virtual_traveller_flutter/data/models/destination.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';
import 'package:virtual_traveller_flutter/utils/responsive_extensions.dart';

import 'local_widgets/flight_destination_search_switcher.dart';
import 'local_widgets/rounded_card.dart';
import 'local_widgets/wave_clipper.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
    this.onSettingsTap,
  }) : super(key: key);

  final VoidCallback onSettingsTap;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _textEditingController;

  String _keywordSearchTextFieldText;
  String _suffixFullCityTextFieldText = '';
  bool _suggestionBoxVisible = false;
  bool _searchSubmitted = false;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void searchSubmitted() {
    _searchSubmitted = true;
    Future.delayed(
      Duration(seconds: 3),
      () => _searchSubmitted = false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(toolbarHeight: 0.0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: !_suggestionBoxVisible
                ? () {}
                : () => FocusManager.instance.primaryFocus.unfocus(),
            child: Column(
              children: [
                buildWaveContents(context),
                buildBottomContents(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWaveContents(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .5,
      child: ClipPath(
        clipper: WaveClipper(),
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              buildDepartureSettingsContent(context),
              SizedBox(height: 40.0),
              buildTitleHeader(),
              SizedBox(height: 35.0),
              buildSearchLabel(context),
              buildSuggestionSearch(context),
              SizedBox(height: 15.0),
              buildFlightDestinationSwitcher(),
            ],
          ),
        ),
      ),
    );
  }

  // TODO: Create separate widget
  Widget buildDepartureSettingsContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          SizedBox(width: 12.0),
          Icon(Icons.place, color: Colors.white, size: 16.0),
          SizedBox(width: 12.0),
          Text(
            'OSL, Oslo',
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
          Spacer(flex: 1),
          ClipRRect(
            borderRadius: BorderRadius.circular(60.0),
            child: Material(
              type: MaterialType.transparency,
              child: IconButton(
                icon: Icon(
                  Icons.settings,
                  key: Key(LocalKeys.waveSettingsIcon),
                  color: Colors.white,
                  size: 16.0,
                ),
                onPressed: widget.onSettingsTap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitleHeader() {
    return Text(
      'Let me sail to ...',
      style: TextStyle(
        color: Colors.white,
        fontSize: 23.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildSearchLabel(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.10,
        bottom: 5.0,
      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Builder(
          builder: (context) {
            return Text(
              (_keywordSearchTextFieldText == null)
                  ? ''
                  : context.watch<FlightDestinationSwitcherCubit>().state == 0
                      ? 'Quick one-way search (e.g.: BOS)'
                      : 'Quick destination preview (e.g.: BOS)',
              style: TextStyle(color: Colors.white60, fontSize: 12.0),
            );
          },
        ),
      ),
    );
  }

  // TODO: PRIORITY! This code below is a big MESS. Should be moved to separate bloc ... !!
  // TODO: Sometimes 'No items' displays while items in SuggestionBox are loading
  Widget buildSuggestionSearch(BuildContext context) {
    return SizedBox(
      height: 45.0,
      width: context.isMobileSize
          ? context.screenWidth * .85
          : context.screenWidth * .65,
      child: BlocBuilder<FlightDestinationSwitcherCubit, int>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _textEditingController,
                onTap: _keywordSearchTextFieldText == null
                    ? () => setState(() => _keywordSearchTextFieldText = '')
                    : () {},
                onChanged: (value) {
                  setState(() => _suffixFullCityTextFieldText = '');
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'LON (London)',
                  suffixText: _suffixFullCityTextFieldText,
                  suffixStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                  hintStyle: TextStyle(fontSize: 15.0),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: SizedBox(
                      width: 50.0,
                      child: RaisedButton(
                        padding: EdgeInsets.all(0.0),
                        onPressed: () {
                          _suggestionBoxVisible = false;
                          FocusManager.instance.primaryFocus.unfocus();

                          final _searchedCity = _textEditingController.text;
                          if (_searchedCity.length != 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please enter a valid city code (3 letters)\nFor example for Boston city search: BOS',
                                ),
                              ),
                            );
                          } else {
                            searchSubmitted();
                            // TODO: Navigate to next page (Flight results page or Destination page)
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    // 'Searched city code: $_searchedCity. Loading ...',
                                    'Searching for tickets is not available yet.'),
                              ),
                            );
                          }
                        },
                        child: Icon(
                          Icons.search,
                          size: 16.0,
                          color: Colors.grey,
                        ),
                        color: Colors.white,
                        elevation: 7.0,
                        highlightElevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              noItemsFoundBuilder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'No available cities found',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).disabledColor,
                      fontSize: 16.0,
                    ),
                  ),
                );
              },
              // ignore: missing_return
              suggestionsCallback: (keyword) {
                // TODO: When user clicks on any suggestion, Suggestion Box will dismiss,
                // and when user clicks again into the TextField it will call with the same
                // value inside the TextField. This causes too much same API calls, so this
                // should be cached.
                if (keyword != '' && !_searchSubmitted) {
                  return context
                      .read<AmadeusRepository>()
                      .getAirportCitySearch(keyword);
                }
              },
              debounceDuration: _textEditingController.text.length == 1
                  ? Duration(milliseconds: 0)
                  : Duration(milliseconds: 750),
              itemBuilder: (context, suggestion) {
                final airportAddress = (suggestion as Airport).address;

                return ListTile(
                  dense: true,
                  title: Text(airportAddress.cityCode),
                  subtitle: Text(
                      '${airportAddress.cityName}, ${airportAddress.countryName}'),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                _suggestionBoxVisible = true;

                /// First condition:
                /// Checks whether the TextField on clicking contains text.
                /// If doesn't, then don't show Suggestion Box (because it needs some input
                /// in order to search something).
                ///
                /// Second condition:
                /// When clicking on Search icon and if validating was successful
                /// it would display Suggestion Search Box, but it shouldn't
                /// because user would have a loading animation and
                /// navigating to the Flight result page.
                ///
                /// So _searchSubmitted checks if the button wasn't pressed in the last
                /// 3 seconds.
                if (_textEditingController.value.text != '' &&
                    !_searchSubmitted) {
                  return SizedBox(
                    height: 150.0,
                    child: suggestionsBox,
                  );
                }
              },
              onSuggestionSelected: (suggestion) {
                final airport = suggestion as Airport;
                _textEditingController.text = airport.address.cityCode;
                setState(() =>
                    _suffixFullCityTextFieldText = airport.address.cityName);
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildFlightDestinationSwitcher() {
    return Builder(
      builder: (context) {
        final switcherState =
            context.watch<FlightDestinationSwitcherCubit>().state;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlightDestinationSearchSwitcher(
              // icon: Icons.flight_outlined,
              // label: 'Flights',
              // author: Smashicons, source: https://www.flaticon.com/free-icon/viking-ship_302094?term=viking%20ship&page=1&position=20
              label: 'Sails',
              icon: SvgPicture.asset(
                'assets/icons/viking_ship.svg',
                width: 22.0,
                height: 22.0,
                color: Colors.white,
              ),
              isPressed: switcherState == 0,
              onPressed: () {
                context.read<FlightDestinationSwitcherCubit>().switchType();
              },
            ),
            SizedBox(width: 20.0),
            FlightDestinationSearchSwitcher(
              // icon: Icons.beach_access,
              icon: Icon(
                Icons.beach_access,
                size: 22.0,
                color: Colors.white,
              ),
              label: 'Destinations',
              isPressed: switcherState == 1,
              onPressed: () {
                context.read<FlightDestinationSwitcherCubit>().switchType();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildBottomContents(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          ...buildMostPopular(context),
          // TODO: Recommended destinations
          /*
          SizedBox(height: 35.0),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Text(
              'Recommended for you',
              style: TextStyle(
                color: Colors.black,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          */
        ],
      ),
    );
  }

  // TODO: On Web change scrolling Axis to vertical, possibly use GridView
  // TODO: Remove elevation (on Web ?)
  // TODO: Add to city code also a country name (AirportCitySearch API call needed for that) (heavy on API usage ??)
  List<Widget> buildMostPopular(BuildContext context) {
    return [
      SizedBox(height: 25.0),
      Align(
        alignment: AlignmentDirectional.bottomStart,
        child: Text(
          'Most Popular Raids',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      SizedBox(height: 15.0),
      SizedBox(
        height: 200.0,
        child: BlocBuilder<MostPopularDestinationsCubit,
            MostPopularDestinationsState>(
          builder: (context, state) {
            if (state is MostPopularDestinationsLoading) {
              return buildMostPopularDestinationsLoading();
            }

            if (state is MostPopularDestinationsSuccess) {
              return buildMostPopularDestinationsSuccess(state.data);
            }

            if (state is MostPopularDestinationsFailure) {
              return buildMostPopularDestinationsFailure(
                context,
                errorMessage: state.message,
              );
            }

            return Container();
          },
        ),
      ),
    ];
  }

  Widget buildMostPopularDestinationsLoading() {
    return kIsWeb
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, int index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: DestinationRoundedCard(
                  cityCode: 'Sample',
                  onTap: () {},
                ),
              );
            },
          );
  }

  Widget buildMostPopularDestinationsSuccess(List<Destination> data) {
    return BlocConsumer<LogoCounterCubit, List<String>>(
      listener: (context, state) {
        if (state.contains('most_popular')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Found ${state.length}/3 easter egg.',
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        // TODO: On web horizontal scroll with mouse
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length + 1,
          itemBuilder: (_, index) {
            if (!state.contains('most_popular')) {
              if (index == data.length) {
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<LogoCounterCubit>()
                          .logoFound('most_popular');
                    },
                    child: SvgPicture.asset(
                      'assets/icons/logo.svg',
                      width: 48.0,
                      height: 48.0,
                    ),
                  ),
                );
              }
            }

            if (index <= data.length - 1) {
              return Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: DestinationRoundedCard(
                  cityCode: data[index].name,
                  assetNum: index > 4 ? index % 5 : index,
                  // TODO: Navigate to destination page (with flight search button, if it matches with current location then hide)
                  onTap: () {
                    print(data[index].name);
                  },
                ),
              );
            }

            return Container();
          },
        );
      },
    );
  }

  Widget buildMostPopularDestinationsFailure(
    BuildContext context, {
    @required String errorMessage,
  }) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Text(
          errorMessage,
          style: TextStyle(
            color: Theme.of(context).errorColor,
          ),
        ),
      ),
    );
  }
}
