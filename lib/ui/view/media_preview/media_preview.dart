import 'dart:io';

import 'package:Explorer/constants/colors.dart';
import 'package:Explorer/ui/view/media_preview/media_preview_viewmodel.dart';
import 'package:Explorer/ui/view/media_preview/widgets/video_player.dart';
import 'package:Explorer/utils/extension_methods/extension.dart';
import 'package:Explorer/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:photo_view/photo_view.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class MediaPreviewScreen extends HookWidget {
  final List<FileSystemEntity> files;
  final FileSystemEntity current;
  final int currentIndex;
  final VideoPlayerController videoPlayerController;

  MediaPreviewScreen(this.videoPlayerController,
      {this.files, this.current, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MediaPreviewViewModel>.nonReactive(
      onModelReady: (model) {
        if(!files[currentIndex].path.isImage()) {
          loger(e: currentIndex, loggerText: 'Index from media preview');
        }
        model.initializeMediaSettings();
      },
      builder: (context, model, child) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppColor.darkPreviewTheme,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.black,
          body: Container(
            child: Center(
              child: files[currentIndex].path.isImage()
                  ? PhotoView(
                      imageProvider: FileImage(
                        File(
                          files[currentIndex].path,
                        ),
                      ),
                    )
                  : VideoPlayerWidget(
                      files[currentIndex].path,
                    ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => MediaPreviewViewModel(),
    );
  }
}
