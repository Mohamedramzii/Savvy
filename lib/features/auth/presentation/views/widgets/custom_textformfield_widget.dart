import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:xstore_cubit/core/app_managers/color_manager.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  CustomTextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.keyboardtype,
    required this.labeltext,
    this.initialtext,
    required this.isPassword,
    this.isEnabled = true,
    this.isFilled = false,
    this.fontsize = 15,
    this.textColor = Colors.grey,
    this.fillColor = Colors.white,
    required this.validate,
    required this.onsave,
    required this.prefixicon,
    this.sufixicon,
    this.textInputAction,
    this.onsubmitted,
  }) : super(key: key);
  final TextEditingController controller;
  final TextInputType keyboardtype;
  final String labeltext;
  final String? initialtext;
  final bool isPassword;
  bool isEnabled;
  bool isFilled;
  final double fontsize;
  final Color textColor;
  final Color fillColor;
  final FormFieldValidator<String> validate;
  final FormFieldSetter<String> onsave;
  final Widget prefixicon;
  final Widget? sufixicon;
  final TextInputAction? textInputAction;
  final FormFieldSetter<String>? onsubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
      ),
      textInputAction: textInputAction,
      keyboardType: keyboardtype,
      initialValue: initialtext,
      validator: validate,
      onSaved: onsave,
      onFieldSubmitted: onsubmitted,
      obscureText: isPassword,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: isFilled,
        fillColor: fillColor,
        // hintText: controller.text,
        enabled: isEnabled,
        prefixIcon: prefixicon,
        prefixIconColor: ColorsManager.kprimaryColor,
        suffixIcon: sufixicon,
        suffixIconColor: ColorsManager.kprimaryColor,
        // hintText: 'username',
        label: Text(
          labeltext,
          style: TextStyle(fontSize: fontsize.sp, color: textColor),
        ),
        disabledBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorsManager.kprimaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
