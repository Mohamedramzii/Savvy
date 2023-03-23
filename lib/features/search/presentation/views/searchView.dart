import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xstore_cubit/features/search/presentation/viewmodel/SearchCubit/search_cubit_cubit.dart';
import 'package:xstore_cubit/features/search/presentation/views/widgets/custom_Search_listview_ITEM_widget.dart';

import '../../../../core/app_managers/color_manager.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchCubitState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<SearchCubit>(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  TextField(
                    controller: controller,
                    onChanged: (value) {
                      cubit.getSearch(searchText: value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      disabledBorder: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: ColorsManager.kprimaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  if (state is SearchCubitLoadingState && controller.text != '')
                    LinearProgressIndicator(
                      color: ColorsManager.kprimaryColor,
                    ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Visibility(
                      visible: (state is SearchCubitSuccessState &&
                          controller.text != ''),
                      replacement: Column(
                        children: [
                         SizedBox(height: 200.h,),
                          Center(
                            child: Text(
                              //! add an png or lottie
                              'Emptyyyyyyyyyy',
                              style: TextStyle(fontSize: 50.sp),
                            ),
                          ),
                        ],
                      ),
                      child: Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemCount: cubit.searchModel?.data!.data!.length ?? 0,
                          itemBuilder: (context, index) {
                            return CustomSearchListViewITEMWidget(
                              searchModel:
                                  cubit.searchModel!.data!.data![index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 15.h,
                            );
                          },
                        ),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
