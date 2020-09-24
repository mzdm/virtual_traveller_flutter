import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/api_service.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/data.dart';

import 'data/data_providers/remote/amadeus_api/base_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AmadeusBaseDataProvider _dataProvider;

  @override
  void initState() {
    super.initState();
    _dataProvider = AmadeusRemoteDataProvider(ApiService());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('name'),
                SizedBox(height: 50),
                MaterialButton(
                  child: Text('TEST'),
                  color: Colors.white,
                  onPressed: () async {
                    final rawData = await _dataProvider.getRawAirlineCodeLookup();
                    print('btn clicked ...\n$rawData');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
