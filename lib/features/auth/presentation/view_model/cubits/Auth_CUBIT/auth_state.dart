import 'package:flutter/material.dart';
import 'package:xstore_cubit/features/auth/data/models/login_model.dart';
import 'package:xstore_cubit/features/auth/data/models/registerModel.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final LoginModel loginModel;
  LoginSuccessState({
    required this.loginModel,
  });
}

class LoginFailureState extends AuthState {
  final String errMessage;
  LoginFailureState({
    required this.errMessage,
  });
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final LoginModel loginModel;
  RegisterSuccessState({
    required this.loginModel,
  });
}

class RegisterFailureState extends AuthState {
  final String errMessage;
  RegisterFailureState({
    required this.errMessage,
  });
}

class LoginVisibilityIconState extends AuthState {}


