import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xstore_cubit/features/settings/presentation/viewmodel/cubit/settings_cubit.dart';

import '../../../../../core/app_managers/color_manager.dart';

class CustomDarkModeWidget extends StatelessWidget {
  const CustomDarkModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.color_lens_outlined,
        color: ColorsManager.kprimaryColor,
      ),
      title: Text('Theme Mode',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: ColorsManager.kprimaryColor)),
      trailing: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<SettingsCubit>(context);
          return Text(cubit.isDark ? 'Dark Mode': 'Light Mode');
        },
      ),
    );
  }
}
