import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xstore_cubit/features/auth/presentation/view_model/cubits/LOGIN_CUBIT/login_cubit.dart';
import 'package:xstore_cubit/features/auth/presentation/views/registerview.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_Toast_Widget.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_button_widget.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_haveaccount_widget.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_textformfield_widget.dart';

import '../../../../core/constants.dart';
import '../../../products/presentation/views/home_products_view/home_layout.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            var loginCubit = LoginCubit.get(context);
            if (state is LoginSuccessState) {
              if (state.loginModel.status!) {
                // Login is done
                CustomToastWidget.getToast(
                    text: state.loginModel.message!, color: Colors.green);

                // then we catch user token
                // CacheHelper.saveData(
                //     key: tokenKey, value: state.loginModel.userData!.token);
                // debugPrint('userToken: ${state.loginModel.userData!.token}');

                // then we navigate to our home layout
                Navigation.navigationWithoutReturn(context,
                    screen: const HomeLayout());
              }
              //  else {
              //   CustomToastWidget.getToast(
              //       text: state.loginModel.message!, color: Colors.red);
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
                          Text('LOGIN',
                              style: Theme.of(context).textTheme.displayLarge),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text('Welcome Again!',
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
                            controller: passwordcontroller,
                            keyboardtype: TextInputType.text,
                            labeltext: 'Password',
                            validate: (String? newValue) {
                              if (newValue!.isEmpty) {
                                return 'Password must be at least 8 characters';
                              }
                              return null;
                            },
                            onsave: (String? newValue) {
                              passwordcontroller.text = newValue!;
                            },
                            isPassword: LoginCubit.get(context).isHidden,
                            prefixicon: const Icon(Icons.lock),
                            sufixicon: IconButton(
                              onPressed: () {
                                LoginCubit.get(context).visibilityChange();
                              },
                              icon: Icon(LoginCubit.get(context).isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            textInputAction: TextInputAction.done,
                            onsubmitted: (value) {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                LoginCubit.get(context).loginUser(
                                    email: emailcontroller.text.trim(),
                                    password: passwordcontroller.text.trim());
                              }
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Conditional.single(
                            context: context,
                            conditionBuilder: (context) =>
                                state is! LoginLoadingState,
                            widgetBuilder: (context) => CustomButtonWidget(
                              text: 'LOGIN',
                              onpressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  LoginCubit.get(context).loginUser(
                                      email: emailcontroller.text.trim(),
                                      password: passwordcontroller.text.trim());
                                }
                              },
                            ),
                            fallbackBuilder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomhaveAccountWidget(
                            text: 'Don\'t have an account?',
                            toText: 'REGISTER',
                            onpressed: () {
                              Navigation.navigationWithReturn(context,
                                  screen:  RegisterView());
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
