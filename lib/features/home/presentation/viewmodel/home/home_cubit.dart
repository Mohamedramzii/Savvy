import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xstore_cubit/core/constants.dart';
import 'package:xstore_cubit/core/networks/remote/dio_helper.dart';

import '../../../../cart/presentation/views/cartView.dart';
import '../../../../favorite/presentation/views/favoriteView.dart';
import '../../../../settings/presentation/views/settingsView.dart';
import '../../../data/models/home_model/home_model.dart';
import '../../views/homeView.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const CartView(),
    const FavoriteView(),
    const SettingsView(),
  ];

  void PageViewChange({required int index}) {
    currentIndex = index;
    emit(HomeLayoutchangeState());
  }

  HomeModel? homeModel;


  getHomeData() async {
    emit(HomeLoadingState());

    DioHelper.getData(url: EndPoints.HOME, token: tokenHolder).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      debugPrint(homeModel!.status.toString());
      emit(HomeSuccessState(homeModel: homeModel!));
    }).catchError((e) {
      debugPrint(e.toString());
      emit(HomeFailureState(errMessage: e.toString()));
    });
  }
}