import 'package:flutter/cupertino.dart';

Widget gameButtonWithImage(
    void Function()? onTap, String? imagePath, double width) {
  return GestureDetector(
    onTap: onTap,
    child: Image.asset(
      imagePath!,
      width: width,
    ),
  );
}
