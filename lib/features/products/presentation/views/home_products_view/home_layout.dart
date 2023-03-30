import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xstore_cubit/core/app_managers/assets_manager.dart';
import 'package:xstore_cubit/core/app_managers/color_manager.dart';
import 'package:xstore_cubit/core/constants.dart';
import 'package:xstore_cubit/features/search/presentation/views/searchView.dart';

import '../../viewmodel/home/home_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var homeCubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Savvy',
              // textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigation.navigationWithReturn(context,
                        screen: SearchView());
                  },
                  icon: const Icon(Icons.search, size: 30))
            ],
          ),
          body: homeCubit.screens[homeCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: homeCubit.currentIndex,
              onTap: (index) {
                homeCubit.PageViewChange(index: index, context: context);
              },
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    ImagesManager.cart,
                    width: 25,
                    color: ColorsManager.kprimaryColor,
                  ),
                  activeIcon: const Icon(Icons.shopify_outlined),
                  label: 'Cart',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  activeIcon: Icon(Icons.favorite_border),
                  label: 'Favorites',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  activeIcon: Icon(Icons.settings_accessibility),
                  label: 'Settings',
                ),
              ]),
        );
      },
    );
  }
}
