import 'package:flutter/material.dart';
import 'package:social_app/core/routes/routes_manger.dart';

class SocialApp extends StatelessWidget {
  const SocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: RouteManger.register,

      onGenerateRoute: RouteManger.router,
    );
  }
}
