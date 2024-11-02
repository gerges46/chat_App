import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)),
      snackBarAnimationStyle: AnimationStyle(
          duration: const Duration(seconds: 2),
          curve: Curves.bounceInOut,
          reverseCurve: Curves.easeIn),);
}
