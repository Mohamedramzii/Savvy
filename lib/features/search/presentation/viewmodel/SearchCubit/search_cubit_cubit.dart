import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:xstore_cubit/core/constants.dart';
import 'package:xstore_cubit/core/networks/remote/dio_helper.dart';
import 'package:xstore_cubit/features/search/data/models/search_model/search_model.dart';

part 'search_cubit_state.dart';

class SearchCubit extends Cubit<SearchCubitState> {
  SearchCubit() : super(SearchCubitInitial());

  SearchModel? searchModel;

  getSearch({required String searchText}) {
    emit(SearchCubitLoadingState());

    DioHelper.postData(
        url: EndPoints.SEARCH,
        token: tokenHolder,
        data: {'text': searchText}).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchCubitSuccessState());
    }).catchError((e) {
      debugPrint('getSearch Error: ${e.toString()}');
      emit(SearchCubitFailureState());
    });
  }
}
