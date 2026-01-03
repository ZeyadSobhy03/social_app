import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/config/theme/theme.dart';
import 'package:social_app/core/routes/routes_manger.dart';

class SocialApp extends StatelessWidget {
  const SocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManger.lightTheme,
        darkTheme: ThemeManger.darkTheme,
        themeMode: ThemeMode.dark,
        initialRoute: RouteManger.register,

        onGenerateRoute: RouteManger.router,
      ),
    );
  }
}
