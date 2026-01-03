import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/routes/routes_manger.dart';
import 'package:social_app/core/wigets/custom_elevated_button.dart';
import 'package:social_app/core/wigets/custom_text.dart';
import 'package:social_app/core/wigets/custom_text_form_field.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
                text: 'Lets create an account for you',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(hintText: 'User Name'),
            SizedBox(height: 10.h),
            CustomTextFormField(hintText: 'Email'),
            SizedBox(height: 10.h),
            CustomTextFormField(hintText: 'Password', obscureText: true),

            SizedBox(height: 10.h),

            CustomTextFormField(
              hintText: 'Confirm Password',
              obscureText: true,
            ),
            SizedBox(height: 20.h),

            CustomElevatedButton(text: 'Register', onPressed: () {}),
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
