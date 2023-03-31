import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xstore_cubit/core/app_managers/assets_manager.dart';
import 'package:xstore_cubit/features/Auth/presentation/views/widgets/custom_Toast_Widget.dart';
import 'package:xstore_cubit/features/auth/presentation/view_model/cubits/Auth_CUBIT/auth_cubit.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_button_widget.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_textformfield_widget.dart';
import 'package:xstore_cubit/features/settings/presentation/viewmodel/cubit/settings_cubit.dart';

import '../../../../core/app_managers/color_manager.dart';
import '../../../auth/presentation/view_model/cubits/Auth_CUBIT/auth_state.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});
  GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingsCubit(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          var cubit = BlocProvider.of<SettingsCubit>(context);
          if (state is ChangePasswordSuccessState) {
            if (cubit.status!) {
              CustomToastWidget.getToast(
                  text: cubit.message!, color: Colors.green);
            } else {
              CustomToastWidget.getToast(
                  text: cubit.message!, color: Colors.red);
            }
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<SettingsCubit>(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Image.asset(ImagesManager.forgotpassword),
                      SizedBox(
                        height: 50.h,
                      ),
                      CustomTextFormFieldWidget(
                          controller: currentPasswordController,
                          keyboardtype: TextInputType.text,
                          labeltext: 'Current Password',
                          isPassword: cubit.isHidden2,
                          validate: (String? newValue) {
                            if (newValue!.isEmpty) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                          onsave: (String? newValue) {
                            currentPasswordController.text = newValue!;
                          },
                          sufixicon: IconButton(
                              onPressed: () => cubit.visibilityChange2(),
                              icon: Icon(cubit.isHidden2
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          prefixicon: const Icon(Icons.lock)),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormFieldWidget(
                          controller: newPasswordController,
                          keyboardtype: TextInputType.text,
                          labeltext: 'New Password',
                          isPassword: cubit.isHidden2,
                          validate: (String? newValue) {
                            if (newValue!.isEmpty) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                          onsave: (String? newValue) {
                            newPasswordController.text = newValue!;
                          },
                          sufixicon: IconButton(
                              onPressed: () => cubit.visibilityChange2(),
                              icon: Icon(cubit.isHidden2
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          prefixicon: const Icon(Icons.lock)),
                      SizedBox(
                        height: 20.h,
                      ),
                      Conditional.single(
                        context: context,
                        conditionBuilder: (context) =>
                            state is! ChangePasswordLoadingState,
                        widgetBuilder: (context) => CustomButtonWidget(
                          text: 'Change Password',
                          onpressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              cubit.changePassword(
                                  context: context,
                                  currentPassword:
                                      currentPasswordController.text.trim(),
                                  newPassword:
                                      newPasswordController.text.trim());
                            }
                          },
                        ),
                        fallbackBuilder: (context) => Center(
                              child: LoadingAnimationWidget.staggeredDotsWave(
                                  color: ColorsManager.kprimaryColor, size: 50),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
