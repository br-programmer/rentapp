import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class RentAppModalDateSelector extends StatefulWidget {
  const RentAppModalDateSelector._({
    required this.onCompleted,
    required this.onCompletedText,
  });

  final ValueChanged<DateTime?> onCompleted;
  final String onCompletedText;

  static Future<void> show(
    BuildContext context, {
    required ValueChanged<DateTime?> onCompleted,
    required String onCompletedText,
  }) {
    return showCupertinoModalPopup(
      context: context,
      builder: (_) => RentAppModalDateSelector._(
        onCompleted: onCompleted,
        onCompletedText: onCompletedText,
      ),
    );
  }

  @override
  State<RentAppModalDateSelector> createState() =>
      _RentAppModalDateSelectorState();
}

class _RentAppModalDateSelectorState extends State<RentAppModalDateSelector> {
  late DateTime dateTime;
  late DateTime initialDate;
  late DateTime minDate;
  late final now = DateTime.now();

  @override
  void initState() {
    initialDate = now.subtract(
      const Duration(days: 365 * 15),
    );
    minDate = now.subtract(
      const Duration(days: 365 * 90),
    );
    dateTime = initialDate;
    super.initState();
  }

  void onCompled() {
    widget.onCompleted(dateTime);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Palette.dark,
          borderRadius: borderRadiusVT15,
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: edgeInsetsT10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: edgeInsetsH40.add(edgeInsetsT10),
                  child: RentAppTextButton(
                    onPressed: onCompled,
                    text: widget.onCompletedText,
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1.75,
                  child: CupertinoDatePicker(
                    initialDateTime: initialDate,
                    maximumDate: initialDate,
                    minimumDate: minDate,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (date) {
                      dateTime = date;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
