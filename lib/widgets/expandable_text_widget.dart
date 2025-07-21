// expandable_text.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:initial_task/provider/expandable_text_provider.dart';
// import your provider

class ExpandableTextWidget extends ConsumerWidget {
  final String text;
  final int trimLines;

  const ExpandableTextWidget({
    super.key,
    required this.text,
    this.trimLines = 3,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expandProvider = ref.watch(expandableTextProvider);
    final notifier = ref.read(expandableTextProvider.notifier);

    final textSpan = TextSpan(
      text: text,
      style: TextStyle(color: Colors.white, fontSize: 12),
    );

    return LayoutBuilder(
      builder: (context, size) {
        final textPainter = TextPainter(
          text: textSpan,
          maxLines: trimLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: size.maxWidth);

        final isOverflow = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              maxLines: expandProvider.isExpanded ? null : trimLines,
              overflow: expandProvider.isExpanded
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            if (isOverflow)
              InkWell(
                onTap: () => notifier.changeExpanded(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Text(
                        expandProvider.isExpanded ? "See less" : "Read More",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,

                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        expandProvider.isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
