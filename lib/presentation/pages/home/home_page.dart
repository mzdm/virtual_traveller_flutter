import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_traveller_flutter/blocs/home/flight_destination_search_switcher/flight_destination_search_switcher_cubit.dart';
import 'package:virtual_traveller_flutter/presentation/pages/home/local_widgets/flight_destination_search_switcher.dart';

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
  TextEditingController _textEditingController;

  String _labelTextFieldText = '';

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
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      children: [
                        buildWaveDepartureSettingsContent(),
                        SizedBox(height: 40.0),
                        ...buildWaveSearchContent(context),
                      ],
                    ),
                  ),
                ),
              ),
              buildBottomContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWaveDepartureSettingsContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: ListTile(
        title: Row(
          children: <Widget>[
            SizedBox(width: 12.0),
            Icon(Icons.place, color: Colors.white, size: 16.0),
            SizedBox(width: 12.0),
            Text(
              'Boston (BOS)',
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.settings, color: Colors.white, size: 16.0),
          onPressed: widget.onSettingsTap,
        ),
      ),
    );
  }

  List<Widget> buildWaveSearchContent(BuildContext context) {
    return <Widget>[
      Text(
        'I would like to go ...',
        style: TextStyle(
          color: Colors.white,
          fontSize: 23.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 35.0),
      Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.10,
          bottom: 5.0,
        ),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: BlocBuilder<FlightDestinationSearchSwitcherCubit, int>(
            builder: (context, state) {
              return Text(
                (_labelTextFieldText == '')
                    ? ''
                    : state == 0
                        ? 'Quick one-way search'
                        : 'Quick destination preview',
                style: TextStyle(color: Colors.white60, fontSize: 12.0),
              );
            },
          ),
        ),
      ),
      SizedBox(
        height: 45.0,
        width: MediaQuery.of(context).size.width * .85,
        child: TextField(
          onTap: () => setState(() => _labelTextFieldText = 'Quick one-way search'),
          controller: _textEditingController,
          showCursor: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15.0),
            filled: true,
            fillColor: Colors.grey[200],
            hintText: 'New York',
            hintStyle: TextStyle(fontSize: 15.0),
            suffixIcon: SizedBox(
              width: 50.0,
              child: RaisedButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  FocusManager.instance.primaryFocus.unfocus();
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
      ),
      SizedBox(height: 15.0),
      BlocBuilder<FlightDestinationSearchSwitcherCubit, int>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO: bloc state handler
              FlightDestinationSearchSwitcher(
                icon: Icons.flight_outlined,
                label: 'Flights',
                isPressed: state == 0,
                onPressed: () {
                  context.bloc<FlightDestinationSearchSwitcherCubit>().switchType(state);
                },
              ),
              SizedBox(width: 15.0),
              FlightDestinationSearchSwitcher(
                icon: Icons.beach_access,
                label: 'Destinations',
                isPressed: state == 1,
                onPressed: () {
                  context.bloc<FlightDestinationSearchSwitcherCubit>().switchType(state);
                },
              ),
            ],
          );
        },
      ),
    ];
  }

  Widget buildBottomContent() {
    final sampleData = <String>[
      'London',
      'Prague',
      'Barcelona',
      'Stockholm',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
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

          // TODO: Recommended flights
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
}
