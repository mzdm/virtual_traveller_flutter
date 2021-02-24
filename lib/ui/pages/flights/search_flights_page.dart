import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:virtual_traveller_flutter/blocs/home/event/logo_counter_cubit.dart';
import 'package:virtual_traveller_flutter/consts/asset_names.dart';
import 'package:virtual_traveller_flutter/utils/responsive_extensions.dart';
import 'package:virtual_traveller_flutter/utils/utils.dart';

import 'local_widgets/input_row.dart';
import 'local_widgets/way_type_selection_card.dart';

class SearchFlightsPage extends StatefulWidget {
  @override
  _SearchFlightsPageState createState() => _SearchFlightsPageState();
}

// TODO: SliverAppBar instead AppBar
// TODO: Add interactive widgets (Date, TextField, Search suggestion search ...)
// TODO: Move logic handling to bloc
class _SearchFlightsPageState extends State<SearchFlightsPage> {
  int _wayTypeCurrButtonSelectionIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 86.0,
        elevation: 0.0,
        title: Text(
          'Search Flights',
          style: TextStyle(fontSize: 28.0),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Card(
          margin: EdgeInsets.only(top: 5.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32.0)),
          ),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  context.isMobileSize ? 0.0 : context.screenWidth * 0.07,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 25.0),
                  buildWayTypeSelectionText(),
                  SizedBox(height: 20.0),
                  buildWayTypeButtons(context),
                  SizedBox(height: 45.0),
                  buildInputRows(),
                  SizedBox(height: 45.0),
                  buildSearchButton(context),
                  SizedBox(height: 25.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildInputRows() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 40.0),
      child: Column(
        children: [
          InputRow(
            icon: Icons.location_on,
            label: 'Destination',
            inputLabels: ['From', 'To'],
            inputHintTexts: ['Boston (BOS)', 'New York (JFK)'],
          ),
          SizedBox(height: 45.0),
          InputRow.date(
            icon: Icons.date_range,
            label: 'When',
            inputLabels: ['Depart', 'Return'],
            inputHintTexts: ['Wed, 18 March', 'Tue, 24 March'],
          ),
          SizedBox(height: 25.0),
          Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: BlocConsumer<LogoCounterCubit, List<String>>(
                  listener: (context, state) {
                    if (state.contains('flights')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Found ${state.length}/3 easter egg. #FlutterVikings',
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (!state.contains('flights')) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<LogoCounterCubit>()
                                  .logoFound('flights');
                            },
                            child: SvgPicture.asset(
                              Utils.getIconAsset(
                                  IconAssetNames.flutter_vikings_logo),
                              width: 48.0,
                              height: 48.0,
                            ),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: InputRow.counter(
                  icon: Icons.person,
                  label: 'Passengers',
                  inputLabels: ['Adult', 'Children', 'Infants'],
                  inputHintTexts: ['1', '0', '0'],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildWayTypeSelectionText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nullam eget nisl.',
      ),
    );
  }

  SizedBox buildWayTypeButtons(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 50.0,
      child: Card(
        color: Colors.white,
        elevation: 7.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(10.0, 20.0)),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: WayTypeSelectionCard(
                label: 'One Way',
                isSelected: _wayTypeCurrButtonSelectionIndex == 0,
                onTap: () {
                  setState(() {
                    // save unnecessary potential rebuilds
                    if (_wayTypeCurrButtonSelectionIndex != 0) {
                      _wayTypeCurrButtonSelectionIndex = 0;
                    }
                  });
                },
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: WayTypeSelectionCard(
                label: 'Round Trip',
                isSelected: _wayTypeCurrButtonSelectionIndex == 1,
                onTap: () {
                  setState(() {
                    if (_wayTypeCurrButtonSelectionIndex != 1) {
                      _wayTypeCurrButtonSelectionIndex = 1;
                    }
                  });
                },
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: WayTypeSelectionCard(
                label: 'Multi City',
                isSelected: _wayTypeCurrButtonSelectionIndex == 2,
                onTap: () {
                  setState(() {
                    if (_wayTypeCurrButtonSelectionIndex != 2) {
                      _wayTypeCurrButtonSelectionIndex = 2;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Search Flights',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          // highlightElevation: 0.0,
          backgroundColor:
              MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.lerp(
                BorderRadius.circular(15.0),
                BorderRadius.circular(20.0),
                0.35,
              )!,
            ),
          ),
        ),
      ),
    );
  }
}
