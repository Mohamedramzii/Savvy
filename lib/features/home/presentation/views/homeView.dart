import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:xstore_cubit/core/app_managers/color_manager.dart';
import 'package:xstore_cubit/features/home/presentation/viewmodel/home/home_cubit.dart';

import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var homeCubit = BlocProvider.of<HomeCubit>(context);
        return Conditional.single(
          context: context,
          conditionBuilder: (context) {
            return homeCubit.homeModel != null;
          },
          widgetBuilder: (context) {
            return HomeViewBody(homeModel: homeCubit.homeModel!);
          },
          fallbackBuilder: (context) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorsManager.kprimaryColor,
              ),
            );
          },
        );
      },
    );
  }
}
