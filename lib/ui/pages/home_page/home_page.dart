import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/ui/pages/home_page/local_widgets/wave_clipper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ClipPath(
          clipper: WaveClipper(),
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(Icons.place, color: Colors.white, size: 16.0),
                        SizedBox(width: 12.0),
                        Text(
                          'Boston (BOS)',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ],
                    ),
                    trailing: InkWell(
                      onTap: () {},
                      child: IconButton(
                        icon: Icon(Icons.settings, color: Colors.white, size: 16.0),
                        onPressed: () {
                          print('cliucked');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
