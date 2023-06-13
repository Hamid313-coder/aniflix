import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/resources/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getTheme(BuildContext context) => ThemeData(
      primarySwatch: ColorBlock.grey,
      appBarTheme: const AppBarTheme(
        color: ColorBlock.black,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: ColorBlock.white),
        labelStyle: TextStyle(color: ColorBlock.white),
      ),
      fontFamily: GoogleFonts.ubuntu().fontFamily,
      brightness: Brightness.dark,
      canvasColor: Colors.black.withOpacity(0.4),
      colorScheme: const ColorScheme.dark(secondary: ColorBlock.red),
      iconTheme: const IconThemeData(color: ColorBlock.white),
    );
