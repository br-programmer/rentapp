import 'package:flutter/material.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class RentAppSnackBar {
  RentAppSnackBar({
    required this.context,
    required this.iconData,
    required this.titleText,
    this.descriptionText,
    this.borderSide,
    this.descriptionColor = Palette.white,
    this.iconColor = Palette.white,
    this.hideColor = Colors.white70,
    this.backgroundColor = const Color(0xFF303030),
  }) : _snackBar = SnackBar(
          content: Material(
            type: MaterialType.transparency,
            child: _SnackBarContent(
              iconColor: iconColor,
              icon: iconData,
              titleText: titleText,
              descriptionText: descriptionText,
              descriptionColor: descriptionColor,
            ),
          ),
          shape: RoundedRectangleBorder(
            side: borderSide ?? BorderSide.none,
            borderRadius: borderRadius16,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: backgroundColor,
        );
  final String titleText;
  final String? descriptionText;
  final Color iconColor;
  final Color hideColor;
  final Color descriptionColor;
  final IconData iconData;
  final Color backgroundColor;
  late final SnackBar _snackBar;
  final BuildContext context;
  final BorderSide? borderSide;

  static void error({
    required BuildContext context,
    required String title,
    String? subtitle,
    IconData icon = Icons.info_outline_rounded,
  }) =>
      RentAppSnackBar(
        context: context,
        iconData: icon,
        titleText: title,
        descriptionText: subtitle,
        backgroundColor: Palette.redErrorAndAlert,
      ).show();

  static void warning({
    required BuildContext context,
    required String title,
    String? subtitle,
    Color? subtitleColor,
  }) =>
      // TODO(brprogrammer): verify icon, and backgroundColor
      RentAppSnackBar(
        context: context,
        iconData: Icons.warning_amber,
        titleText: title,
        descriptionText: subtitle,
        backgroundColor: Colors.yellow.shade900,
      ).show();

  SnackBar get snackBar => _snackBar;

  static void info({
    required BuildContext context,
    required String title,
    String? subtitle,
  }) =>
      // TODO(brprogrammer): verify icon, and backgroundColor
      RentAppSnackBar(
        context: context,
        iconData: Icons.info,
        titleText: title,
        descriptionText: subtitle,
        backgroundColor: Colors.blue.shade600,
      ).show();

  static void success({
    required BuildContext context,
    required String title,
    String? subtitle,
  }) =>
      // TODO(brprogrammer): verify icon, and backgroundColor
      RentAppSnackBar(
        context: context,
        iconData: Icons.info_outline_rounded,
        titleText: title,
        descriptionText: subtitle,
        backgroundColor: Palette.green,
      ).show();

  void show() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }
}

class _SnackBarContent extends StatelessWidget {
  const _SnackBarContent({
    required this.titleText,
    this.descriptionText,
    required this.icon,
    required this.descriptionColor,
    required this.iconColor,
  });

  final String titleText;
  final IconData icon;
  final String? descriptionText;
  final Color descriptionColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RentAppIcon(icon: icon, color: iconColor),
        space10,
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleText,
                style: context.textTheme.headlineSmall,
              ),
              if (descriptionText != null) ...[
                gap4,
                Text(
                  descriptionText!,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: descriptionColor,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
