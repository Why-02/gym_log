import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:git_log/core/static_data/strategy_data.dart' as strategy_data;

class ProgressiveOverloadSubpage extends StatelessWidget {
  const ProgressiveOverloadSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    final progressiveOverloadDict = strategy_data.progressiveOverloadDict;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Progressive Overload"),
      ),
      body: ListView.builder(
        itemCount: progressiveOverloadDict.length,
        itemBuilder: (context, index) {
          final title = progressiveOverloadDict.keys.elementAt(index);
          final content = progressiveOverloadDict.values.elementAt(index);

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 12),
                  MarkdownBody(
                    data: content,
                    styleSheet: MarkdownStyleSheet(
                      p: TextStyle(fontSize: 16),
                      listBullet: TextStyle(fontSize: 16)
                    ),
                  ),
                  if (index == 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Image.asset(
                        'assets/images/progressive_overload_img.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
