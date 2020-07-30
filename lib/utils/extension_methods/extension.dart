import 'package:Explorer/utils/helpers.dart';
import 'package:flutter_file_utils/utils.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

extension CustomString on String {
  String getFileName() {
    return getBaseName(this);
  }

  bool isImage() {
    var fileType = this
        .trim()
        .split('.')
        .last;
    loger(e: fileType,);
    if (fileType == 'mp4') {
      return false;
    } else {
      return true;
    }
  }
}