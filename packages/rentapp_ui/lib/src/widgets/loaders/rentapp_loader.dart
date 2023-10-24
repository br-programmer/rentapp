import 'package:flutter/material.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class RentAppLoader extends StatelessWidget {
  const RentAppLoader({
    super.key,
    this.centered = true,
    this.loading = true,
    this.child,
    this.height = 100,
    this.width = 100,
  });

  final bool centered;
  final bool loading;
  final Widget? child;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return RentAppAnimatedVisible(
      visible: loading,
      replacement: child,
      child: RentAppConditionalCenter(
        centered: centered,
        child: RentAppLottieAsset(
          path: Assets.lotties.loader,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
