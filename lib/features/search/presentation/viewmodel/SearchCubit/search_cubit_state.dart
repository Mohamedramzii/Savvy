part of 'search_cubit_cubit.dart';

@immutable
abstract class SearchCubitState {}

class SearchCubitInitial extends SearchCubitState {}
class SearchCubitLoadingState extends SearchCubitState {}
class SearchCubitSuccessState extends SearchCubitState {}
class SearchCubitFailureState extends SearchCubitState {}
