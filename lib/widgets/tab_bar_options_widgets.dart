import 'package:flutter/material.dart';

Container tabBarOptionsWidgets({
  required Color color,
  required Icon icon,
  required String text,
  required bool isSelected,
}) {
  return Container(
    decoration: BoxDecoration(
      color: isSelected ? Colors.white : Colors.green,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon, Text(text)],
      ),
    ),
  );
}
