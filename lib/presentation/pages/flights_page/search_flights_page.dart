import 'package:flutter/material.dart';

class SearchFlightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Flights'),
      ),
      backgroundColor: Colors.grey[200],
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Card(
          margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 45.0,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'Search Flights',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.lerp(
                      BorderRadius.circular(15.0),
                      BorderRadius.circular(20.0),
                      0.35,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
