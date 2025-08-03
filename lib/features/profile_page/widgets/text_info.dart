import 'package:flutter/material.dart';

class TextInfo extends StatelessWidget {
  const TextInfo({
    super.key,
    required this.textColor,
    required this.text,
    required this.textFont,
    required this.width,
  });

  final Color textColor;
  final String text;
  final double textFont;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(
          height: 25 / textFont,
          color: textColor,
          fontSize: textFont,
        ),
      ),
    );
  }
}
