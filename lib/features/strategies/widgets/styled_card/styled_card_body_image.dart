import 'package:flutter/material.dart';

class StyledCardBodyImage extends StatelessWidget {
  const StyledCardBodyImage({
    super.key,
    required this.imagePath,
  });

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Image.asset(
        imagePath as String,
        fit: BoxFit.cover,
      ),
    );
  }
}