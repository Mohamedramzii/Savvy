import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_button_widget.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_haveaccount_widget.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_textformfield_widget.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey _formKey = GlobalKey<FormFieldState>();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            // vertical: 90.h,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LOGIN', style: Theme.of(context).textTheme.displayLarge),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text('Login now and enjoy with our offers!',
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
                    isPassword: true,
                    prefixicon: const Icon(Icons.lock),
                    sufixicon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CustomButtonWidget(text: 'LOGIN'),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomhaveAccountWidget(
                    text: 'Don\'t have an account?',
                    toText: 'REGISTER',
                    onpressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
