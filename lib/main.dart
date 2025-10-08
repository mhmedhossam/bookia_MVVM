import 'package:bookia/core/constants/app_fonts.dart';
import 'package:bookia/core/constants/routes.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  DioProvider.init();
  runApp(Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: AppColors.darkGreyColor),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1, color: AppColors.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1, color: AppColors.borderColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1, color: AppColors.error),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1, color: AppColors.error),
          ),
          filled: true,
          fillColor: AppColors.accentfColor,
        ),

        fontFamily: AppFonts.dmSerifDisplay,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          surfaceTintColor: Colors.transparent,
        ),
      ),

      // initialRoute: Routes.splashScreen,
      // routes: Routes.routes,
      routerConfig: Routes.routes,
    );
  }
}
