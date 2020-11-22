import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static final purple = Color(0xFF5117AC);
  static final green = Color(0xFF20D0C4);
  static final dark = Color(0xFF03091E);
  static final grey = Color(0xFF212738);
  static final lightGrey = Color(0xFFBBBBBB);
  static final veryLightGrey = Color(0xFFF3F3F3);
  static final white = Color(0xFFFFFFFF);
  static final pink = Color(0xFFF5638B);
}

final gradient = [
  AppColors.green,
  AppColors.purple
];

final _borderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide(
    color: AppColors.veryLightGrey,
    width: 2,
    style: BorderStyle.solid
  )
);

final _borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide(
    color: AppColors.grey,
    width: 2,
    style: BorderStyle.solid
  )
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.white,
  backgroundColor: AppColors.white,
  canvasColor: AppColors.white,
  accentColor: AppColors.purple,
  secondaryHeaderColor: AppColors.lightGrey,
  selectedRowColor: AppColors.veryLightGrey,
  appBarTheme: AppBarTheme(
    brightness: Brightness.light,
    color: AppColors.white,
    elevation: 2,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: AppColors.purple,
        displayColor: AppColors.purple,   
      ),
  ),
    textTheme:
      GoogleFonts.poppinsTextTheme().apply(
        bodyColor: AppColors.purple,
        displayColor: AppColors.purple,   
      ),
    inputDecorationTheme: InputDecorationTheme(
      border: _borderLight,
      enabledBorder: _borderLight,
      focusedBorder: _borderLight,
      labelStyle: TextStyle(color: AppColors.purple),
      hintStyle: GoogleFonts.poppins(
        color: AppColors.lightGrey,
        fontSize: 10
      )
    ),
    iconTheme: IconThemeData(
      color: AppColors.purple
    ),
    cardColor: AppColors.white,
    
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.dark,
  secondaryHeaderColor: AppColors.white,
  backgroundColor: AppColors.grey,
  canvasColor: AppColors.grey,
  accentColor: AppColors.green,
  selectedRowColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    brightness: Brightness.dark,
    color: AppColors.purple, 
    elevation: 2
  ),
    textTheme:
      GoogleFonts.poppinsTextTheme().apply(
        bodyColor: AppColors.green,
        displayColor: AppColors.green
      ),
    inputDecorationTheme: InputDecorationTheme(
      border: _borderDark,
      enabledBorder: _borderDark,
      focusedBorder: _borderDark,
      fillColor: AppColors.grey,
      labelStyle: TextStyle(color: AppColors.white),
      filled: true,
      hintStyle: GoogleFonts.poppins(
        color: AppColors.white,
        fontSize: 10
      )
    ),
    iconTheme: IconThemeData(
      color: AppColors.white
    ),
    cardColor: AppColors.grey
    
);
