import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xstore_cubit/core/constants.dart';
import 'package:xstore_cubit/core/networks/remote/dio_helper.dart';
import 'package:xstore_cubit/features/home/data/models/favoriteIconModel.dart';
import '../../../../cart/presentation/views/cartView.dart';
import '../../../../categories/data/models/homeCategoriesModel.dart';
import '../../../../favorite/data/models/favoriteModel.dart';
import '../../../../favorite/presentation/views/favoriteView.dart';
import '../../../../settings/presentation/views/settingsView.dart';
import '../../../data/models/home_model/home_model.dart';
import '../../views/homeView.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // FavoriteCubit favoriteCubit;
  Timer? timer;
  Widget initTimer(widget) {
    Widget currentWidget = widget;
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      currentWidget;
    });
    return currentWidget;
  }

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const CartView(),
    const FavoriteView(),
    const SettingsView(),
  ];

  void PageViewChange({required int index}) {
    currentIndex = index;
    // if (currentIndex == 2) getFavorites();
    emit(HomeLayoutchangeState());
  }

  HomeModel? homeModel;
  Map<int, bool> favorites = {};

  getHomeData() async {
    emit(HomeLoadingState());

    if (homeModel == null) {
      DioHelper.getData(url: EndPoints.HOME, token: tokenHolder).then((value) {
        homeModel = HomeModel.fromJson(value.data);
        debugPrint(homeModel!.status.toString());
        homeModel!.data!.products!.forEach((element) {
          favorites.addAll({element.id!: element.inFavorites!});
        });
        debugPrint(favorites.toString());

        emit(HomeSuccessState(homeModel: homeModel!));
      }).catchError((e) {
        debugPrint('getHomeData: ${e.toString()}');
        emit(HomeFailureState(errMessage: e.toString()));
      });
    } else {
      emit(HomeSuccessState(homeModel: homeModel!));
    }
  }

  //FAVORITES

  FavoriteModel? favoriteModel;

  getFavorites() {
    emit(FavoriteGetLoadingState());

    DioHelper.getData(url: EndPoints.HOME_Favorite, token: tokenHolder)
        .then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);
      //  debugPrint('getFavorites: ${value.data}');
      emit(FavoriteGetSuccessState());
    }).catchError((e) {
      debugPrint('getFavorites: ${e.toString()}');
      emit(FavoriteGetFailureState());
    });
  }

  FavoriteIConModel? favoriteIConModel;

  changeFavorite({required int productID}) {
    favorites[productID] = !favorites[productID]!;

    emit(HomeFavoriteChangeLoadingState());

    DioHelper.postData(
      url: EndPoints.HOME_Favorite,
      data: {'product_id': productID},
      token: tokenHolder,
    ).then((value) {
      favoriteIConModel = FavoriteIConModel.fromJson(value.data);
      debugPrint('FavoriteIConModel : ${value.data}');

      if (!favoriteIConModel!.status!) {
        favorites[productID] = !favorites[productID]!;
      } else {
        getFavorites();
        // emit(HomeFavoriteChangeSuccessState(favoriteIConModel: favoriteIConModel!));
      }

      emit(HomeFavoriteChangeSuccessState(
          favoriteIConModel: favoriteIConModel!));
    }).catchError((e) {
      favorites[productID] = !favorites[productID]!;
      emit(HomeFavoriteChangeFailureState(errMessage: e.toString()));
      debugPrint('FavoriteIConModel : ${e.toString()}');
    });
  }

  // removeFav(int id) {
  //   if (favorites[id] == id) {
  //     favorites.remove(favorites[id]);
  //   }
  //   emit(HomeFavoriteDeletedSuccessState());
  // }

  HomeCategoriesModel? homeCategoriesModel;
  getHomeCategories() {
    // emit(HomeCategoriesLoadingState());
    if (homeCategoriesModel == null) {
      DioHelper.getData(url: EndPoints.HOME_CATEGORIES).then((value) {
        homeCategoriesModel = HomeCategoriesModel.fromJson(value.data);
        debugPrint(homeCategoriesModel!.status.toString());
        emit(HomeCategoriesSuccessState());
      }).catchError((e) {
        debugPrint('getHomeCategories: ${e.toString()}');
        emit(HomeCategoriesFailureState(errMessage: e.toString()));
      });
    } else {
      emit(HomeCategoriesSuccessState());
    }
  }
}
