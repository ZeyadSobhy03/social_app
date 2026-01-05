import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });

  final void Function()? onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 24.sp),
      title: CustomText(
        text: title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      onTap: onTap,
    );
  }
}
