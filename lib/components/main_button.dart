import 'package:flutter/material.dart';
import '../constants.dart';

class MainButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onTab;

  MainButton({required this.btnText, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
          child: Text(
            btnText,
            style: KLargeTextStyle,
          ),
        ),
      ),
    );
  }
}