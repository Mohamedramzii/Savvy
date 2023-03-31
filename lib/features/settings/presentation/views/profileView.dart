// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xstore_cubit/core/app_managers/color_manager.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_textformfield_widget.dart';
import 'package:xstore_cubit/features/settings/presentation/viewmodel/cubit/settings_cubit.dart';
import 'package:xstore_cubit/features/settings/presentation/views/change_password_view.dart';
import 'package:xstore_cubit/features/settings/presentation/views/settingsView.dart';
import 'package:xstore_cubit/features/settings/presentation/views/widgets/custom_image_widget.dart';

import '../../../../core/constants.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingsCubit()..getUserData(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<SettingsCubit>(context);
          var model = cubit.userModel;
          // namecontroller.text = model!.userData!.name!;
          // emailcontroller.text = model.userData!.email!;
          // phonecontroller.text = model.userData!.phone!;

          return Scaffold(
            body: Conditional.single(
              context: context,
              conditionBuilder: (context) => cubit.userModel != null,
              widgetBuilder: (context) => Center(
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200),
                      topRight: Radius.circular(200),
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                  ),
                  shadowColor: ColorsManager.kprimaryColor,
                  elevation: 10,
                  margin: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 20.h),
                        child: Column(
                          children: [
                            if (state is USerDataUpdateLoadingState)
                              SizedBox(
                                width: 170.w,
                                child: LinearProgressIndicator(
                                  backgroundColor: Colors.grey.shade200,
                                  color: ColorsManager.kprimaryColor,
                                ),
                              ),
                            if (state is! USerDataUpdateLoadingState)
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_back),
                                padding: EdgeInsets.zero,
                              ),
                            CustomImageWidget(
                                data: BlocProvider.of<SettingsCubit>(context)
                                    .userModel!,
                                width: 140.w,
                                height: 140.h),
                            Align(
                                alignment: Alignment.centerRight,
                                child: TextButton.icon(
                                    onPressed: () {
                                      Navigation.navigationWithReturn(context,
                                          screen: ChangePasswordView());
                                    },
                                    icon: Icon(
                                      Icons.lock_open,
                                      color: ColorsManager.kprimaryColor,
                                    ),
                                    label: Text(
                                      'Change Your Password',
                                      style: TextStyle(
                                          color: ColorsManager.kprimaryColor,
                                          fontSize: 15.sp,
                                          decoration: TextDecoration.underline),
                                    ))),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextFormFieldWidget(
                                controller: namecontroller,
                                keyboardtype: TextInputType.name,
                                labeltext: 'Username',
                                initialtext: model!.userData!.name!,
                                isPassword: false,
                                isEnabled: cubit.isUpdating,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a valid username';
                                  }
                                  return null;
                                },
                                onsave: (newValue) {
                                  namecontroller.text = newValue!;
                                },
                                prefixicon: const Icon(Icons.person)),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextFormFieldWidget(
                                controller: emailcontroller,
                                keyboardtype: TextInputType.emailAddress,
                                labeltext: 'Email Address',
                                initialtext: model.userData!.email!,
                                isPassword: false,
                                isEnabled: cubit.isUpdating,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                                onsave: (newValue) {
                                  emailcontroller.text = newValue!.trim();
                                },
                                prefixicon: const Icon(Icons.email)),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextFormFieldWidget(
                                controller: phonecontroller,
                                keyboardtype: TextInputType.name,
                                labeltext: 'Phone Number',
                                initialtext: model.userData!.phone,
                                isPassword: false,
                                isEnabled: cubit.isUpdating,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a valid phone number';
                                  }
                                  return null;
                                },
                                onsave: (newValue) {
                                  phonecontroller.text = newValue!.trim();
                                },
                                prefixicon: const Icon(Icons.phone_android)),
                            SizedBox(
                              height: 20.h,
                            ),
                            Visibility(
                              visible: !cubit.isUpdating,
                              replacement: _replacement_body(cubit),
                              child: _mainWidget_body(cubit),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              fallbackBuilder: (context) => Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: ColorsManager.kprimaryColor, size: 50),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _mainWidget_body(SettingsCubit cubit) {
    return MaterialButton(
      shape: const StadiumBorder(),
      minWidth: double.infinity,
      height: 40.h,
      onPressed: () {
        cubit.updating();
      },
      color: ColorsManager.kprimaryColor,
      child: Text(
        // cubit.isUpdating && !_formkey.currentState!.validate()? 'Save' :
        'Update',
        style: TextStyle(fontSize: 18.sp, color: Colors.white),
      ),
    );
  }

  Widget _replacement_body(SettingsCubit cubit) {
    return Column(
      children: [
        MaterialButton(
          shape: const StadiumBorder(),
          minWidth: double.infinity,
          height: 40.h,
          onPressed: () {
            cubit.updating();
            if (!cubit.isUpdating) {
              if (_formkey.currentState!.validate()) {
                _formkey.currentState!.save();
                cubit.updateUserData(
                  name: namecontroller.text,
                  email: emailcontroller.text,
                  phone: phonecontroller.text,
                );
              }
            }
          },
          color: ColorsManager.kprimaryColor,
          child: Text(
            // cubit.isUpdating && !_formkey.currentState!.validate()? 'Save' :
            'Save',
            style: TextStyle(fontSize: 18.sp, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        MaterialButton(
          shape: const StadiumBorder(),
          minWidth: double.infinity,
          height: 40.h,
          onPressed: () {
            cubit.updating();
          },
          color: Colors.grey,
          child: Text(
            'Cancel',
            style: TextStyle(fontSize: 18.sp, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
