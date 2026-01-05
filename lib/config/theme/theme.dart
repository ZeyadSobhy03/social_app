import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/resources/color_manger.dart';
import 'package:social_app/core/resources/font_size_manger.dart';
import 'package:social_app/core/resources/font_weight_manger.dart';

class ThemeManger{

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorManger.lightGrey,

    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManger.lightGrey,
      iconTheme: IconThemeData(
        color: ColorManger.grey61,
      ),
      titleTextStyle: TextStyle(
        color: ColorManger.grey61,
        fontSize: FontSizeManger.s18,
        fontWeight: FontWeightManger.bold,
      ),
      elevation: 0,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: ColorManger.grey61,
      ),
    ),
    iconTheme: IconThemeData(
      color: ColorManger.grey61,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: ColorManger.grey61,
        fontWeight: FontWeightManger.regular,
         fontSize: FontSizeManger.s16,
      ),
      titleMedium: TextStyle(
        color: ColorManger.red,
        fontWeight: FontWeightManger.bold,
          fontSize: FontSizeManger.s18,
      ),

      titleSmall: TextStyle(
        color: ColorManger.black21,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        color: ColorManger.black21,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.underline,
        decorationThickness: 2,
        decorationStyle: TextDecorationStyle.solid,

      )


    ),
    inputDecorationTheme: InputDecorationTheme(
      errorMaxLines: 2,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: ColorManger.lightGrey,
            width: 2.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: ColorManger.red,
            width: 2.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: ColorManger.red,
            width: 2.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: ColorManger.lightGrey,
            width: 2.w,
          ),

        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: ColorManger.lightGrey,
            width: 2.w,
          ),
        ),
        fillColor: ColorManger.white,
        filled: true
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorManger.black21,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManger.black12,
        foregroundColor: ColorManger.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    ),


  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorManger.black12,
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: ColorManger.grey9E,
      ),
    ),
    iconTheme: IconThemeData(
      color: ColorManger.grey9E,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor:  ColorManger.black12,
      iconTheme: IconThemeData(
        color: ColorManger.grey9E,
      ),
      titleTextStyle: TextStyle(
        color: ColorManger.grey9E,
        fontSize: FontSizeManger.s18,
        fontWeight: FontWeightManger.bold,
      ),
      elevation: 0,
    ),

    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: ColorManger.grey9E,
        fontWeight: FontWeightManger.regular,
         fontSize: FontSizeManger.s16,
      ),
      titleMedium: TextStyle(
        color: ColorManger.red,
        fontWeight: FontWeightManger.bold,
          fontSize: FontSizeManger.s18,
      ),
      titleSmall: TextStyle(
        color: ColorManger.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        color: ColorManger.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.underline,
        decorationThickness: 2,
        decorationStyle: TextDecorationStyle.solid,
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorMaxLines: 2,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: ColorManger.darkGrey,
            width: 2.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: ColorManger.red,
            width: 2.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: ColorManger.red,
            width: 2.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: ColorManger.darkGrey,
            width: 2.w,
          ),

        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: ColorManger.darkGrey,
            width: 2.w,
          ),
        ),
        fillColor: ColorManger.black21,
        filled: true
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorManger.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManger.white,
        foregroundColor: ColorManger.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    ),




  );





}