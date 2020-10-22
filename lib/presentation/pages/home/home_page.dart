import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:virtual_traveller_flutter/blocs/home/flight_destination_switcher_cubit.dart';
import 'package:virtual_traveller_flutter/data/models/airport.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

import 'local_widgets/flight_destination_search_switcher.dart';
import 'local_widgets/rounded_card.dart';
import 'local_widgets/wave_clipper.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
    @required this.onSettingsTap,
  }) : super(key: key);

  final VoidCallback onSettingsTap;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _textEditingController;

  String _labelTextFieldText;
  String _searchSelectedCity;
  bool _suggestionBoxVisible = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: !_suggestionBoxVisible
                ? () {}
                : () => FocusManager.instance.primaryFocus.unfocus(),
            child: Column(
              children: [
                buildWaveContents(context),
                buildBottomContents(),
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
              buildDepartureSettingsContent(),
              SizedBox(height: 40.0),
              buildHeader(),
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
  Widget buildDepartureSettingsContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          SizedBox(width: 12.0),
          Icon(Icons.place, color: Colors.white, size: 16.0),
          SizedBox(width: 12.0),
          Text(
            'Boston (BOS)',
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
          Spacer(flex: 1),
          ClipRRect(
            borderRadius: BorderRadius.circular(60.0),
            child: Material(
              type: MaterialType.transparency,
              child: IconButton(
                icon: Icon(Icons.settings, color: Colors.white, size: 16.0),
                onPressed: (widget.onSettingsTap),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Text(
      'I would like to go ...',
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
        child: BlocBuilder<FlightDestinationSwitcherCubit, int>(
          builder: (context, state) {
            return Text(
              (_labelTextFieldText == null)
                  ? ''
                  : state == 0
                      ? 'Quick one-way search (e.g.: BOS)'
                      : 'Quick destination preview (e.g.: BOS)',
              style: TextStyle(color: Colors.white60, fontSize: 12.0),
            );
          },
        ),
      ),
    );
  }

  // TODO: Probably create a new bloc which should handle validators, ...
  Widget buildSuggestionSearch(BuildContext context) {
    return SizedBox(
      height: 45.0,
      width: MediaQuery.of(context).size.width * .85,
      child: BlocBuilder<FlightDestinationSwitcherCubit, int>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _textEditingController,
                onTap: _labelTextFieldText == null
                    ? () => setState(() => _labelTextFieldText = '')
                    : () {},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'BOS (Boston)',
                  hintStyle: TextStyle(fontSize: 15.0),
                  suffixIcon: SizedBox(
                    width: 50.0,
                    child: RaisedButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        _suggestionBoxVisible = false;
                        FocusManager.instance.primaryFocus.unfocus();
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Searched city code: $_searchSelectedCity'),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              suggestionsCallback: (pattern) {
                return context
                    .repository<AmadeusRepository>()
                    .getAirportCitySearch(pattern);
              },
              itemBuilder: (context, suggestion) {
                final airport = suggestion as Airport;

                return ListTile(
                  dense: true,
                  title: Text(airport.address.cityCode),
                  subtitle: Text(airport.cityName),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                _suggestionBoxVisible = true;

                return SizedBox(
                  height: 150.0,
                  child: suggestionsBox,
                );
              },
              onSuggestionSelected: (suggestion) {
                _textEditingController.text =
                    (suggestion as Airport).address.cityCode;
              },
              validator: (value) {
                if (value.isEmpty) {
                  // return 'Nothing was selected';
                }
              },
              onSaved: (value) => _searchSelectedCity = value,
            ),
          );
        },
      ),
    );
  }

  Widget buildFlightDestinationSwitcher() {
    return BlocBuilder<FlightDestinationSwitcherCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlightDestinationSearchSwitcher(
              icon: Icons.flight_outlined,
              label: 'Flights',
              isPressed: state == 0,
              onPressed: () {
                context.bloc<FlightDestinationSwitcherCubit>().switchType();
              },
            ),
            SizedBox(width: 15.0),
            FlightDestinationSearchSwitcher(
              icon: Icons.beach_access,
              label: 'Destinations',
              isPressed: state == 1,
              onPressed: () {
                context.bloc<FlightDestinationSwitcherCubit>().switchType();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildBottomContents() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          ...buildMostPopular(),
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

  // TODO: Replace mocked data with bloc & AmadeusRepository
  List<Widget> buildMostPopular() {
    final sampleData = <String>[
      'London',
      'Prague',
      'Barcelona',
      'Stockholm',
    ];

    return [
      SizedBox(height: 25.0),
      Align(
        alignment: AlignmentDirectional.bottomStart,
        child: Text(
          'Most popular',
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
        child: ListView.builder(
          itemCount: sampleData.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: RoundedCard(
                sample: sampleData[index],
                onTap: () {},
              ),
            );
          },
        ),
      ),
    ];
  }
}
