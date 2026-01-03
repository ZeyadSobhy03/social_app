import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/presentation/social_app.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp(const SocialApp());
}


