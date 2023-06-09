import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xstore_cubit/features/products/presentation/viewmodel/home/home_cubit.dart';
import 'package:xstore_cubit/features/settings/presentation/viewmodel/cubit/settings_cubit.dart';

import '../../../../../core/app_managers/color_manager.dart';
import '../../../../../core/constants.dart';
import '../../../../auth/presentation/views/loginview.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              iconPadding: EdgeInsets.symmetric(vertical: 5.h),
              contentPadding: EdgeInsets.zero,
              icon: const Icon(Icons.logout_outlined),
              content: Text(
                'Are you sure ?',
                style: TextStyle(fontSize: 20.sp),
                textAlign: TextAlign.center,
              ),
              actions: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('No',
                            style: TextStyle(
                                color: Colors.green, fontSize: 18.sp))),
                    TextButton(
                        onPressed: () {
                          BlocProvider.of<SettingsCubit>(context).logout();
                          Navigation.navigationWithoutReturn(context,
                              screen: LoginView());
                          BlocProvider.of<HomeCubit>(context).currentIndex=0;
                        },
                        child: Text('Yes',
                            style:
                                TextStyle(color: Colors.red, fontSize: 18.sp))),
                  ],
                )
              ],
            );
          },
        );
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
