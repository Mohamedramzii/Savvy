// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xstore_cubit/core/app_managers/color_manager.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_textformfield_widget.dart';
import 'package:xstore_cubit/features/settings/presentation/viewmodel/cubit/settings_cubit.dart';
import 'package:xstore_cubit/features/settings/presentation/views/widgets/custom_image_widget.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<SettingsCubit>(context);
        var model = cubit.userModel;
        namecontroller.text = model!.userData!.name!;
        emailcontroller.text = model.userData!.email!;
        phonecontroller.text = model.userData!.phone!;

        return Scaffold(
          body: Conditional.single(
            context: context,
            conditionBuilder: (context) => cubit.userModel != null,
            widgetBuilder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      if (state is USerDataUpdateLoadingState)
                        LinearProgressIndicator(
                          color: ColorsManager.kprimaryColor,
                        ),
                      CustomImageWidget(
                          data: BlocProvider.of<SettingsCubit>(context)
                              .userModel!,
                          width: 140.w,
                          height: 140.h),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomTextFormFieldWidget(
                          controller: namecontroller,
                          keyboardtype: TextInputType.name,
                          labeltext: 'Username',
                          initialtext: namecontroller.text,
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
                          labeltext: 'email address',
                          initialtext: emailcontroller.text,
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
                          initialtext: phonecontroller.text,
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
            fallbackBuilder: (context) =>
                const CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }

  MaterialButton _mainWidget_body(SettingsCubit cubit) {
    return MaterialButton(
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

  MaterialButton _replacement_body(SettingsCubit cubit) {
    return MaterialButton(
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
    );
  }
}
