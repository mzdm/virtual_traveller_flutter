import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/data/models/hotel.dart';

class HotelDetailsPage extends StatelessWidget {
  static Route route({
    @required Hotel hotel,
  }) {
    return MaterialPageRoute(
      builder: (_) {
        return HotelDetailsPage();
      },
      settings: RouteSettings(
        arguments: hotel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Hotel hotel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text('Hello $hotel'),
      ),
    );
  }
}
