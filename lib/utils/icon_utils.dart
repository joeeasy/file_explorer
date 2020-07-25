import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget loadAsset(
        {@required String assetPath,
        @required bool isSvg,
        double height,
        double width}) =>
    (isSvg != null && isSvg != false)
        ? SvgPicture.asset(
          assetPath,
        )
        : Image.asset(
            assetPath,
            height: height,
            width: width,
          );
