import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/resources/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.pompiere().fontFamily,
      primaryColor: ColorBlock.primary,
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: ColorBlock.primary,
            surface: ColorBlock.primary,
          ),
      scaffoldBackgroundColor: ColorBlock.lightPurple,
      drawerTheme:
          const DrawerThemeData(backgroundColor: ColorBlock.lightPurple),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorBlock.lightPurple,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorBlock.black),
      ),
      tabBarTheme: const TabBarTheme(
          labelColor: ColorBlock.primary,
          unselectedLabelColor: ColorBlock.darkGrey),
      inputDecorationTheme: const InputDecorationTheme(
          iconColor: ColorBlock.primary,
          fillColor: ColorBlock.primary,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorBlock.white),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorBlock.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorBlock.primary),
          )),
      textTheme: const TextTheme(
        labelMedium: TextStyle(
          color: ColorBlock.white,
          fontSize: FontSizing.xLarge,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.3,
        ),
        caption: TextStyle(
          color: ColorBlock.white,
          fontSize: FontSizing.xLarge,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.3,
        ),
        headline6: TextStyle(
          color: ColorBlock.black,
          fontSize: FontSizing.xSmall,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.3,
        ),
        headline5: TextStyle(
          color: ColorBlock.black,
          fontSize: FontSizing.small,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.3,
        ),
        headline4: TextStyle(
            color: ColorBlock.black,
            fontSize: FontSizing.small,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.3),
        headline3: TextStyle(
            color: ColorBlock.black,
            fontSize: FontSizing.xxLarge,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2),
        headline2: TextStyle(
            color: ColorBlock.black,
            fontSize: FontSizing.xxLarge,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.2),
        headline1: TextStyle(
            color: ColorBlock.black,
            fontSize: FontSizing.huge,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.2),
        bodyText1: TextStyle(
          color: ColorBlock.black,
          fontSize: FontSizing.small,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.3,
        ),
        bodyText2: TextStyle(
          color: ColorBlock.black,
          fontSize: FontSizing.xSmall,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.3,
        ),
        subtitle1: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        button: TextStyle(
          color: Colors.white,
          fontSize: FontSizing.large,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
      ).apply(displayColor: ColorBlock.black, bodyColor: ColorBlock.black),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorBlock.primary,
        unselectedItemColor: ColorBlock.white.withOpacity(0.6),
        selectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: FontSizing.small,
          letterSpacing: 0.4,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: FontSizing.small,
          letterSpacing: 0.4,
        ),
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: ColorBlock.primary)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorBlock.primary,
              elevation: 0,
              shadowColor: ColorBlock.white,
              shape: const RoundedRectangleBorder(borderRadius: borderRadius))),
    );
