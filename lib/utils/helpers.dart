import 'dart:typed_data';

import 'package:Explorer/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

void loger({String loggerText, dynamic e}) {
  print('::::::::::::::::::::::::::::::::::::::$loggerText::::::::::::::::::::::::::::::::::::::::');
  print(e);
  print('::::::::::::::::::::::::::::::::::::::$loggerText::::::::::::::::::::::::::::::::::::::::');

}


double mediaQueryVertical (BuildContext context, double height)  => MediaQuery.of(context).size.height * height;



double mediaQueryHorizontal (BuildContext context, double width)  =>
    MediaQuery.of(context).size.width * width;


