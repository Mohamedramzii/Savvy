import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:xstore_cubit/core/constants.dart';
import 'package:xstore_cubit/core/networks/remote/dio_helper.dart';
import 'package:xstore_cubit/features/auth/data/models/login_model.dart';

import '../../../../../core/networks/local/cache_helper.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  bool isUpdating = false;

  updating() {
    isUpdating = !isUpdating;
    emit(IsUpdatingState());
  }

  LoginModel? userModel;

  getUserData() {
    emit(SettingsUserDataLoading());
    DioHelper.getData(
      url: EndPoints.PROFILE,
      token: tokenHolder,
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      debugPrint('getUserData Data: ${userModel!.userData!.name}');
      emit(SettingsUserDataSuccess(userData: userModel!));
    }).catchError((e) {
      debugPrint('getUserData Error: ${e.toString()}');
      emit(SettingsUserDataFailure(errMessage: e.toString()));
    });
  }

  //  LoginModel? updatedUserModel;
  updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(USerDataUpdateLoadingState());

    DioHelper.putData(url: EndPoints.UPDATE_PROFILE, token: tokenHolder, data: {
      'email': email,
      'name': name,
      'phone': phone,
    }).then((value) {
      userModel = LoginModel.fromJson(value.data);
      debugPrint('UpdateUserData: ${userModel!.userData!.name} ');
      emit(USerDataUpdateSuccessState());
    }).catchError((e) {
      debugPrint('UpdateUserData Error: ${e.toString()}');
      emit(USerDataUpdateFailureState());
    });
  }

  logout() {
    DioHelper.postData(url: EndPoints.LOGOUT, data: {}, token: tokenHolder);
    CacheHelper.clearData(key: tokenKey);
    debugPrint('Token is cleared!!');
    debugPrint('Logout');

    emit(LogoutSuccessState());
  }

  String? message;
  bool? status;
  changePassword(
      {required String currentPassword,
      required String newPassword,
      required context}) {
    emit(ChangePasswordLoadingState());
    DioHelper.postData(
        url: EndPoints.CHANGEPASSWORD,
        token: tokenHolder,
        data: {
          'current_password': currentPassword,
          'new_password': newPassword
        }).then((value) {
      status = value.data['status'];
      message = value.data['message'];
      debugPrint('change password: $message');
      Navigator.pop(context);
      emit(ChangePasswordSuccessState());
    }).catchError((e) {
      debugPrint('change password Error: ${e.toString}');
      emit(ChangePasswordFailureState());
    });
  }

  bool isHidden2 = true;
  visibilityChange2() {
    isHidden2 = !isHidden2;

    debugPrint('isHidden2 ? $isHidden2');
    emit(ChangePasswordVisibilityIconState());
  }

  bool isDark = false;
  bool modeChange({bool? fromshared}) {
    if (fromshared != null) {
      // isDark = fromshared;
      emit(ThemModeChangedSuccessfully());
      return isDark=fromshared;
    } else {
      // isDark = !isDark;
      debugPrint('isDark: $isDark');
      CacheHelper.saveData(key: 'isDark', value: isDark)
          .then((value) => emit(ThemModeChangedSuccessfully()));
      return isDark=!isDark;
    }
  }
}
