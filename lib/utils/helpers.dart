import 'package:flutter/material.dart';

void loger({String loggerText, dynamic e}) {
  print('::::::::::::::::::::::::::::::::::::::$loggerText::::::::::::::::::::::::::::::::::::::::');
  print(e);
  print('::::::::::::::::::::::::::::::::::::::$loggerText::::::::::::::::::::::::::::::::::::::::');

}


double mediaQueryVertical (BuildContext context, double height)  => MediaQuery.of(context).size.height * height;



double mediaQueryHorizontal (BuildContext context, double width)  =>
    MediaQuery.of(context).size.width * width;


