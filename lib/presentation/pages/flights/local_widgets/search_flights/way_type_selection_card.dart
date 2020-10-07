import 'package:flutter/material.dart';

class WayTypeSelectionCard extends StatelessWidget {
  const WayTypeSelectionCard({
    Key key,
    @required this.label,
    @required this.onTap,
    @required this.isSelected,
  })  : assert(label != null),
        assert(isSelected != null),
        super(key: key);

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Card(
        elevation: 0.45,
        margin: EdgeInsets.all(0.0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(10.0, 10.0)),
        ),
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black.withOpacity(0.35),
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          ),
        ),
        color: isSelected ? Theme.of(context).primaryColor : Colors.white,
      ),
    );
  }
}
