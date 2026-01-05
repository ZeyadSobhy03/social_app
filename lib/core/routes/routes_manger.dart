import 'package:flutter/material.dart';
import 'package:social_app/presentation/home/home.dart';

import '../../presentation/auth/presentation/forget_password/forget_password.dart';
import '../../presentation/auth/presentation/login/login.dart';
import '../../presentation/auth/presentation/register/register.dart';
import '../widgets/custom_text.dart';


class RouteManger {
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forgetPassword';


  static Route<dynamic> router(RouteSettings setting) {
    switch (setting.name) {

      case home:
        return MaterialPageRoute(builder: (context) => Home());
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

                style: Theme.of(context).textTheme.titleMedium,


              ),
            );
          },
        );
    }
  }
}
