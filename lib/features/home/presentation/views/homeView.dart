import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:xstore_cubit/core/app_managers/color_manager.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_Toast_Widget.dart';
import 'package:xstore_cubit/features/home/presentation/viewmodel/home/home_cubit.dart';

import '../../../categories/presentation/viewmodel/cubits/categories_Cubit/categories_cubit.dart';
import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeFavoriteChangeSuccessState) {
          if (!state.favoriteIConModel.status!) {
            CustomToastWidget.getToast(
                text: state.favoriteIConModel.message!, color: Colors.red);
          }
        }
      },
      builder: (context, state) {
        var homeCubit = BlocProvider.of<HomeCubit>(context);
        // var categoryCubit = BlocProvider.of<CategoriesCubit>(context);
        return Conditional.single(
          context: context,
          conditionBuilder: (context) {
            return homeCubit.homeModel != null &&
                homeCubit.homeCategoriesModel != null;
          },
          widgetBuilder: (context) {
            return HomeViewBody(
              homeModel: homeCubit.homeModel!,
              homeCategoriesModel: homeCubit.homeCategoriesModel!,
            );
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
