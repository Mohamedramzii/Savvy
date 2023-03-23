import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_managers/color_manager.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/networks/local/cache_helper.dart';
import '../../../../auth/presentation/views/loginview.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        CacheHelper.clearData(key: tokenKey);
        debugPrint('Token is cleared!!');
        Navigation.navigationWithoutReturn(context, screen: LoginView());
      },
      leading: Icon(
        Icons.logout_outlined,
        color: ColorsManager.kprimaryColor,
      ),
      title: Text('Log out',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: ColorsManager.kprimaryColor, fontSize: 20.sp)),
    );
  }
}
