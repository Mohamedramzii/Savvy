import 'package:awesome_dialog/awesome_dialog.dart';
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
  // HttpOverrides.global = MyHttpOverrides();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');

  Widget? widget;
  bool? onBoarding = CacheHelper.getData(key: onBoardingKey) ?? false;
  tokenHolder = CacheHelper.getData(key: tokenKey);
  debugPrint('OnBoarding: $onBoarding');
  debugPrint('token: $tokenHolder ');

  if (onBoarding == true) {
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
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    this.startWidget,
    this.isDark,
  }) : super(key: key);

  Widget? startWidget;
  bool? isDark;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
              create: (context) => HomeCubit()
                ..getHomeData()
                ..getFavorites()
                ..getCart()),
          BlocProvider<CategoriesCubit>(
            create: (context) => CategoriesCubit()..getHomeCategories(),
          ),
          BlocProvider<SettingsCubit>(
            create: (context) => SettingsCubit()
              ..modeChange(fromshared: isDark)
              ..getUserData(),
          ),
        ],
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) => MaterialApp(
              // routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              title: 'Savvy',
              theme: APPTHEMES.lightMode,
              darkTheme: APPTHEMES.darkMode,
              themeMode: BlocProvider.of<SettingsCubit>(context).isDark ==true
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: startWidget
              // home: InternetConnectionCheckerStream(
              //   widget: startWidget!,
              // )
              // startWidget
              ),
        ),
      ),
    );
  }
}
// class MyHttpOverrides extends HttpOverrides {
//   @override
//    HttpClient CreateHttpClient(SecurityContext context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
