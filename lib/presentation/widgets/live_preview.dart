import 'package:flutter/material.dart';
import 'package:itsolutions.team/presentation/widgets/spaces.dart';

import 'package:itsolutions.team/presentation/widgets/horizontal_bar.dart';
import 'package:itsolutions.team/values/values.dart';

import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

import 'liveDemoCard.dart';

class LivePreview extends StatefulWidget {
  LivePreview({
    this.width = 500,
    this.height = 400,
    this.imageUrl,
    this.elevation,
    this.shadow,
    this.title,
    this.subtitle,
    this.actionTitle,
    this.hoverColor = AppColors.primaryColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.actionTitleTextStyle,
    this.duration = 1000,
    this.onTap,
  });

  final double width;
  final double height;
  final String? imageUrl;
  final double? elevation;
  final Shadow? shadow;
  final String? title;
  final String? subtitle;
  final String? actionTitle;
  final Color hoverColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? actionTitleTextStyle;
  final int duration;
  final GestureTapCallback? onTap;

  @override
  _LivePreviewState createState() => _LivePreviewState();
}

class _LivePreviewState extends State<LivePreview>
    with TickerProviderStateMixin {
  late AnimationController _portfolioCoverController;
  late Animation<double> _opacityAnimation;
  final int duration = 400;
  bool _hovering = false;

  @override
  void initState() {
    _portfolioCoverController = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    initTweens();
    super.initState();
  }

  @override
  void dispose() {
    _portfolioCoverController.dispose();
    super.dispose();
  }

  void initTweens() {
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 0.8,
    ).animate(
      CurvedAnimation(
        parent: _portfolioCoverController,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  Future<void> _playPortfolioCoverAnimation() async {
    try {
      await _portfolioCoverController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LiveDemoCard(
              child: PlatformWebViewWidget(
                PlatformWebViewWidgetCreationParams(controller: Data.listOfWebControllers[0]),
              ).build(context),
              imageDir: ImagePath.mockUpImage,
              text: 'Monkey App'
            ),
            SizedBox(height: 20,),
            LiveDemoCard(
              child: PlatformWebViewWidget(
                PlatformWebViewWidgetCreationParams(controller: Data.listOfWebControllers[2]),
              ).build(context),
              imageDir: ImagePath.mockUpImage,
                text: 'Medical App'
            ),
            SizedBox(height: 20,),
            LiveDemoCard(
              child: PlatformWebViewWidget(
                PlatformWebViewWidgetCreationParams(controller: Data.listOfWebControllers[4]),
              ).build(context),
              imageDir: ImagePath.mockUpImage,
                text: 'Doctors App'
            ),
            SizedBox(height: 20,),
            LiveDemoCard(
              child: PlatformWebViewWidget(
                PlatformWebViewWidgetCreationParams(controller: Data.listOfWebControllers[6]),
              ).build(context),
              imageDir: ImagePath.mockUpImage,
                text: 'Hotels App'
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LiveDemoCard(
              child: PlatformWebViewWidget(
                PlatformWebViewWidgetCreationParams(controller: Data.listOfWebControllers[1]),
              ).build(context),
              imageDir: ImagePath.mockUpImage,
                text: 'Shrine App'
            ),
            SizedBox(height: 20,),
            LiveDemoCard(
              child: PlatformWebViewWidget(
                PlatformWebViewWidgetCreationParams(controller: Data.listOfWebControllers[3]),
              ).build(context),
              imageDir: ImagePath.mockUpImage,
                text: 'Crypto App'
            ),
            SizedBox(height: 20,),
            LiveDemoCard(
              child: PlatformWebViewWidget(
                PlatformWebViewWidgetCreationParams(controller: Data.listOfWebControllers[5]),
              ).build(context),
              imageDir: ImagePath.mockUpImage,
                text: 'Pomodoro App'
            ),
          ],
        ),
      ],
    );
    // Stack(
    //       alignment: Alignment.center,
    //       children: [
    //     Container(
    //       height: 630,
    //       width: 300,
    //       clipBehavior: Clip.antiAlias,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(60),
    //       ),
    //       child: PlatformWebViewWidget(
    //           PlatformWebViewWidgetCreationParams(controller: _controller),
    //         ).build(context),
    //     ),
    //         Image.asset('assets/images/iphoneFrame.png', width: 340,height: 675,),
    //       ],
    //     );
  }
}
