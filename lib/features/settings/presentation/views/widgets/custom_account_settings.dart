import 'package:flutter/material.dart';

import '../../../../../core/app_managers/color_manager.dart';
import '../../../../../core/constants.dart';
import '../profileView.dart';

class CustomAccountSettingsWidget extends StatelessWidget {
  const CustomAccountSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigation.navigationWithReturn(context, screen: ProfileView());
      },
      leading: Icon(
        Icons.settings,
        color: ColorsManager.kprimaryColor,
      ),
      title: Text('Account Settings',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: ColorsManager.kprimaryColor)),
      trailing:
          Icon(Icons.arrow_forward_ios, color: ColorsManager.kprimaryColor),
    );
  }
}
