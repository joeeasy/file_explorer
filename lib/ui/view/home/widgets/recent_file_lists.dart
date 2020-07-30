import 'dart:io';

import 'package:Explorer/ui/view/home/home_viewmodel.dart';
import 'package:Explorer/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:Explorer/utils/extension_methods/extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class RecentFileList extends HookWidget {
  final List<FileSystemEntity> recentFiles;
  final HomeViewModel model;

  RecentFileList({@required this.recentFiles, this.model});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          loger(
            loggerText: 'recentFiles[index].path.toString()',
            e: recentFiles[index].path,
          );
          var file = model?.fileList[index].path;
          return GestureDetector(
            onTap: () {
              if (!file.isImage()) {
                model.initVideoPlayerController(file);
              }
            },
            child: Container(
              padding: EdgeInsets.all(8),
              child: OverflowBox(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: file.isImage() ? BoxFit.fitHeight : BoxFit.fitHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RenderMediaTypes(
                        model: model,
                        index: index,
                      ),
                      Text(
                        recentFiles[index]?.path?.getFileName(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        childCount: recentFiles.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
    );
  }
}

class RenderMediaTypes extends StatelessWidget {
  const RenderMediaTypes({
    Key key,
    this.index,
    this.model,
  }) : super(key: key);

  final HomeViewModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    var file = model?.fileList[index].path;
    var isImage = file.isImage();
    if (!file.isImage()) {
      model.initVideoPlayerController(file);
    }

    return (file.isImage())
        ? Image.file(
            model.fileList[index],
            fit: BoxFit.fitHeight,
            height: 60,
            width: 60,
          )
        : Stack(children: <Widget>[
            Container(
              height: 60 / model.controller.value.aspectRatio,
              width: 60,
              child: VideoPlayer(model.controller),
            ),
            Container(
              height: 60,
              width: 60,
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.play_circle_outline,
                  size: 60,
                  color: Colors.white.withOpacity(0.2/**/),
                ),
              ),
            )
          ]);
  }
}
