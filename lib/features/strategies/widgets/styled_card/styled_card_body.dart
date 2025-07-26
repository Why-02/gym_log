
import 'package:flutter/material.dart';
import 'package:gym_log/features/strategies/widgets/styled_card/styled_card_body_content.dart';
import 'package:gym_log/features/strategies/widgets/styled_card/styled_card_body_image.dart';
import 'package:gym_log/features/strategies/widgets/styled_card/styled_card_body_title.dart';

class StyledCardBody extends StatelessWidget {
  final String title;
  final String content;
  final String? imagePath;
  final bool initiallyExpanded;

  const StyledCardBody({
    super.key,
    required this.title,
    required this.content,
    required this.imagePath,
    this.initiallyExpanded = false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            shape: Border(),
            initiallyExpanded: initiallyExpanded,
            title: StyledCardBodyTitle(title: title),
            children: [
              const SizedBox(height: 12),
              StyledCardBodyContent(content: content),
              if (imagePath != null)
                StyledCardBodyImage(imagePath: imagePath),
            ],
          ),
        ],
      ),
    );
  }
}