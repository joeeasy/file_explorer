import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

void loger({String loggerText, dynamic e}) {
  print('::::::::::::::::::::::::::::::::::::::$loggerText::::::::::::::::::::::::::::::::::::::::');
  print(e);
  print('::::::::::::::::::::::::::::::::::::::$loggerText::::::::::::::::::::::::::::::::::::::::');

}


double mediaQueryVertical (BuildContext context, double height)  => MediaQuery.of(context).size.height * height;



double mediaQueryHorizontal (BuildContext context, double width)  =>
    MediaQuery.of(context).size.width * width;


Future<Uint8List> getThumbnail(String path) async {
  var uint8list = await VideoThumbnail.thumbnailData(
    video: path,
    imageFormat: ImageFormat.JPEG,
    maxWidth: 80,
    // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
    quality: 25,
  );
  return uint8list;
}