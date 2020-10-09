import 'package:flutter/material.dart';

class FlightDestinationSearchSwitcher extends StatelessWidget {
  const FlightDestinationSearchSwitcher({
    Key key,
    this.onPressed,
    @required this.icon,
    @required this.label,
    this.isPressed = false,
  })  : assert(icon != null),
        assert(label != null),
        assert(isPressed != null),
        super(key: key);

  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            size: 16.0,
            color: Colors.white,
          ),
          SizedBox(width: 6.0),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      color: isPressed ? Colors.black.withAlpha(50) : Colors.transparent,
      elevation: 0.0,
      highlightElevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
    );
  }
}
