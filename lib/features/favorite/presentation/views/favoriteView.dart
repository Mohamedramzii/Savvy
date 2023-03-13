import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xstore_cubit/features/favorite/presentation/views/favoriteViewBody.dart';
import 'package:xstore_cubit/features/home/presentation/viewmodel/home/home_cubit.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit,HomeState>(
        builder: (context, state) {
          var favCubit = BlocProvider.of<HomeCubit>(context);
          if (state is FavoriteGetSuccessState) {
            return FavoriteViewBody(favoriteModel: favCubit.favoriteModel!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // Conditional.single(
      //   context: context,
      //   // conditionBuilder: (context) => favCubit.favoriteModel != null,
      //   conditionBuilder: (context) =>
      //       state is! HomeFavoriteChangeLoadingState,
      //   widgetBuilder: (context) =>
      //       FavoriteViewBody(favoriteModel: favCubit.favoriteModel!),
      //   fallbackBuilder: (context) {
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
    );
  }
}
