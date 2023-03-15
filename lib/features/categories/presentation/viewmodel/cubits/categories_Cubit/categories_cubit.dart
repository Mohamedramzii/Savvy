import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/networks/remote/dio_helper.dart';
import '../../../../data/models/homeCategoriesModel.dart';


part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  HomeCategoriesModel? homeCategoriesModel;
  getHomeCategories() {
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
