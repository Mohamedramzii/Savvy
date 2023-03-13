part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;
  LoginSuccessState({
    required this.loginModel,
  });
}

class LoginFailureState extends LoginState {
  final String errMessage;
  LoginFailureState({
    required this.errMessage,
  });
}

class LoginVisibilityIconState extends LoginState {}
