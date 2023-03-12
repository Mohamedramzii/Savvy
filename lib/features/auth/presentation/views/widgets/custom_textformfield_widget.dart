import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:xstore_cubit/core/app_managers/color_manager.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.keyboardtype,
    required this.labeltext,
    required this.isPassword,
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
  final bool isPassword;
  final FormFieldValidator<String> validate;
  final FormFieldSetter<String> onsave;
  final Widget prefixicon;
  final Widget? sufixicon;
  final TextInputAction? textInputAction;
  final FormFieldSetter<String>? onsubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      textInputAction: textInputAction,
      keyboardType: keyboardtype,
      validator: validate,
      onSaved: onsave,
      onFieldSubmitted: onsubmitted,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: prefixicon,
        prefixIconColor: ColorsManager.kprimaryColor,
        suffixIcon: sufixicon,
        suffixIconColor: ColorsManager.kprimaryColor,
        // hintText: 'username',
        label: Text(
          labeltext,
          style: TextStyle(fontSize: 15.sp, color: Colors.grey),
        ),
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
