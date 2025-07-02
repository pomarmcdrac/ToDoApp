//Packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.grey,
          primaryContainer: Colors.white,
          secondary: Colors.grey[300]!,
          onPrimary: Colors.black,
          brightness: Brightness.light,
        ),
        primaryColor: Colors.grey,
      );

  static ThemeData get darkTheme => ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: Colors.grey[800]!,
          primaryContainer: Colors.black,
          secondary: Colors.grey[700]!,
          onPrimary: Colors.white,
          brightness: Brightness.dark,
        ),
        primaryColor: Colors.grey,
      );
}
