import 'package:flutter/material.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

enum ButtonSize { small, medium, large }

extension on ButtonSize {
  double get fontSize {
    switch (this) {
      case ButtonSize.small:
        return 14;
      case ButtonSize.medium:
        return 16;
      case ButtonSize.large:
        return 18;
    }
  }

  double get height {
    switch (this) {
      case ButtonSize.small:
        return 34;
      case ButtonSize.medium:
        return 42;
      case ButtonSize.large:
        return 52;
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case ButtonSize.small:
        return edgeInsetsH5;
      case ButtonSize.medium:
      case ButtonSize.large:
        return edgeInsetsH10;
    }
  }
}

class RentAppBaseButton extends StatelessWidget {
  const RentAppBaseButton({
    super.key,
    this.onPressed,
    this.color,
    this.onSurface,
    this.text,
    this.textColor,
    this.iconColor,
    this.borderColor,
    this.icon,
    this.size = ButtonSize.large,
    this.isCentered = true,
    this.textStyle,
    this.padding,
    this.child,
    this.enabled = true,
    this.rawSize,
    this.borderRadius = borderRadius16,
    this.foregroundColor,
  });

  final void Function()? onPressed;
  final Color? color;
  final Color? onSurface;
  final String? text;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  final IconData? icon;
  final ButtonSize size;
  final bool isCentered;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final Widget? child;
  final bool enabled;
  final double? rawSize;
  final BorderRadiusGeometry borderRadius;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final style = textStyle ??
        context.textTheme.headlineSmall?.copyWith(
          fontSize: size.fontSize,
        );
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      child: SizedBox(
        height: size.height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color:
                enabled ? Palette.transparent : Palette.green.withOpacity(.3),
            borderRadius: borderRadius,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: enabled ? color : Palette.green.withOpacity(.3),
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
              disabledBackgroundColor: onSurface,
              padding: padding ?? size.padding,
              foregroundColor:
                  enabled ? foregroundColor : Palette.green.withOpacity(.3),
              side: BorderSide(color: borderColor ?? Palette.transparent),
            ),
            onPressed: enabled ? onPressed : () {},
            child: child ??
                Row(
                  mainAxisAlignment: isCentered
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    if (icon != null) ...[
                      RentAppIcon(
                        icon: icon!,
                        color: iconColor,
                        rawSize: rawSize,
                      ),
                      if (text != null) space10,
                    ],
                    if (text != null) Text(text ?? '', style: style),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}

class RentAppPrimaryButton extends RentAppBaseButton {
  const RentAppPrimaryButton({
    super.key,
    super.onPressed,
    super.text,
    super.icon,
    super.size = ButtonSize.large,
    super.isCentered = true,
    super.textStyle,
    super.textColor,
    super.padding,
    super.borderColor,
    super.color = Palette.green,
    super.onSurface,
    super.enabled = true,
    super.child,
    super.borderRadius = borderRadius16,
    super.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return RentAppBaseButton(
      enabled: enabled,
      isCentered: isCentered,
      padding: padding,
      icon: icon,
      size: size,
      text: text,
      onPressed: onPressed,
      textStyle: textStyle,
      textColor: textColor,
      borderColor: borderColor,
      color: color,
      onSurface: onSurface,
      borderRadius: borderRadius,
      foregroundColor: foregroundColor,
      child: child,
    );
  }
}
