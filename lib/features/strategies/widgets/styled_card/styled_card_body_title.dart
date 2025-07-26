import 'package:flutter/material.dart';

class StyledCardBodyTitle extends StatelessWidget {
  const StyledCardBodyTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
    );
  }
}