import 'package:flutter/material.dart';
import 'package:git_log/features/strategies/widgets/styled_card/styled_card_body.dart';

class StyledCard extends StatelessWidget {
  final String title;
  final String content;
  final String? imagePath;

  const StyledCard({
    super.key,
    required this.title,
    required this.content,
    this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: StyledCardBody(title: title, content: content, imagePath: imagePath),
    );
  }
}






