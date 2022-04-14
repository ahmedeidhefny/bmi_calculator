import 'package:flutter/material.dart';

class RoundedIconButtom extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  RoundedIconButtom({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 45.0, height: 45.0),
      shape: CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
