import 'package:Explorer/constants/colors.dart';
import 'package:Explorer/constants/constants.dart';
import 'package:Explorer/ui/view/home/home_viewmodel.dart';
import 'package:Explorer/utils/icon_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:Explorer/utils/extension_methods/extension.dart';

class StorageBanner extends HookWidget {
  final HomeViewModel model;

  StorageBanner(this.model);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
        height: 202,
        decoration: BoxDecoration(
          color: AppColor.brandPrimary,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 56,
                height: 54,
                decoration: BoxDecoration(
                  color: AppColor.brandSecondary,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: loadAsset(
                      assetPath: AppIcon.caretRight,
                      isSvg: true,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 42,
              top: 42,
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14)),
                child: IconButton(
                  onPressed: () {},
                  color: AppColor.brandSecondary,
                  icon: loadAsset(
                    assetPath: AppIcon.folder,
                    isSvg: true,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 100,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 100,
                  margin: EdgeInsets.only(left: 42, right: 42),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Internal Storage',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    letterSpacing: -0.24)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          RichText(
                            text: TextSpan(
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      letterSpacing: -0.24),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '${model.freeDiskSpace.toGig} GB'),
                                  TextSpan(text: ' / '),
                                  TextSpan(
                                    text: '${model.totalDiskSpace.toGig} GB',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),
                      Container(
                        height: 65,
                        width: 65,
                        child: SleekCircularSlider(
                          initialValue: model.totalDiskSpace.toGig -
                              model.freeDiskSpace.toGig,
                          max: model.totalDiskSpace.toGig,
                          innerWidget: (double value) => Center(
                            child: Text(
                              '${model.getStoragePercentile(
                                freeStorageSize: model.totalDiskSpace.toGig - model.freeDiskSpace.toGig,
                                totalStorageSize: model.totalDiskSpace.toGig,
                              )}%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)),
                            ),
                          ),
                          appearance: CircularSliderAppearance(
                            animationEnabled: true,
                            customWidths: CustomSliderWidths(
                                progressBarWidth: 5, trackWidth: 5),
                            customColors: CustomSliderColors(
                              trackColor: AppColor.brandSecondary,
                              dotColor: Colors.transparent,
                              progressBarColor: Colors.white,
                            ),
                            angleRange: 360,
                            startAngle: -90,
                            size: 65,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
