import 'package:flutter/material.dart';

class RoundedIconCard extends StatelessWidget {
  const RoundedIconCard({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.0,
      child: Card(
        elevation: 2.5,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: child,
        ),
      ),
    );
  }
}
