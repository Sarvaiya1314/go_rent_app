import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final String? hintText;
  final String? labelText;
  final bool? obscuringCharacter;
  final Function(String)? onChanged;
  final String Function(String?)? validator;
  final bool? eyeIcon;

  const AppTextField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.textCapitalization,
    this.textInputAction,
    this.obscureText,
    this.hintText,
    this.labelText,
    this.obscuringCharacter,
    this.onChanged,
    this.validator,
    this.eyeIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Color(0xA1000000),
        fontFamily: 'Abel',
      ),
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          borderSide: BorderSide(
            color: Color(0x37474F45),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          borderSide: BorderSide(
            color: Color(0x37474F45),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          borderSide: BorderSide(
            color: Color(0x37474F45),
          ),
        ),
        labelText: labelText ?? "",
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w500,
        ),
        hintText: hintText ?? '',
        hintStyle: const TextStyle(
          color: Color(0xFF464646),
        ),
      ),
    );
  }
}
