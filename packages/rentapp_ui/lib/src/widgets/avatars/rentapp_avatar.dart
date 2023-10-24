import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class RentAppCircularAvatar extends StatelessWidget {
  const RentAppCircularAvatar({
    super.key,
    this.imageUrl,
    this.diameter = 30,
    this.errorWidget,
    this.gradient,
    this.centered = false,
    this.onPressed,
  });

  final String? imageUrl;
  final double diameter;
  final Widget? errorWidget;
  final Gradient? gradient;
  final bool centered;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final errorWidget = this.errorWidget ??
        Assets.images.profilePicture.image(fit: BoxFit.cover);
    return InkWell(
      splashColor: Palette.transparent,
      focusColor: Palette.transparent,
      highlightColor: Palette.transparent,
      hoverColor: Palette.transparent,
      onTap: onPressed,
      child: RentAppConditionalCenter(
        centered: centered,
        child: SizedBox.square(
          dimension: diameter,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(diameter / 2),
                  child: SizedBox.square(
                    dimension: diameter,
                    child: DecoratedBox(
                      decoration: BoxDecoration(gradient: gradient),
                      child: imageUrl == null
                          ? errorWidget
                          : CachedNetworkImage(
                              imageUrl: imageUrl!,
                              fit: BoxFit.cover,
                              errorWidget: (_, __, ___) => errorWidget,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
