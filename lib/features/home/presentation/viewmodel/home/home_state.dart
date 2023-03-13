part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLayoutchangeState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final HomeModel homeModel;
  HomeSuccessState({
    required this.homeModel,
  });
}

class HomeFailureState extends HomeState {
  final String errMessage;
  HomeFailureState({
    required this.errMessage,
  });
}