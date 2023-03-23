import 'package:flutter/material.dart';

import '../../../../../core/app_managers/color_manager.dart';

class CustomTextFieldWIdget extends StatelessWidget {
  const CustomTextFieldWIdget({
    Key? key,
    required this.text,
    required this.prefixICon,
    required this.controller,
    required this.onsubmitted,
  }) : super(key: key);
  final String text;
  final Icon prefixICon;

  final TextEditingController controller;
  // ignore: non_constant_identifier_names
  final FormFieldSetter<String> onsubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onsubmitted,
      decoration: InputDecoration(
        hintText: text,

        // floatingLabelBehavior: FloatingLabelBehavior.auto,
        // filled: isFilled,
        // fillColor: fillColor,
        // enabled: isEnabled,
        prefixIcon: prefixICon,
        prefixIconColor: ColorsManager.kprimaryColor,
        // suffixIcon: sufixicon,
        suffixIconColor: ColorsManager.kprimaryColor,
        // hintText: 'username',
        // label: Text(
        //   labeltext,
        //   style: TextStyle(
        //       fontSize: fontsize.sp,
        //       color: textColor),
        // ),
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
