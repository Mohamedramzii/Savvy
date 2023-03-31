// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

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
  static const LOGOUT = 'logout';
  static const CHANGEPASSWORD = 'change-password';
}

class Navigation {
  static navigationWithReturn(context, {required Widget screen}) {
    Navigator.of(context).push(PageAnimationTransition(
        page: screen, pageAnimationType: RightToLeftFadedTransition()));
  }

  static navigationWithoutReturn(context, {required Widget screen}) {
    Navigator.of(context).pushReplacement(PageAnimationTransition(
        page: screen, pageAnimationType: RightToLeftFadedTransition()));
  }
}

const onBoardingKey = 'OnBoarding';
const tokenKey = 'token';
String? tokenHolder = '';
bool? onBoarding;
