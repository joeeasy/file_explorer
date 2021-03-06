import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColor {
  static const background = Color(0xffF2F5F8);
  static const brandPrimary = Color(0xff4378DB);
  static const headerText = Color(0xff21205A);
  static const inputText = Color(0xff7C809E);
  static const brandSecondary = Color(0xff405DB5);

  static const darkPreviewTheme = SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    systemNavigationBarColor: Colors.black,
  );

  static const lightPreviewTheme = SystemUiOverlayStyle(
   statusBarColor: Colors.white,
   systemNavigationBarColor: Colors.white,
  );
}
