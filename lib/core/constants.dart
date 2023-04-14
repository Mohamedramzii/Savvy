// ignore_for_file: constant_identifier_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../features/Auth/presentation/views/widgets/custom_Toast_Widget.dart';
import '../features/products/presentation/viewmodel/home/home_cubit.dart';
import 'app_managers/color_manager.dart';

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



// lines below must be in their organized files

void connectionCheckerWidget(HomeState state, BuildContext context) {
  if (state is AppInternetConnectionNone) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      title: 'Connection Error',
      titleTextStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w900),
      desc: 'No Internet Connectio\nPlease connect to a network and try again.',
      // btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  } else if (state is AppInternetConnectionConnected) {
    CustomToastWidget.getToast(text: 'Connected', color: Colors.green);
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
          color: ColorsManager.kprimaryColor, size: 50),
    );
  }
}
