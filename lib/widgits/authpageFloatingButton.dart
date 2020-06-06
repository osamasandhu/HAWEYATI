import 'package:flutter/material.dart';

class AuthPageFloatingButton extends StatefulWidget {

  Function onTap;
IconData icon;
  @override
  _AuthPageFloatingButtonState createState() => _AuthPageFloatingButtonState();
}

class _AuthPageFloatingButtonState extends State<AuthPageFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: Color(0xffff974d),

      onPressed:widget.onTap,

      child: Icon(
        widget.icon,
        size: 40,
        color: Colors.white,
      ),
    );
  }
}
