import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:xstore_cubit/core/constants.dart';
import 'package:xstore_cubit/core/networks/remote/dio_helper.dart';
import 'package:xstore_cubit/features/auth/data/models/login_model.dart';

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

    DioHelper.putData(url: EndPoints.UPDATE_PROFILE,token: tokenHolder, data: {
      'email': email,
      'name': name,
      'phone': phone,
    }).then((value) {
      userModel = LoginModel.fromJson(value.data);
      debugPrint('UpdateUserData: ${userModel!.userData!.name } ');
      emit(USerDataUpdateSuccessState());
    }).catchError((e) {
      debugPrint('UpdateUserData Error: ${e.toString()}');
      emit(USerDataUpdateFailureState());
    });
  }
}