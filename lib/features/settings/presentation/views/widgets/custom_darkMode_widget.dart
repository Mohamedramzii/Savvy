import 'package:flutter/material.dart';

import '../../../../../core/app_managers/color_manager.dart';

class CustomDarkModeWidget extends StatelessWidget {
  const CustomDarkModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.dark_mode_outlined,
        color: ColorsManager.kprimaryColor,
      ),
      title: Text('Dark Mode',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: ColorsManager.kprimaryColor)),
    );
  }
}
