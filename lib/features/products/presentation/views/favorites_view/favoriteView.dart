import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../viewmodel/home/home_cubit.dart';
import 'favoriteViewBody.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var favCubit = BlocProvider.of<HomeCubit>(context);
          if (state is GetFav2SuccessState) {
            // return FavoriteViewBody(favoriteModel: favCubit.favoriteModel!);
            return FavoriteViewBody(fav: favCubit.favorites2);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
