part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

//User
class SettingsUserDataLoading extends SettingsState {}

class SettingsUserDataSuccess extends SettingsState {
  final LoginModel userData;
  SettingsUserDataSuccess({
    required this.userData,
  });
}

class SettingsUserDataFailure extends SettingsState {
  final String errMessage;
  SettingsUserDataFailure({
    required this.errMessage,
  });
}

class IsUpdatingState extends SettingsState {}

class USerDataUpdateSuccessState extends SettingsState {}

class USerDataUpdateFailureState extends SettingsState {}

class USerDataUpdateLoadingState extends SettingsState {}


class LogoutSuccessState extends SettingsState {}



class ChangePasswordSuccessState extends SettingsState {}

class ChangePasswordLoadingState extends SettingsState {}

class ChangePasswordFailureState extends SettingsState {}
class ChangePasswordVisibilityIconState extends SettingsState{}
