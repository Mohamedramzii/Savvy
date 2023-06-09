import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xstore_cubit/features/auth/presentation/views/loginview.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_Toast_Widget.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_button_widget.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_haveaccount_widget.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_textformfield_widget.dart';

import '../../../../core/app_managers/color_manager.dart';
import '../../../../core/constants.dart';
import '../../../products/presentation/views/home_products_view/home_layout.dart';
import '../view_model/cubits/Auth_CUBIT/auth_cubit.dart';
import '../view_model/cubits/Auth_CUBIT/auth_state.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            var authCubit = AuthCubit.get(context);
            if (state is RegisterSuccessState) {
              if (state.loginModel.status!) {
                // login is done
                CustomToastWidget.getToast(
                    text: state.loginModel.message!, color: Colors.green);

                // then we catch user token
                // CacheHelper.saveData(
                //     key: tokenKey, value: state.authModel.userData!.token);
                // debugPrint('userToken: ${state.authModel.userData!.token}');

                // then we navigate to our home layout
                Navigation.navigationWithoutReturn(context,
                    screen: const HomeLayout());
              }
              //  else {
              //   CustomToastWidget.getToast(
              //       text: state.authModel.message!, color: Colors.red);
              // }
            }
          },
          builder: (context, state) {
            return Scaffold(
              // appBar: AppBar(),
              body: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    // vertical: 90.h,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Register',
                              style: Theme.of(context).textTheme.displayLarge),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text('Register to enjoy our offers!',
                              style: Theme.of(context).textTheme.displayMedium),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTextFormFieldWidget(
                            controller: emailcontroller,
                            keyboardtype: TextInputType.emailAddress,
                            labeltext: 'Email',
                            validate: (String? newValue) {
                              if (newValue!.isEmpty) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            onsave: (String? newValue) {
                              emailcontroller.text = newValue!;
                            },
                            isPassword: false,
                            prefixicon: const Icon(Icons.email),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomTextFormFieldWidget(
                            controller: usernamecontroller,
                            keyboardtype: TextInputType.text,
                            labeltext: 'Username',
                            validate: (String? newValue) {
                              if (newValue!.isEmpty) {
                                return 'Please enter a valid user name';
                              }
                              return null;
                            },
                            onsave: (String? newValue) {
                              usernamecontroller.text = newValue!;
                            },
                            isPassword: false,
                            prefixicon: const Icon(Icons.person),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomTextFormFieldWidget(
                            controller: phonecontroller,
                            keyboardtype: TextInputType.number,
                            labeltext: 'Phone Number',
                            validate: (String? newValue) {
                              if (newValue!.isEmpty) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                            onsave: (String? newValue) {
                              phonecontroller.text = newValue!;
                            },
                            isPassword: false,
                            prefixicon: const Icon(Icons.phone_android),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomTextFormFieldWidget(
                            controller: passwordcontroller,
                            keyboardtype: TextInputType.text,
                            labeltext: 'Password',
                            validate: (String? newValue) {
                              if (newValue!.isEmpty || newValue.length <= 6) {
                                return 'Password must be at least 8 characters';
                              }
                              return null;
                            },
                            onsave: (String? newValue) {
                              passwordcontroller.text = newValue!;
                            },
                            isPassword: AuthCubit.get(context).isHidden,
                            prefixicon: const Icon(Icons.lock),
                            sufixicon: IconButton(
                              onPressed: () {
                                AuthCubit.get(context).visibilityChange();
                              },
                              icon: Icon(AuthCubit.get(context).isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            textInputAction: TextInputAction.done,
                            onsubmitted: (value) {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                AuthCubit.get(context).registerUser(
                                    email: emailcontroller.text.trim(),
                                    phone: phonecontroller.text.trim(),
                                    password: passwordcontroller.text.trim(),
                                    name: usernamecontroller.text.trim());
                              }
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Conditional.single(
                            context: context,
                            conditionBuilder: (context) =>
                                state is! RegisterLoadingState,
                            widgetBuilder: (context) => CustomButtonWidget(
                              text: 'REGISTER',
                              onpressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  AuthCubit.get(context).registerUser(
                                      name: usernamecontroller.text.trim(),
                                      phone: phonecontroller.text.trim(),
                                      email: emailcontroller.text.trim(),
                                      password: passwordcontroller.text.trim());
                                }
                              },
                            ),
                            fallbackBuilder: (context) => Center(
                              child: LoadingAnimationWidget.staggeredDotsWave(
                                  color: ColorsManager.kprimaryColor, size: 50),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomhaveAccountWidget(
                            text: 'Already have an account?',
                            toText: 'AUTH',
                            onpressed: () {
                              Navigation.navigationWithReturn(context,
                                  screen: LoginView());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
