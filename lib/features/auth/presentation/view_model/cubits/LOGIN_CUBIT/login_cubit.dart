import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xstore_cubit/core/constants.dart';
import 'package:xstore_cubit/core/networks/remote/dio_helper.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_Toast_Widget.dart';

import '../../../../../../core/networks/local/cache_helper.dart';
import '../../../../data/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isHidden = true;

  LoginModel? loginModel;

  visibilityChange() {
    isHidden = !isHidden;
    debugPrint('isHidden ? $isHidden');
    emit(LoginVisibilityIconState());
  }

  void loginUser({
    context,
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    await DioHelper.postData(
      url: EndPoints.LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      debugPrint(loginModel!.message);
      CacheHelper.saveData(key: tokenKey, value: loginModel!.userData!.token);
      tokenHolder = loginModel!.userData!.token;
      debugPrint('userToken: ${loginModel!.userData!.token}');
      emit(LoginSuccessState(loginModel: loginModel!));
      // CustomToastWidget.getToast(text: loginModel!.message!, color: Colors.green);
    }).catchError((e) {
      debugPrint(e.toString());
      CustomToastWidget.getToast(text: loginModel!.message!, color: Colors.red);
      emit(LoginFailureState(errMessage: e.toString()));
    });
  }

  void registerUser({
    context,
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    await DioHelper.postData(
      url: EndPoints.REGISTER,
      data: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      debugPrint(loginModel!.message);
      CacheHelper.saveData(key: tokenKey, value: loginModel!.userData!.token);
      tokenHolder = loginModel!.userData!.token;
      debugPrint('userToken: ${loginModel!.userData!.token}');
      emit(RegisterSuccessState(loginModel: loginModel!));
      // CustomToastWidget.getToast(text: loginModel!.message!, color: Colors.green);
    }).catchError((e) {
      debugPrint(e.toString());
      CustomToastWidget.getToast(text: loginModel!.message!, color: Colors.red);
      emit(RegisterFailureState(errMessage: e.toString()));
    });
  }
}
