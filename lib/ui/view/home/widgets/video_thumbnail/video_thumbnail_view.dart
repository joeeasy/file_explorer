import 'dart:typed_data';

import 'package:Explorer/constants/constants.dart';
import 'package:Explorer/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'video_thumbnail_view_model.dart';

class VideoThumbNail extends StatelessWidget {
  final String filePath;

  const VideoThumbNail({Key key, this.filePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VideoThumbNailViewModel>.reactive(
      builder: (context, model, child) => Stack(children: <Widget>[
        Image.memory(
          Uint8List.fromList(model.getThumbNail(filePath).codeUnits),
          height: 60,
          width: 60,
          fit: BoxFit.fitWidth,
        ),
        Container(
          height: 60,
          width: 60,
          child: Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.play_circle_outline,
              size: 60,
              color: Colors.white.withOpacity(0.3 /**/),
            ),
          ),
        )
      ]),
      viewModelBuilder: () => VideoThumbNailViewModel(),
      onModelReady: (model) async {
//        loger(e: model.getThumbNail(filePath), loggerText: 'Thumbnanil stringified');
      },
    );
  }
}
