import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xstore_cubit/core/app_managers/color_manager.dart';
import 'package:xstore_cubit/features/settings/presentation/views/profileView.dart';
import 'package:xstore_cubit/features/settings/presentation/views/widgets/custom_account_settings.dart';
import 'package:xstore_cubit/features/settings/presentation/views/widgets/custom_darkMode_widget.dart';
import 'package:xstore_cubit/features/settings/presentation/views/widgets/custom_image_widget.dart';
import 'package:xstore_cubit/features/settings/presentation/views/widgets/custom_logout_widget.dart';

import '../viewmodel/cubit/settings_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => SettingsCubit()..getUserData(),
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<SettingsCubit>(context);
            // var userData = cubit.userModel!.userData;
            if (cubit.userModel != null) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 300.h,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: ColorsManager.kprimaryColor,
                            width: 4,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 10.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageWidget(
                                  data: cubit.userModel!,
                                  height: 95.h,
                                  width: 95.w,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text(
                                        '${cubit.userModel!.userData!.name}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                      Text(
                                        '${cubit.userModel!.userData!.email}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const CustomAccountSettingsWidget(),
                          const CustomDarkModeWidget(),
                          SizedBox(
                            height: 20.h,
                          ),
                          const Divider(),
                          const LogOutWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: ColorsManager.kprimaryColor, size: 20),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
