import 'package:flutter/material.dart';

Widget screenWidget({
  required BuildContext context,
  required String imageUrl,
  required String name,
  required String description,
  required double ratings,
  required int raters,
}) {
  final theme = Theme.of(context).textTheme;

  return Center(
    child: Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: theme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: theme.bodyMedium!.copyWith(color: Colors.black),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(
                  ratings.toStringAsFixed(1),
                  style: theme.bodyLarge!.copyWith(color: Colors.black),
                ),
                const SizedBox(width: 8),
                Text(
                  '($raters reviews)',
                  style: theme.bodySmall!.copyWith(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
