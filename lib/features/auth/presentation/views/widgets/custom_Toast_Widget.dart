import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToastWidget {
static getToast({
    required String text,
    required Color color,
  }) {
    Fluttertoast.showToast(
        msg: text,
        backgroundColor: color,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }
}
