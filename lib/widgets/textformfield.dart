import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:i_packages/configs/configs.dart';

class ITextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final bool? obscureText;
  final bool readOnly;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final Iterable<String>? autofillHints;
  final int? maxLines;
  final int? minLines;
  final TextAlign? textAlign;
  final int? maxLenght;
  final bool autoFocus;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;

  const ITextFormField({
    Key? key,
    this.controller,
    this.initialValue,
    required this.labelText,
    this.prefixIcon,
    this.suffix,
    this.obscureText = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.textStyle,
    this.focusNode,
    this.maxLines = 1,
    this.minLines,
    this.autofillHints,
    this.textAlign,
    this.maxLenght,
    this.autoFocus = false,
    this.readOnly = false,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.inputFormatters,
  })  : assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        super(key: key);

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
        initialValue: initialValue,
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
        focusNode: focusNode,
        onTap: onTap,
        readOnly: readOnly,
        style: textStyle,
        obscureText: obscureText!,
        validator: validator,
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: minLines,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        inputFormatters: inputFormatters,
      ),
    );
  }
}
