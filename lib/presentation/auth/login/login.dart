import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/routes_manger.dart';
import '../../../core/wigets/custom_elevated_button.dart';
import '../../../core/wigets/custom_text.dart';
import '../../../core/wigets/custom_text_form_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Icon(Icons.lock_open_rounded, size: 80)),
            SizedBox(height: 40.h),
            Center(
              child: CustomText(
                text: 'Welcome back! Please login to your account',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 20.h),

            CustomTextFormField(hintText: 'Email'),
            SizedBox(height: 10.h),
            CustomTextFormField(hintText: 'Password', obscureText: true),
            SizedBox(height: 20.h),
            CustomElevatedButton(text: 'Login', onPressed: () {}),
            SizedBox(height: 20.h),
            Center(
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
