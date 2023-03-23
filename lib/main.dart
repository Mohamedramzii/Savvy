import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:xstore_cubit/core/app_managers/app_theme.dart';
import 'package:xstore_cubit/core/networks/remote/dio_helper.dart';
import 'package:xstore_cubit/features/auth/presentation/views/loginview.dart';
import 'core/constants.dart';
import 'core/networks/local/cache_helper.dart';
import 'features/categories/presentation/viewmodel/cubits/categories_Cubit/categories_cubit.dart';
import 'features/onBoarding/presentation/views/onBoarding_view.dart';
import 'features/products/presentation/viewmodel/home/home_cubit.dart';
import 'features/products/presentation/views/home_products_view/home_layout.dart';
import 'features/settings/presentation/viewmodel/cubit/settings_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  Widget? widget;
  bool? onBoarding = CacheHelper.getData(key: onBoardingKey) ?? false;
  tokenHolder = CacheHelper.getData(key: tokenKey);
  debugPrint('OnBoarding: $onBoarding');
  debugPrint('token: $tokenHolder ');

  if (onBoarding==true) {
    if (tokenHolder != null) {
      widget = const HomeLayout();
    } else {
      widget = LoginView();
    }
  } else {
    widget = const OnBoardingView();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    this.startWidget,
  }) : super(key: key);

  Widget? startWidget;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit()
              ..getHomeData() 
              // ..getHomeCategories()
              // ..getFavorites(),
          ),
          BlocProvider<CategoriesCubit>(
            create: (context) => CategoriesCubit()..getHomeCategories(),
          ),
          BlocProvider<SettingsCubit>(
            create: (context) => SettingsCubit()..getUserData(),
          ),
        ],
        child: MaterialApp(
            // routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            title: 'Savvy',
            theme: APPTHEMES.lightMode,
            darkTheme: APPTHEMES.darkMode,
            themeMode: ThemeMode.light,
            home: startWidget

            // isOnboarding != null && isOnboarding == true
            //     ? LoginView()
            //     : const OnBoardingView()

            ),
      ),
    );
  }
}
