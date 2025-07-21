import 'package:flutter/material.dart';

Container travellerChoiceAwards({required BuildContext context}) {
  return Container(
    height: 100,
    width: 350,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.white),
    ),
    child: Row(
      children: [
        SizedBox(
          height: 60,
          width: 70,
          child: Image(
            image: AssetImage("assets/traveller_best_award.png"),
            fit: BoxFit.contain,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Traveller's Choice Awards",
              style: TextTheme.of(context).labelLarge,
            ),
            Text(
              "Best of the Best Winner",
              style: TextTheme.of(context).labelLarge,
            ),
            Text("2025", style: TextTheme.of(context).labelLarge),
          ],
        ),
      ],
    ),
  );
}
