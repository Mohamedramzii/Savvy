import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xstore_cubit/core/constants.dart';
import 'package:xstore_cubit/core/errors/failures.dart';
import 'package:xstore_cubit/core/networks/remote/dio_helper.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_Toast_Widget.dart';
import 'package:xstore_cubit/features/cart/presentation/viewmodel/Cart_Cubit/cart_cubit.dart';
import 'package:xstore_cubit/features/products/data/models/details_models/details_model.dart';
import 'package:xstore_cubit/features/settings/presentation/viewmodel/cubit/settings_cubit.dart';
import '../../../../cart/presentation/views/cartView.dart';
import '../../../../categories/data/models/homeCategoriesModel.dart';
import '../../../data/models/favorite_models/favoriteIconModel.dart';
import '../../../data/models/favorite_models/favoriteModel.dart';
import '../../../../settings/presentation/views/settingsView.dart';
import '../../../data/models/home_model/home_model.dart';
import '../../views/favorites_view/favoriteView.dart';
import '../../views/home_products_view/homeView.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // FavoriteCubit favoriteCubit;

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const CartView(),
    const FavoriteView(),
    const SettingsView(),
  ];

  HomeModel? homeModel;
  Map<int, bool> favorites = {};

  getHomeData() async {
    emit(HomeLoadingState());

    if (homeModel == null) {
      DioHelper.getData(url: EndPoints.HOME, token: tokenHolder).then((value) {
        homeModel = HomeModel.fromJson(value.data);
        debugPrint('getHomeData: ${homeModel!.status}');
        homeModel!.data!.products!.forEach((element) {
          favorites.addAll({element.id!: element.inFavorites!});
        });
        debugPrint(favorites.toString());

        emit(HomeSuccessState(homeModel: homeModel!));
      }).catchError((e) {
        debugPrint('getHomeData Error: ${e.toString()}');

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
    // homeModel!.data!.products!.forEach((element) {
    //   favorites.addAll({element.id!: element.inFavorites!});
    // });

    DioHelper.getData(url: EndPoints.HOME_Favorite, token: tokenHolder)
        .then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);
      debugPrint('getFavorites: ${value.data['status']}');
      emit(FavoriteGetSuccessState());
    }).catchError((e) {
      debugPrint('getFavorites Error: ${e.toString()}');
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
        print('fav got from here');
        getFavorites();
        // emit(HomeFavoriteChangeSuccessState(favoriteIConModel: favoriteIConModel!));
      }

      emit(HomeFavoriteChangeSuccessState(
          favoriteIConModel: favoriteIConModel!));
    }).catchError((e) {
      favorites[productID] = !favorites[productID]!;
      emit(HomeFavoriteChangeFailureState(errMessage: e.toString()));
      debugPrint('FavoriteIConModel(Change Favorite) Error : ${e.toString()}');
    });
  }

  Set<String> favoritesID = {};
  List<Product> favorites2 = [];
  getFavorites2() {
    favorites2.clear();
    DioHelper.getData(url: EndPoints.HOME_Favorite, token: tokenHolder)
        .then((value) {
      if (value.data['status'] == true) {
        for (var item in value.data['data']['data']) {
          favorites2.add(Product.fromJson(item['product']));
          favoritesID.add(item['product']['id'].toString());
        }
        debugPrint('Fav2 length: ${favorites2.length}');
        emit(GetFav2SuccessState());
      }
    }).catchError((e) {
      debugPrint('fav2 Error: ${e.toString()}');
      emit(GetFav2FailureState());
    });
  }

  addOrRemoveFavorites({required String productID}) {
    // getFavorites2();
    DioHelper.postData(
            url: EndPoints.HOME_Favorite,
            data: {'product_id': productID},
            token: tokenHolder)
        .then((value) {
      if (value.data['status'] == true) {
        if (favoritesID.contains(productID)) {
          favoritesID.remove(productID);
          CustomToastWidget.getToast(
              text: 'Removed From Favorites', color: Colors.red);
        } else {
          favoritesID.add(productID);
          CustomToastWidget.getToast(
              text: 'Added To Favorites', color: Colors.green);
        }
      }

      getFavorites2();
      emit(AddOrDeleteFavoritesSuccessState());
    }).catchError((e) {
      emit(AddOrDeleteFavoritesFailureState());
    });
  }

  void PageViewChange({required int index, context}) async {
    currentIndex = index;
    emit(HomeLayoutchangeState());

    if (currentIndex == 2) {
      if (favorites2.isEmpty) {
        await getFavorites2();
      } else {
        emit(GetFav2SuccessState());
      }
      // if (currentIndex == 1) {
      //      BlocProvider.of<CartCubit>(context).getCart();
      //   }
      }
    }
  }

