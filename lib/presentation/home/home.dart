import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/routes/routes_manger.dart';
import 'package:social_app/core/widgets/custom_text.dart';

import '../auth/presentation/view_model/auth_view_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Home'),
        actions: [IconButton(onPressed: ()async {
           await BlocProvider.of<AuthCubit>(context).logout();
           log('Logged out');
           Navigator.pushReplacementNamed(context, RouteManger.login);



        }, icon: const Icon(Icons.logout))],
      ),
    );
  }
}
