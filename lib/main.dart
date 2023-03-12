import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:xstore_cubit/core/app_managers/app_theme.dart';
import 'package:xstore_cubit/core/networks/remote/dio_helper.dart';
import 'package:xstore_cubit/features/auth/presentation/views/loginview.dart';

import 'core/networks/local/cache_helper.dart';
import 'features/onBoarding/presentation/views/onBoarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  bool? onBoarding = CacheHelper.getData(key: 'OnBoarding');
  debugPrint('$onBoarding');
  runApp(MyApp(
    isOnboarding: onBoarding,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    this.isOnboarding,
  }) : super(key: key);

  bool? isOnboarding;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
          // routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          title: 'Savvy',
          theme: APPTHEMES.lightMode,
          darkTheme: APPTHEMES.darkMode,
          themeMode: ThemeMode.light,
          home: isOnboarding != null && isOnboarding == true
              ? LoginView()
              : const OnBoardingView()),
    );
  }
}
