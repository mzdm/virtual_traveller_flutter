import 'package:flutter/material.dart';

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
  TextEditingController textEditingController;

  String _labelTextFieldText = '';

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
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
                height: MediaQuery.of(context).size.height * .45,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      children: [
                        buildWaveDepartureContent(),
                        SizedBox(height: 55.0),
                        ...buildWaveFlightContent(context),
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

  Widget buildWaveDepartureContent() {
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

  List<Widget> buildWaveFlightContent(BuildContext context) {
    return <Widget>[
      Text(
        'I would like to visit ...',
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
          child: Text(
            _labelTextFieldText,
            style: TextStyle(color: Colors.white60, fontSize: 12.0),
          ),
        ),
      ),
      SizedBox(
        height: 45.0,
        width: MediaQuery.of(context).size.width * .85,
        child: TextField(
          onTap: () => setState(() => _labelTextFieldText = 'Quick one-way search'),
          controller: textEditingController,
          showCursor: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15.0),
            filled: true,
            fillColor: Colors.white,
            hintText: 'New York (JFK)',
            hintStyle: TextStyle(fontSize: 15.0),
            suffixIcon: Icon(Icons.search, color: Colors.grey, size: 16.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
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
        ],
      ),
    );
  }
}
