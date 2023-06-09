import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xstore_cubit/core/app_managers/color_manager.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_Toast_Widget.dart';

import '../../../../categories/presentation/viewmodel/cubits/categories_Cubit/categories_cubit.dart';
import '../../viewmodel/home/home_cubit.dart';
import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        var homeCubit = BlocProvider.of<HomeCubit>(context);
        if (state is HomeFavoriteChangeSuccessState) {
          if (!state.favoriteIConModel.status!) {
            CustomToastWidget.getToast(
                text: state.favoriteIConModel.message!, color: Colors.red);
          }
        }
      },
      builder: (context, state) {
        var homeCubit = BlocProvider.of<HomeCubit>(context);
        var categoryCubit = BlocProvider.of<CategoriesCubit>(context);
        return Conditional.single(
          context: context,
          conditionBuilder: (context) {
            return homeCubit.homeModel != null &&
                categoryCubit.homeCategoriesModel != null;
          },
          widgetBuilder: (context) {
            return HomeViewBody(
              state: state,
              homeModel: homeCubit.homeModel!,
              homeCategoriesModel: categoryCubit.homeCategoriesModel!,
            );
          },
          fallbackBuilder: (context) {
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: ColorsManager.kprimaryColor, size: 50),
            );
          },
        );
      },
    );
  }
}
