part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class GetCartDataLoadingState extends CartState {}

class GetCartDataSuccessState extends CartState {}

class GetCartDataFailureState extends CartState {}



class AddOrDeleteCartItemDataSuccessState extends CartState {}

class AddOrDeleteCartItemDataLoadingState extends CartState {}

class AddOrDeleteCartItemDataFailureState extends CartState {}
