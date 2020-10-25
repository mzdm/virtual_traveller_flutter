import 'package:flutter/material.dart';

class CategoryRoundedCard extends StatelessWidget {
  const CategoryRoundedCard({
    Key key,
    @required this.title,
    @required this.assetName,
    this.onTap,
  })  : assert(title != null),
        super(key: key);

  final String title;
  final String assetName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.0,
      height: 220.0,
      child: Card(
        elevation: 0.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                image: DecorationImage(
                  image: AssetImage('assets/images/$assetName'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
