import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/core/extension/text_ex.dart';
import 'package:social_app/core/routes/routes_manger.dart';


import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../view_model/auth_view_model.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit,AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            log(state.error);
            Fluttertoast.showToast(
              msg: "Registration Failed: ${state.error}",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }
          if (state is AuthLoading) {
            Fluttertoast.showToast(
              msg: "Registering...",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
            );
          }
          if (state is AuthSuccess) {
            Fluttertoast.showToast(
              msg: "Registered Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );
            Navigator.pushNamed(context, RouteManger.login);
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: REdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Icon(Icons.lock_open_rounded, size: 80)),
                      SizedBox(height: 40.h),
                      Center(
                        child: CustomText(
                          text: 'Lets create an account for you',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        hintText: 'User Name',
                        controller: userNameController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter your user name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        hintText: 'Email',
                        controller: emailController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter your email';
                          } else if (!text.isValidEmail) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        hintText: 'Password',
                        obscureText: true,
                        controller: passwordController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter your password';
                          } else if (!text.isValidPassword) {
                            return 'Password must be at least 8 characters long and contain at least one letter and one number';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10.h),

                      CustomTextFormField(
                        hintText: 'Confirm Password',
                        controller: confirmPasswordController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please confirm your password';
                          } else if (text != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                      SizedBox(height: 20.h),

                      CustomElevatedButton(
                        text: 'Register',
                        onPressed: ()  async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          // Perform register action

                          await BlocProvider.of<AuthCubit>(context).register(
                            userNameController.text,
                            emailController.text,
                            passwordController.text,
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Already have an account? ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(width: 5.w),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, RouteManger.login);
                              },
                              child: CustomText(
                                text: 'Login',
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
