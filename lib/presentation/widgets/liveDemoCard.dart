import 'package:flutter/material.dart';
import 'package:itsolutions.team/presentation/widgets/flicker_text_animation.dart';
import 'package:itsolutions.team/values/values.dart';

class LiveDemoCard extends StatefulWidget {
  LiveDemoCard({Key? key,required this.child, required this.imageDir, required this.text}) : super(key: key);

  final Widget child;
  final String imageDir;
  final String text;

  @override
  State<LiveDemoCard> createState() => _LiveDemoCardState();
}

class _LiveDemoCardState extends State<LiveDemoCard> with TickerProviderStateMixin{

  late AnimationController _controller;
  late AnimationController _flickerAnimationController;
  bool _isAboutContentVisible = false;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _flickerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _playAnimation();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isAboutContentVisible = true;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _playFlickerAnimation();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _flickerAnimationController.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _playFlickerAnimation() async {
    try {
      await _flickerAnimationController.forward().orCancel;
      await _flickerAnimationController.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    ThemeData theme = Theme.of(context);

    final double scaleOfWidth = width / 1440;
    final double scaleOfHeight = height / 821;

    return _isAboutContentVisible
        ? Column(
      children: [
        FlickerTextAnimation(
          text: widget.text,
          textColor: AppColors.primaryColor,
          fadeInColor: AppColors.primaryColor,
          controller: _flickerAnimationController.view,
          textStyle: theme.textTheme.bodyLarge!.copyWith(
            fontSize: Sizes.TEXT_SIZE_24,
            //fontWeight: FontWeight.w400,
            color: AppColors.primaryColor,
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 675 * scaleOfWidth,
              width: 310 * scaleOfWidth,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45 * scaleOfWidth),
              ),
              child: widget.child
            ),
            Container(
                width: 350 * scaleOfWidth,
                //color: Colors.blue,
                child: Image.asset(widget.imageDir, width: 350 * scaleOfWidth,)),
          ],
        ),
      ],
    ): Container();
  }
}
