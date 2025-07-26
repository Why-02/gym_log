
import 'package:flutter/material.dart';
import 'package:git_log/features/strategies/widgets/styled_card/styled_card_body_content.dart';
import 'package:git_log/features/strategies/widgets/styled_card/styled_card_body_image.dart';
import 'package:git_log/features/strategies/widgets/styled_card/styled_card_body_title.dart';

class StyledCardBody extends StatelessWidget {
  const StyledCardBody({
    super.key,
    required this.title,
    required this.content,
    required this.imagePath,
  });

  final String title;
  final String content;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StyledCardBodyTitle(title: title),
          const SizedBox(height: 12),
          StyledCardBodyContent(content: content),
          if (imagePath != null)
            StyledCardBodyImage(imagePath: imagePath),
        ],
      ),
    );
  }
}