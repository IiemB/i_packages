import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_packages/configs/configs.dart';

class ITextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final Iterable<String>? autofillHints;
  final int? maxLines;
  final int? minLines;
  final TextAlign? textAlign;
  final int? maxLenght;
  final bool autoFocus;

  const ITextFormField({
    Key? key,
    this.controller,
    required this.labelText,
    this.prefixIcon,
    this.suffix,
    this.obscureText = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.textStyle,
    this.maxLines = 1,
    this.minLines,
    this.autofillHints,
    this.textAlign,
    this.maxLenght,
    this.autoFocus = false,
  }) : super(key: key);

  static const OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: IStyles.borderRadiusAll,
    borderSide: BorderSide(color: Color.fromARGB(255, 32, 107, 145)),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        key: Key(labelText.replaceAll(' ', '')),
        maxLength: maxLenght,
        autofillHints: autofillHints,
        autofocus: autoFocus,
        keyboardType: keyboardType,
        textAlign: textAlign ?? TextAlign.start,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          hintText: labelText,
          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
          errorBorder: _border,
          focusedErrorBorder: _border,
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: Get.theme.inputDecorationTheme.fillColor,
          disabledBorder: _border,
          suffix: suffix,
        ),
        style: textStyle,
        obscureText: obscureText!,
        validator: validator,
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: minLines ?? 1,
      ),
    );
  }
}
