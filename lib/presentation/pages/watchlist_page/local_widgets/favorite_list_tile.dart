import 'package:flutter/material.dart';

class FavoriteListTile extends StatefulWidget {
  FavoriteListTile({
    @required this.item,
    this.onPressed,
  }) : assert(item != null);

  final String item;
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
              decoration: ShapeDecoration(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
              // BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.cover,
              //     image: NetworkImage(widget.assetUrl),
              //   ),
              // )
            ),
            Icon(
              Icons.beach_access,
              color: Colors.white,
              size: 25.0,
            ),
          ],
        ),
        title: Text(widget.item),
        trailing: Padding(
          padding: const EdgeInsets.only(right: 3.0),
          child: Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
