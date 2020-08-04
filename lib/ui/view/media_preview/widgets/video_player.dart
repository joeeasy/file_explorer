import 'package:Explorer/ui/view/home/widgets/video_thumbnail/video_thumbnail_view_model.dart';
import 'package:Explorer/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends HookWidget {
  final String filePath;

  VideoPlayerWidget(this.filePath);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VideoThumbNailViewModel>.nonReactive(
      builder: (context, model, child) => model.controller != null
          ? Stack(
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: SizedBox(
                    height: mediaQueryVertical(context, 1)/model.controller.value.aspectRatio,
                    width: mediaQueryHorizontal(context, 1),
                    child: VideoPlayer(
                      model.controller,
                    ),
                  ),
                ),
              ],
            )
          : CircularProgressIndicator(),
      viewModelBuilder: () => VideoThumbNailViewModel(),
      onModelReady: (model) {
        model.initVideoPlayerController(filePath);
      },
    );
  }
}
