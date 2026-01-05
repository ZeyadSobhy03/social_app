import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/core/extension/text_ex.dart';
import 'package:social_app/presentation/auth/presentation/view_model/auth_view_model.dart';

import '../../../../core/routes/routes_manger.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit,AuthState>(
        listener: (context, state) {
          if(state is AuthLoading){
            Fluttertoast.showToast(
              msg: "Logging in...",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
            );
          }

          if(state is AuthSuccess){
            Fluttertoast.showToast(
              msg: "Login Successful",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );
            Navigator.pushReplacementNamed(context, RouteManger.home);
          }
          if (state is AuthFailure) {
            Fluttertoast.showToast(
              msg: "Login Failed: ${state.error}",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: REdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Icon(Icons.lock_open_rounded, size: 80)),

                      SizedBox(height: 40.h),

                      Center(
                        child: CustomText(
                          text: 'Welcome back! Please login to your account',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),

                      SizedBox(height: 20.h),

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
                          } else if (text.length < 6) {
                            return 'Password must be at least 6 characters';
                          } else if (!text.isValidPassword) {
                            return 'Password must be at least 8 characters long and contain at least one letter and one number';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 20.h),

                      CustomElevatedButton(
                        text: 'Login',
                        onPressed: ()   async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          // Perform login action

                           await  BlocProvider.of<AuthCubit>(
                            context,
                          ).login(emailController.text, passwordController.text);





                        },
                      ),

                      SizedBox(height: 20.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Don\'t have an account? ',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(width: 5.w),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RouteManger.register);
                            },
                            child: CustomText(
                              text: 'Register',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ],
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
