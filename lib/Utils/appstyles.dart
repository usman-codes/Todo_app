import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Appstyles {
  static const headingone =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black);
}

void showCustomFlushbar({
  required BuildContext context,
  required String message,
   required IconData icon,
  required Color backgroundColor,
}) {
  Flushbar(
    message: message,
    duration: const Duration(seconds: 2),
    backgroundColor: backgroundColor,
    flushbarPosition: FlushbarPosition.BOTTOM,
    icon: Icon(
      icon,
      color: Colors.white,
    ),
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
    animationDuration: const Duration(milliseconds: 300),
    reverseAnimationCurve: Curves.bounceIn,
  ).show(context);
}