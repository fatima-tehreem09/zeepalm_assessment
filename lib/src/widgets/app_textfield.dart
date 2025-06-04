import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/colors.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.hint,
    this.label,
    this.validator,
    this.keyboardType,
    this.textEditingController,
    this.suffixIcon,
    this.readOnly,
    this.prefix,
    this.obscureText,
    this.onCountryTap,
    BuildContext? context,
    this.onTap,
    this.textFieldUpperText,
    this.onSaved,
    this.onFieldSubmitted,
    this.autofillHints,
    this.initialValue,
    this.maxLines,
    this.maxLength,
    this.counterText,
    this.hintStyle,
    this.borderRadius,
    this.textKey,
    this.onChanged,
    this.inputFormatters,
    this.textInputAction = TextInputAction.done,
    this.textAlign = TextAlign.start,
  });

  // final bool obscure;
  final String? hint;
  final String? label;
  final Widget? suffixIcon;
  final String? prefix;
  final bool? readOnly;
  final bool? obscureText;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;
  final VoidCallback? onCountryTap;
  final String? textFieldUpperText;
  final FormFieldSetter<String>? onSaved;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? initialValue;
  final int? maxLines;
  final TextAlign textAlign;
  final int? maxLength;
  final String? counterText;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final List<TextInputFormatter>? inputFormatters;
  final Key? textKey;
  final TextInputAction textInputAction;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    textStyle(Color color) {
      return TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
    }

    InputBorder getBorder(Color color) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
      );
    }

    return TextFormField(
      key: widget.textKey,
      textAlign: widget.textAlign,
      readOnly: widget.readOnly ?? false,
      initialValue: widget.initialValue,
      style: textStyle(const Color(0xff1A1C1E)),
      onTap: widget.onTap,
      autofillHints: widget.autofillHints,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText ?? false,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.textEditingController,
      onSaved: widget.onSaved,
      inputFormatters: widget.inputFormatters,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        prefix: widget.prefix == null
            ? const SizedBox()
            : Text(
                widget.prefix!,
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 21,
                ),
              ),
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: AppColors.primaryWhite,
        border: getBorder(
          const Color(0xffD9D9D9),
        ),
        counterText: widget.counterText,
        enabledBorder: getBorder(
          const Color(0xffD9D9D9),
        ),
        focusedBorder: getBorder(
          AppColors.primaryBlue,
        ),
        labelText: widget.label,
        hintText: widget.hint,
        // contentPadding:
        // const EdgeInsets.symmetric(horizontal: 14, vertical: 27),
        hintStyle: textStyle(AppColors.hintDarkGrey),
        suffixIconColor: AppColors.lightBlack,
      ),
      cursorColor: AppColors.primaryBlue,
    );
  }
}

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    this.icon,
    this.label,
    this.validator,
    this.hint,
    this.context,
    this.textEditingController,
    this.borderRadius,
    this.textKey,
    this.onChanged,
    this.padding = 0,
    this.initialValue,
    this.onSaved,
    this.autofillHints,
  });

  final IconData? icon;
  final FormFieldSetter<String>? onSaved;
  final String? hint;
  final String? label;
  final BuildContext? context;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;
  final double? borderRadius;
  final Key? textKey;
  final Function(String)? onChanged;
  final Iterable<String>? autofillHints;
  final double padding;
  final String? initialValue;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _show = true;

  textStyle(Color color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  InputBorder getBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.padding),
      child: TextFormField(
        initialValue: widget.initialValue,
        key: widget.textKey,
        onSaved: widget.onSaved,
        cursorColor: AppColors.primaryBlue,
        validator: widget.validator,
        obscureText: _show,
        onChanged: widget.onChanged,
        autofillHints: widget.autofillHints,
        keyboardType: TextInputType.visiblePassword,
        controller: widget.textEditingController,
        textInputAction: TextInputAction.done,
        // onFieldSubmitted: (v) {
        //   FocusScope.of(context).nextFocus();
        // },
        style: textStyle(const Color(0xff1A1C1E)),
        scrollPadding: const EdgeInsets.all(180),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            child: Icon(
              Icons.visibility_off,
              color: _show ? AppColors.primaryBlue : AppColors.lightBlack,
            ),
            onTap: () => setState(
              () => _show = !_show,
            ),
          ),
          filled: true,
          fillColor: AppColors.primaryWhite,
          border: getBorder(
            const Color(0xffD9D9D9),
          ),
          enabledBorder: getBorder(
            const Color(0xffD9D9D9),
          ),
          focusedBorder: getBorder(
            AppColors.primaryBlue,
          ),

          // contentPadding:
          //     const EdgeInsets.symmetric(horizontal: 14, vertical: 27),
          hintText: "************",
        ),
      ),
    );
  }
}
