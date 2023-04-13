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

//details states

class DetailsLoadingState extends HomeState {}

class DetailsSuccessState extends HomeState {}

class DetailsFailureState extends HomeState {}

//add to favorites
class DelToFavLoadingState extends HomeState {}

class DelToFavSuccessState extends HomeState {}

class DelToFavFailureState extends HomeState {}

// getFav2
class GetFav2SuccessState extends HomeState {}

class GetFav2FailureState extends HomeState {}

class AddOrDeleteFavoritesSuccessState extends HomeState {}

class AddOrDeleteFavoritesFailureState extends HomeState {}





//Internet Connection
class AppInternetConnectionNone extends HomeState {}
class AppInternetConnectionConnected extends HomeState {}


// Cart
class GetCartDataLoadingState extends HomeState {}

class GetCartDataSuccessState extends HomeState {}

class GetCartDataFailureState extends HomeState {}



class AddOrDeleteCartItemDataSuccessState extends HomeState {}

class AddOrDeleteCartItemDataLoadingState extends HomeState {}

class AddOrDeleteCartItemDataFailureState extends HomeState {}