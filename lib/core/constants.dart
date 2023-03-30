// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

abstract class EndPoints {
  static const LOGIN = 'login';
  static const HOME = 'home';
  static const HOME_CATEGORIES = 'categories';
  static const HOME_Favorite = 'favorites';
  static const PROFILE = 'profile';
  static const REGISTER = 'register';
  static const UPDATE_PROFILE = 'update-profile';
  static const SEARCH = 'products/search';
  static const GETCART = 'carts';
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

const onBoardingKey = 'OnBoarding';
const tokenKey = 'token';
String? tokenHolder = '';
bool? onBoarding;
