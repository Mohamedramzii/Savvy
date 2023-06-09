import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xstore_cubit/core/app_managers/color_manager.dart';
import 'package:xstore_cubit/core/constants.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_button_widget.dart';
import 'package:xstore_cubit/features/products/presentation/viewmodel/home/home_cubit.dart';

import 'widgets/cartviewItemWidget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocProvider(
      create: (BuildContext context) =>HomeCubit()..getCart(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<HomeCubit>(context);
          return Conditional.single(
            context: context,
            conditionBuilder: (context) => state is! GetCartDataLoadingState,
            widgetBuilder: (context) => Column(
              children: [
                Expanded(
                  // height: 300.h,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: cubit.cartModel!.data!.cartItems!.length,
                    itemBuilder: (context, index) => CartViewItemWidget(
                        item: cubit.cartModel!.data!.cartItems![index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      height: 8.h,
                    ),
                  ),
                ),
                if (cubit.carts.isNotEmpty)
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) => Container(
                      color: ColorsManager.kprimaryColor,
                      child: Column(
                        children: [
                          Container(
                            // width: 250.w,
                            width: double.infinity,
                            height: 70.h,
                            decoration: BoxDecoration(
                              color: ColorsManager.kprimaryColor,
                              // borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.0.w, vertical: 10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'items',
                                        style: TextStyle(
                                            fontSize: 16.sp, color: Colors.white),
                                      ),
                                      Text(
                                        cubit.cartModel!.data!.cartItems!.length
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 16.sp, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                            fontSize: 20.sp, color: Colors.white),
                                      ),
                                      Text(
                                        '\$${cubit.cartModel!.data!.total}',
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.greenAccent),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 20.h,
                          // )
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomButtonWidget(
                                color: Colors.black,
                                text: 'Check out',
                                onpressed: () {
                                  print('checkout');
                                }),
                          )
                        ],
                      ),
                    ),
                  )
              ],
            ),
            fallbackBuilder: (context) => LoadingWidget(),
          );
        },
      ),
    ));
  }
}


/*
BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);
        if (cubit.carts.isNotEmpty) {
          return Column(
            children: [
              Expanded(
                // height: 300.h,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cubit.cartModel!.data!.cartItems!.length,
                  itemBuilder: (context, index) => CartViewItemWidget(
                      item: cubit.cartModel!.data!.cartItems![index]),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 8.h,
                  ),
                ),
              ),
              Container(
                color: ColorsManager.kprimaryColor,
                child: Column(
                  children: [
                    Container(
                      // width: 250.w,
                      width: double.infinity,
                      height: 70.h,
                      decoration: BoxDecoration(
                        color: ColorsManager.kprimaryColor,
                        // borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0.w, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'items',
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                                Text(
                                  cubit.carts.length.toString(),
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      fontSize: 20.sp, color: Colors.white),
                                ),
                                Text(
                                  '\$${cubit.cartModel!.data!.total}',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.greenAccent),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 20.h,
                    // )
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButtonWidget(
                          color: Colors.black,
                          text: 'Check out',
                          onpressed: () {
                            print('checkout');
                          }),
                    )
                  ],
                ),
              )
            ],
          );
        } else if (state is GetCartDataLoadingState) {
          return LoadingWidget();
        } else {
          return Image.asset(ImagesManager.emptycart);
        }
      },
    )
*/