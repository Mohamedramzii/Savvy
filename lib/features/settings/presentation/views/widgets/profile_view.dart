// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:xstore_cubit/features/settings/presentation/viewmodel/cubit/settings_cubit.dart';
// import 'package:xstore_cubit/features/settings/presentation/views/widgets/custom_image_widget.dart';

// import '../../../../../core/app_managers/color_manager.dart';
// import 'custom_textField_widget.dart';

// class ProfileView extends StatelessWidget {
//   ProfileView({super.key});

// final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController phonecontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SettingsCubit, SettingsState>(
//       builder: (context, state) {
//         var cubit = BlocProvider.of<SettingsCubit>(context);
//         return Scaffold(
//           body: Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Visibility(
//                     visible: cubit.isUpdating,
//                     replacement: replacementProfileWidget(cubit),
//                     child: mainProfileWidget(cubit),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: MaterialButton(
//                       onPressed: () {
//                         cubit.updating();
//                         if (cubit.isUpdating) {
//                           cubit.updateUserData(
//                               email: emailcontroller.text.trim(),
//                               name: namecontroller.text.trim(),
//                               phone: phonecontroller.text.trim());
//                           print('updating');
//                         }
//                       },
//                       color: ColorsManager.kprimaryColor,
//                       child: Text(
//                         !cubit.isUpdating ? 'Done' : 'UPDATE',
//                         style: TextStyle(fontSize: 17.sp, color: Colors.white),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget mainProfileWidget(SettingsCubit cubit) {
//     return BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
//       if (state is USerDataUpdateSuccessState) {
//         return Card(
//           margin: EdgeInsets.only(top: 100.h),
//           shadowColor: ColorsManager.kprimaryColor,
//           elevation: 10,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           // color: Colors.red,
//           child: Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 CustomImageWidget(
//                     data: cubit.userModel!, width: 120.w, height: 120.h),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 build_Row(
//                     text: cubit.userModel!.userData!.name!,
//                     hinttext: 'Username',
//                     icon: Icons.person),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 build_Row(
//                   text: cubit.userModel!.userData!.email!,
//                   hinttext: 'Email',
//                   icon: Icons.email,
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 build_Row(
//                     text: '+02 ${cubit.userModel!.userData!.phone!}',
//                     hinttext: 'Phone Number',
//                     icon: Icons.phone_android),
//               ],
//             ),
//           ),
//         );
//       } else {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//     });
//   }

//   Widget build_Row(
//       {required String text,
//       required String hinttext,
//       required IconData icon}) {
//     return Column(
//       // mainAxisAlignment: MainAxisAlignment.spaceAround,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Icon(
//               icon,
//               size: 20,
//               color: Colors.grey,
//             ),
//             Text(
//               hinttext,
//               style: const TextStyle(color: Colors.grey),
//             )
//           ],
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 0.w),
//           child: Text(
//             text,
//             style:
//                 TextStyle(fontSize: 25.sp, color: ColorsManager.kprimaryColor),
//           ),
//         ),
//       ],
//     );
//   }

//   Column replacementProfileWidget(SettingsCubit cubit) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 100.h,
//         ),
//         CustomImageWidget(data: cubit.userModel!, width: 120.w, height: 120.h),
//         SizedBox(
//           height: 10.h,
//         ),
//         CustomTextFieldWIdget(
//           controller: namecontroller,
//           prefixICon: const Icon(Icons.person),
//           text: 'New username',
//           onsubmitted: (String? newValue) {
//             namecontroller.text = newValue!.trim();
//           },
//         ),
//         SizedBox(
//           height: 20.h,
//         ),
//         CustomTextFieldWIdget(
//           controller: emailcontroller,
//           prefixICon: const Icon(Icons.mail),
//           text: 'New email address',
//           onsubmitted: (String? newValue) {
//             emailcontroller.text = newValue!.trim();
//           },
//         ),
//         SizedBox(
//           height: 20.h,
//         ),
//         CustomTextFieldWIdget(
//           controller: phonecontroller,
//           prefixICon: const Icon(Icons.phone_android),
//           text: 'New Phone Number',
//           onsubmitted: (String? newValue) {
//             phonecontroller.text = newValue!.trim();
//           },
//         ),
//       ],
//     );
//   }
// }
