import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Container overViewOptionWidget({
  required Icon icon,
  required String text,
  required BuildContext context,
   VoidCallback? onTap, 
  bool isLast = false,
}) {
  return Container(
    height: 60,
    width: 600,
    decoration: BoxDecoration(
      border:
          isLast
              ? Border(
                top: BorderSide(color: Colors.white),
                bottom: BorderSide(color: Colors.white),
              )
              : Border(top: BorderSide(color: Colors.white)),
    ),
    child: InkWell(
      onTap: onTap,
      child: Ink(
        height: 40,
        child: Row(
          children: [
            icon,
            SizedBox(width: 50),
            Text(
              text,
              style: TextTheme.of(
                context,
              ).bodyLarge!.copyWith(fontWeight: FontWeight.w800),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    ),
  );
}
