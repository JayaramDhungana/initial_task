import 'package:flutter/material.dart';

Column headingWidgets({
  required BuildContext context,
  required String mainTitle,
  required String titelDescription,
}) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            mainTitle,
            style: TextTheme.of(
              context,
            ).bodyLarge!.copyWith(fontWeight: FontWeight.w800),
          ),
          Spacer(),
          Text(
            "See all",

            style: TextTheme.of(context).bodyMedium!.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          ),
        ],
      ),
      Row(
        children: [
          Text(
            maxLines: 2,
            titelDescription,
            style: TextTheme.of(context).bodyMedium!.copyWith(fontSize: 15),
          ),
        ],
      ),
    ],
  );
}
