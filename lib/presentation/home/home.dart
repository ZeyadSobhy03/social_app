
import 'package:flutter/material.dart';

import 'package:social_app/core/widgets/custom_text.dart';
import 'package:social_app/presentation/home/widgets/drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: 'Home')),
      drawer: MyDrawer(),
    );
  }
}
