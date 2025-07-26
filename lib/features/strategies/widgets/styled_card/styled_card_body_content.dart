import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

class StyledCardBodyContent extends StatelessWidget {
  const StyledCardBodyContent({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: content,
      styleSheet: MarkdownStyleSheet(
        p: TextStyle(fontSize: 16),
        listBullet: TextStyle(fontSize: 16)
      ),
    );
  }
}

