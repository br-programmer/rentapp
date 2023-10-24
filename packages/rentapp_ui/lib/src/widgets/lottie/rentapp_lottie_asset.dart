import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class RentAppLottieAsset extends StatefulWidget {
  const RentAppLottieAsset({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.controller,
    this.fit,
    this.onAnimationFinish,
    this.repeat,
  });

  final String path;
  final double? width;
  final double? height;
  final bool? repeat;
  final VoidCallback? onAnimationFinish;
  final BoxFit? fit;
  final AnimationController? controller;

  @override
  State<RentAppLottieAsset> createState() => _RentAppLottieAssetState();
}

class _RentAppLottieAssetState extends State<RentAppLottieAsset>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.controller?.addStatusListener(statusListener);
  }

  void statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onAnimationFinish?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.path,
      controller: widget.controller,
      repeat: widget.repeat,
      onLoaded: (composition) {
        if (widget.controller != null) {
          widget.controller!
            ..duration = composition.duration
            ..forward();
        }
      },
      frameRate: FrameRate(60),
      width: widget.width,
      height: widget.height,
      package: RentAppUI.package,
    );
  }
}
