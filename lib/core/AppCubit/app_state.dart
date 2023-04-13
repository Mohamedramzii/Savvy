part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class AppInternetConnectionNone extends AppState {}
class AppInternetConnectionConnected extends AppState {}


class IsOnBoardingOrLoginState extends AppState {}
