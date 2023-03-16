part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

//User
class SettingsUserDataLoading extends SettingsState {}

class SettingsUserDataSuccess extends SettingsState {}

class SettingsUserDataFailure extends SettingsState {
  final String errMessage;
  SettingsUserDataFailure({
    required this.errMessage,
  });
}
