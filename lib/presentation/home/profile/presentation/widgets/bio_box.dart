import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/widgets/custom_text.dart';

class BioBox extends StatelessWidget {
  const BioBox({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Padding(
          padding: REdgeInsets.all(8.0),
          child: CustomText(text: text),
        ),
      ),
    );
  }
}
