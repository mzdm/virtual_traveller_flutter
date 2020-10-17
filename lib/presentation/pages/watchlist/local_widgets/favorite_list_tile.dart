import 'package:flutter/material.dart';

class FavoriteListTile extends StatefulWidget {
  FavoriteListTile({
    @required this.cityCode,
    @required this.cityName,
    this.onPressed,
  }) : assert(cityName != null);

  final String cityCode;
  final String cityName;
  final VoidCallback onPressed;

  @override
  _FavoriteListTileState createState() => _FavoriteListTileState();
}

class _FavoriteListTileState extends State<FavoriteListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        onTap: widget.onPressed,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14.0),
        leading: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 45.0,
              width: 45.0,
            ),
            Text(
              widget.cityCode,
              style: TextStyle(
                fontSize: 20.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        title: Text(widget.cityName),
        trailing: Padding(
          padding: const EdgeInsets.only(right: 3.0),
          child: Icon(Icons.drag_handle),
        ),
      ),
    );
  }
}
