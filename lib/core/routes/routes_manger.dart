import 'package:flutter/material.dart';
import 'package:social_app/core/resources/color_manger.dart';
import 'package:social_app/core/resources/font_size_manger.dart';
import 'package:social_app/core/resources/font_weight_manger.dart';
import 'package:social_app/core/wigets/custom_text.dart';
import 'package:social_app/presentation/auth/forget_password/forget_password.dart';
import 'package:social_app/presentation/auth/login/login.dart';
import 'package:social_app/presentation/auth/register/register.dart';

class RouteManger {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forgetPassword';

  static Route<dynamic> router(RouteSettings setting) {
    switch (setting.name) {
      case register:
        return MaterialPageRoute(builder: (context) => Register());

      case login:
        return MaterialPageRoute(builder: (context) => Login());
      case forgetPassword:
        return MaterialPageRoute(builder: (context) => ForgetPassword());
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Center(
              child: CustomText(
                text: 'No Route Found',
                color: ColorManger.red,
                fontWeight: FontWeightManger.bold,
                fontSize: FontSizeManger.s20,
              ),
            );
          },
        );
    }
  }
}
