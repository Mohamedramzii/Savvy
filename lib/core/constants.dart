// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

abstract class EndPoints {
  static const LOGIN = 'login';
}

class Navigation {
  static navigationWithReturn(context, {required Widget screen}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static navigationWithoutReturn(context, {required Widget screen}) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }
}
