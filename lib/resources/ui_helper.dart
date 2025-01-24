import 'package:flutter/material.dart';

class UIHelper {
  // Vertically Space Provider
  static const Widget verticalSpaceSmall = SizedBox(height: 10.0);
  static const Widget verticalSpaceMedium = SizedBox(height: 20.0);

// Horizontal Space provider
  static const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
  static const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
  static const Widget horizontalSpaceMedium = SizedBox(width: 20.0);

  // Text and Style Provider
  static Widget titleTextStyle(String title, double fntsize, bool isCenterAliignment, {Color fontclr = Colors.black, FontWeight fntweight = FontWeight.normal}) {
    return Text(
      title,
      style: TextStyle(
        color: fontclr,
        fontSize: fntsize,
        decoration: TextDecoration.none,
        fontWeight: fntweight,
        fontFamily: 'RobotoSlab',
      ),
      textAlign: isCenterAliignment ? TextAlign.center : TextAlign.left,
    );
  }

  //Container Style Provider with shadow
  static BoxDecoration roundedBorderWithColor(double radius, Color backgroundColor,
      {Color borderColor = Colors.transparent, double borderWidth = 1, bool isShadow = false, Color shadowcolor = Colors.black45}) {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: Border.all(width: borderWidth, color: borderColor),
        color: backgroundColor,
        boxShadow: isShadow
            ? [
                BoxShadow(
                  color: shadowcolor,
                  offset: const Offset(2, 2),
                  blurRadius: 3.0,
                )
              ]
            : []);
  }
}
