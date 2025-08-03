import 'package:flutter/material.dart';

class IconInfo extends StatelessWidget {
  const IconInfo({super.key, required this.iconAsset, required this.textColor});

  final String iconAsset;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconAsset,
      width: 25,
      height: 25,
      fit: BoxFit.fill,
      color: textColor,
    );
  }
}