import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xstore_cubit/core/constants.dart';
import 'package:xstore_cubit/core/networks/remote/dio_helper.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_Toast_Widget.dart';
import '../../../data/models/cart_model/cart_item.dart';
import '../../../data/models/cart_model/cart_model.dart';
import '../../../data/models/favorite_models/favoriteIconModel.dart';
import '../../../data/models/favorite_models/favoriteModel.dart';
import '../../../../settings/presentation/views/settingsView.dart';
import '../../../data/models/home_model/home_model.dart';
import '../../views/cart_view/cartView.dart';
import '../../views/favorites_view/favoriteView.dart';
import '../../views/home_products_view/homeView.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  //Checking for Connections
  
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _subscription;

  HomeCubit() : super(HomeInitial()) {
    _subscription =
        _connectivity.onConnectivityChanged.listen(_onConnectivityChange);
  }

  //Check For Internet Connection
  bool? isConnected = false;
  _onConnectivityChange([ConnectivityResult? result]) {
    if (result == ConnectivityResult.none) {
      isConnected = false;
      emit(AppInternetConnectionNone());
    } else {
      isConnected = true;
      emit(AppInternetConnectionConnected());
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  //////////////////////////////////////////////////

  // FavoriteCubit favoriteCubit;

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const CartView(),
    const FavoriteView(),
    const SettingsView(),
  ];

  HomeModel? homeModel;

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

        homeModel!.data!.products!.forEach((element) {
          cart.addAll({element.id!: element.inCart!});
        });
        debugPrint('Carts is: $cart');

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
  Map<int, bool> favorites = {};
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
        if (favorites[productID] == false) {
          CustomToastWidget.getToast(
              text: 'Removed Successfully', color: Colors.red);
        } else {
          CustomToastWidget.getToast(
              text: 'Added Successfully', color: Colors.green);
        }
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

  CartModel? cartModel;

  List<CartItem> carts = [];
  Map<int, bool> cart = {};

  getCart() {
    emit(GetCartDataLoadingState());

    DioHelper.getData(url: EndPoints.GETCART, token: tokenHolder).then((value) {
      cartModel = CartModel.fromJson(value.data);
      for (var item in value.data['data']['cart_items']) {
        carts.add(CartItem.fromJson(item['product']));
      }

      emit(GetCartDataSuccessState());
    }).catchError((e) {
      debugPrint('getCart Error: ${e.toString()}');
      emit(GetCartDataFailureState());
    });
  }

  addOrRemoveCartItem({required productID}) {
    cart[productID] = !cart[productID]!;

    emit(AddOrDeleteCartItemDataLoadingState());

    DioHelper.postData(
            url: EndPoints.GETCART,
            data: {'product_id': productID},
            token: tokenHolder)
        .then((value) {
      if (!cartModel!.status!) {
        cart[productID] = !cart[productID]!;
      } else {
        if (!cart[productID]!) {
          CustomToastWidget.getToast(
              text: 'Removed Successfully', color: Colors.red);
          debugPrint('Removed');
        } else {
          CustomToastWidget.getToast(
              text: 'Added Successfully', color: Colors.green);
          debugPrint('Added');
        }
      }
      getCart();
      emit(AddOrDeleteCartItemDataSuccessState());
    }).catchError((e) {
      debugPrint('addordeletecartitem Error: ${e.toString()} ');
      emit(AddOrDeleteCartItemDataFailureState());
    });
  }

  // Set<String> favoritesID = {};
  // List<Product> favorites2 = [];
  // getFavorites2() {
  //   favorites2.clear();
  //   DioHelper.getData(url: EndPoints.HOME_Favorite, token: tokenHolder)
  //       .then((value) {
  //     if (value.data['status'] == true) {
  //       for (var item in value.data['data']['data']) {
  //         favorites2.add(Product.fromJson(item['product']));
  //         favoritesID.add(item['product']['id'].toString());
  //       }
  //       debugPrint('Fav2 length: ${favorites2.length}');
  //       emit(GetFav2SuccessState());
  //     }
  //   }).catchError((e) {
  //     debugPrint('fav2 Error: ${e.toString()}');
  //     emit(GetFav2FailureState());
  //   });
  // }

  // addOrRemoveFavorites({required String productID}) {
  //   DioHelper.postData(
  //           url: EndPoints.HOME_Favorite,
  //           data: {'product_id': productID},
  //           token: tokenHolder)
  //       .then((value) {
  //     if (value.data['status'] == true) {
  //       if (favoritesID.contains(productID)) {
  //         favoritesID.remove(productID);
  //         CustomToastWidget.getToast(
  //             text: 'Removed From Favorites', color: Colors.red);
  //       } else {
  //         favoritesID.add(productID);
  //         CustomToastWidget.getToast(
  //             text: 'Added To Favorites', color: Colors.green);
  //       }
  //     }

  //     getFavorites2();
  //     emit(AddOrDeleteFavoritesSuccessState());
  //   }).catchError((e) {
  //     emit(AddOrDeleteFavoritesFailureState());
  //   });
  // }

  void PageViewChange({required int index, context}) async {
    currentIndex = index;
    emit(HomeLayoutchangeState());

    if (currentIndex == 2) {
      if (favorites.isEmpty) {
        await getFavorites();
      } else {
        emit(FavoriteGetSuccessState());
      }
    }
    // if(currentIndex == 1){
    //   if(carts.isEmpty){
    //     await getCart();
    //   }else{
    //     emit(GetCartDataSuccessState());
    //   }
    // }
  }
}
