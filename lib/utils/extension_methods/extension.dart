import 'package:Explorer/utils/helpers.dart';
import 'package:flutter_file_utils/utils.dart';

extension CustomString on String {
  String getFileName() {
    return getBaseName(this);
  }

  bool isImage() {
    var fileType = this.trim().split('.').last;
    loger(
      e: fileType,
    );
    if (fileType == 'mp4') {
      return false;
    } else {
      return true;
    }
  }
}

extension CustomInt on int {
  double get toGig => double.parse(
        (this / (1024 * 1024 * 1024)).toStringAsFixed(2),
      );
}
