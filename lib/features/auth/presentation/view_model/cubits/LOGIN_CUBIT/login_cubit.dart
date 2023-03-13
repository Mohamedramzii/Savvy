import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xstore_cubit/core/constants.dart';
import 'package:xstore_cubit/core/networks/remote/dio_helper.dart';

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
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: EndPoints.LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      debugPrint(loginModel!.message);
      emit(LoginSuccessState(loginModel: loginModel!));
    }).catchError((e) {
      debugPrint(e.toString());
      emit(LoginFailureState(errMessage: e.toString()));
    });
  }
}
