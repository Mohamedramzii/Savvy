import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:xstore_cubit/core/constants.dart';
import 'package:xstore_cubit/core/networks/remote/dio_helper.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_Toast_Widget.dart';
import 'package:xstore_cubit/features/cart/data/models/cart_model/cart_item.dart';
import 'package:xstore_cubit/features/cart/data/models/cart_model/cart_model.dart';
import 'package:xstore_cubit/features/cart/data/models/cart_model/product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartModel? cartModel;

  List<CartItem> carts = [];

  getCart() {
    emit(GetCartDataLoadingState());

    DioHelper.getData(url: EndPoints.GETCART, token: tokenHolder).then((value) {
      cartModel = CartModel.fromJson(value.data);
      for (var item in value.data['data']['cart_items']) {
        carts.add(CartItem.fromJson(item['product']));
      }
      debugPrint('getCart success: True');

      emit(GetCartDataSuccessState());
    }).catchError((e) {
      debugPrint('getCart Error: ${e.toString()}');
      emit(GetCartDataFailureState());
    });
  }

  addOrRemoveCartItem({required productID}) {
    emit(AddOrDeleteCartItemDataLoadingState());

    DioHelper.postData(
            url: EndPoints.GETCART,
            data: {'product_id': productID},
            token: tokenHolder)
        .then((value) {
      CustomToastWidget.getToast(
          text: 'item is added to your cart', color: Colors.green);
      // getCart();
      emit(AddOrDeleteCartItemDataSuccessState());
    }).catchError((e) {
      debugPrint('addordeletecartitem Error: ${e.toString()} ');
      emit(AddOrDeleteCartItemDataFailureState());
    });
  }
}
