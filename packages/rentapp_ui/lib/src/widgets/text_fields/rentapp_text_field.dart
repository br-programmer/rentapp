import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class RentAppTextField extends StatefulWidget {
  const RentAppTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.title,
    this.controller,
    this.focusNode,
    this.enabled,
    this.onTap,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines = 1,
    this.inputFormatters,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onSubmit,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.prefix,
    this.lines,
    this.onDeleted,
  });

  const RentAppTextField.password({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.title,
    this.controller,
    this.focusNode,
    this.enabled,
    this.onTap,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines = 1,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onSubmit,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.prefix,
    this.lines,
    this.onDeleted,
  })  : obscureText = true,
        suffixIcon = null;

  final String? title;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? prefix;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool obscureText;
  final bool? enabled;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final int maxLines;
  final int minLines;
  final int? lines;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final VoidCallback? onDeleted;

  @override
  State<RentAppTextField> createState() => _RentAppTextFieldState();
}

class _RentAppTextFieldState extends State<RentAppTextField> {
  late final ValueNotifier<bool> obscureText;
  late final ValueNotifier<bool> onFocus;
  late final FocusNode focusNode;
  var text = '';

  @override
  void initState() {
    obscureText = ValueNotifier<bool>(widget.obscureText);
    focusNode = (widget.focusNode ?? FocusNode())..addListener(onFocusListener);
    onFocus = ValueNotifier<bool>(false);
    super.initState();
  }

  void onFocusListener() {
    if (!focusNode.hasFocus) {
      widget.onSubmit?.call(text);
    }
    onFocus.value = focusNode.hasFocus;
  }

  @override
  void dispose() {
    obscureText.dispose();
    focusNode
      ..removeListener(onFocusListener)
      ..dispose();
    super.dispose();
  }

  OutlineInputBorder _inputBorder({
    Color color = Palette.grayLight,
    BorderSide? borderSide,
  }) {
    return OutlineInputBorder(
      borderRadius: borderRadius16,
      borderSide: borderSide ?? BorderSide(color: color),
    );
  }

  Widget? getSuffixIcon() {
    Widget? suffixIcon;
    suffixIcon = widget.suffixIcon;
    if (widget.obscureText) {
      suffixIcon = ValueListenableBuilder<bool>(
        valueListenable: obscureText,
        builder: (_, value, __) => RentAppIconButton(
          icon: value ? RentAppIcons.eyesClose : RentAppIcons.eyes,
          onPressed: () => obscureText.value = !obscureText.value,
        ),
      );
    }
    return suffixIcon;
  }

  Widget? getPrefixIcon() {
    Widget? prefixIcon;
    prefixIcon = widget.prefix;
    if (widget.prefixIcon != null) {
      prefixIcon = ValueListenableBuilder<bool>(
        valueListenable: onFocus,
        builder: (_, value, __) => RentAppIcon(
          icon: widget.prefixIcon!,
          color: value ? Palette.green : Palette.grayLight,
          size: RentAppIconSize.bigger,
        ),
      );
    }
    return prefixIcon;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: textTheme.labelMedium,
          ),
          gap8,
        ],
        Row(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: obscureText,
                builder: (_, value, __) => TextFormField(
                  style: textTheme.labelLarge,
                  controller: widget.controller,
                  focusNode: focusNode,
                  enabled: widget.enabled,
                  autovalidateMode: widget.autovalidateMode,
                  obscureText: value,
                  keyboardType: widget.keyboardType,
                  textCapitalization: widget.textCapitalization,
                  maxLines:
                      widget.obscureText ? 1 : widget.lines ?? widget.maxLines,
                  minLines: widget.lines ?? widget.minLines,
                  validator: widget.validator,
                  inputFormatters: widget.inputFormatters,
                  onChanged: (value) {
                    text = value;
                    widget.onChanged?.call(value);
                  },
                  onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: getPrefixIcon(),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: getSuffixIcon(),
                    ),
                    hintText: widget.hintText,
                    filled: true,
                    border: _inputBorder(),
                    enabledBorder: _inputBorder(),
                    focusedBorder: _inputBorder(color: Palette.green),
                    focusedErrorBorder: _inputBorder(
                      color: Palette.redErrorAndAlert,
                    ),
                    errorBorder: _inputBorder(
                      color: Palette.redErrorAndAlert,
                    ),
                    disabledBorder: _inputBorder(),
                    fillColor: context.theme.scaffoldBackgroundColor,
                    hintStyle: textTheme.titleSmall,
                    errorStyle: textTheme.titleSmall?.copyWith(
                      color: Palette.redErrorAndAlert,
                      fontSize: 12,
                      letterSpacing: .5,
                    ),
                    enabled: widget.enabled ?? true,
                  ),
                ),
              ),
            ),
            if (widget.onDeleted != null) ...[
              Center(
                child: RentAppIconButton(
                  icon: Icons.clear_rounded,
                  onPressed: widget.onDeleted!,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
