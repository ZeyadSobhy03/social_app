import 'package:flutter/material.dart';
import 'package:social_app/presentation/home/home.dart';
import 'package:social_app/presentation/home/profile/domain/entities/profile_user.dart';
import 'package:social_app/presentation/home/profile/profile.dart';

import '../../presentation/auth/presentation/forget_password/forget_password.dart';
import '../../presentation/auth/presentation/login/login.dart';
import '../../presentation/auth/presentation/register/register.dart';
import '../../presentation/home/edit_profile/edit_profile.dart';
import '../widgets/custom_text.dart';

class RouteManger {
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forgetPassword';
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';

  static Route<dynamic> router(RouteSettings setting) {
    switch (setting.name) {
      case home:
        return MaterialPageRoute(builder: (context) => Home());

      case profile:
        return MaterialPageRoute(builder: (context) => Profile());

      case editProfile:
        final profileUser = setting.arguments as ProfileUser;
        return MaterialPageRoute(
          builder: (context) => EditProfile(profileUser: profileUser),
          settings: setting,
        );
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
