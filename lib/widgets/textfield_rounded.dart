import 'package:dolarvzla/config/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldRounded extends StatelessWidget {
  String? hint;
  IconData? icon;
  TextEditingController? controller;
  bool? isPassword = false;
  Color? fillColor;
  final FocusNode _focusNode = FocusNode();
  bool? isDarkMode;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  TextFieldRounded(
      {Key? key,
      this.hint,
      this.icon,
      this.isPassword,
      this.controller,
      this.fillColor,
      this.keyboardType,
      this.isDarkMode,
      this.inputFormatters,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      //  focusNode: _focusNode,
      validator: validator,
      obscureText: isPassword ?? false,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: TextStyle(
          color: (isDarkMode ?? false) ? Colors.white : Colors.grey.shade700),
      cursorColor: ColorsApp.blue,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: (isDarkMode ?? false) ? Colors.white : ColorsApp.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: (isDarkMode ?? false) ? Colors.white : ColorsApp.blue),
        ),
        labelText: hint,

        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: TextStyle(
            color: (isDarkMode ?? false) ? Colors.white : ColorsApp.blue,
            decorationColor:
                (isDarkMode ?? false) ? Colors.white : ColorsApp.blue),
        prefixIcon: icon != null
            ? Icon(
                icon,
                color:
                    (isDarkMode ?? false) ? Colors.white : Colors.grey.shade700,
              )
            : Container(),
        //  hintText: hint,
        hintStyle: TextStyle(
            color: (isDarkMode ?? false)
                ? Colors.white.withOpacity(.7)
                : Colors.grey.shade700),
        labelStyle: TextStyle(
            color: (isDarkMode ?? false)
                ? Colors.white.withOpacity(.7)
                : Colors.grey.shade700),
        filled: true,
        fillColor: fillColor ??
            ((isDarkMode ?? false)
                ? Colors.black.withAlpha(125)
                : Colors.white60),

        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: ColorsApp.blue)),
      ),
    );
  }
}
