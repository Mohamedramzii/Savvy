part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}


//HOME

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

//-----------------------------------------------------------------


//Fav states in changeFavorite method

class HomeFavoriteChangeLoadingState extends HomeState {}
// class HomeFavoriteDeletedSuccessState extends HomeState {}

class HomeFavoriteChangeSuccessState extends HomeState {
  final FavoriteIConModel favoriteIConModel;
  HomeFavoriteChangeSuccessState({
    required this.favoriteIConModel,
  });
}

class HomeFavoriteChangeFailureState extends HomeState {
  final String errMessage;
  HomeFavoriteChangeFailureState({
    required this.errMessage,
  });
}

//-----------------------------------------------------


// //CATEGORIES
// class HomeCategoriesSuccessState extends HomeState {}

// class HomeCategoriesFailureState extends HomeState {
//   final String errMessage;
//   HomeCategoriesFailureState({
//     required this.errMessage,
//   });
// }

///-------------------------------------------------

//fav states in getFavorites Method
class FavoriteGetLoadingState extends HomeState {}

class FavoriteGetSuccessState extends HomeState {}

class FavoriteGetFailureState extends HomeState {}

// class FavoriteItemDeletedSuccessState extends HomeState {}
