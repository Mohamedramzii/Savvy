import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../networks/local/cache_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  // bool isOnBoarding = false;
  // void modeChange({bool? fromshared}) {
  //   if (fromshared != null) {
  //     isOnBoarding = fromshared;
  //     emit(IsOnBoardingOrLoginState());
  //     print('1. $isOnBoarding');
  //   } else {
  //     isOnBoarding =!isOnBoarding;
  //     CacheHelper.saveData(key: 'OnBoarding', value: isOnBoarding)
  //         .then((value) {
  //           emit(IsOnBoardingOrLoginState());
  //           print('2. $isOnBoarding');
  //         });
  //   }
  // }
}
