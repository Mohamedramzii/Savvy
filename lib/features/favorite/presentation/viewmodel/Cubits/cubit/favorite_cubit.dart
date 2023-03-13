import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:xstore_cubit/core/constants.dart';
import 'package:xstore_cubit/core/networks/remote/dio_helper.dart';
import 'package:xstore_cubit/features/favorite/data/models/favoriteModel.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  // Map<int, bool> favorites = {};

  // FavoriteModel? favoriteModel;

  // getFavorites() {
  //   emit(FavoriteLoadingState());

  //   DioHelper.getData(url: EndPoints.HOME_Favorite,token: tokenHolder ).then((value) {
  //     favoriteModel = FavoriteModel.fromJson(value.data);
  //     //  debugPrint('getFavorites: ${value.data}');
  //     emit(FavoriteSuccessState());
  //   }).catchError((e) {
  //     debugPrint('getFavorites: ${e.toString()}');
  //     emit(FavoriteFailureState());
  //   });
  // }
  

}
