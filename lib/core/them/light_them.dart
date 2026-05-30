import 'package:flutter/material.dart';
import 'package:news_app/core/them/light_color.dart';

ThemeData lightThem = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(),
  scaffoldBackgroundColor: LightColor.background,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xffFFFFFF),
    titleTextStyle: TextStyle(color:LightColor.text, fontSize: 16, fontWeight: FontWeight.w700),
    iconTheme: IconThemeData(color: Color(0xff161F1B)),
    centerTitle: true,
  ),

  // switchTheme: SwitchThemeData(
  //   trackColor: WidgetStateProperty.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return Color(0xff15B86C);
  //     }
  //     return Color(0xff181818);
  //   }),
  //   thumbColor: WidgetStateProperty.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return Color(0xffFFFCFC);
  //     }
  //     return Color(0xffFFFCFC);
  //   }),
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: LightColor.primary,
      foregroundColor: Color(0xffFFFCFC),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Color(0xffC53030)),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: Color(0xff161F1B),
      fontSize: 32,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      color: Color(0xff161F1B),
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      color: Color(0xff161F1B),
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: Color(0xff3A4640),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      color: Color(0xff161F1B),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      color: Color(0xff6A6A6A),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.lineThrough,
      overflow: TextOverflow.ellipsis,
    ),
    labelMedium: TextStyle(color: Color(0xff161F1B)),
  ),


  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,

    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),

    hintStyle: const TextStyle(
      color: Colors.grey,
      fontSize: 14,
    ),

    labelStyle: const TextStyle(
      fontSize: 14,
    ),

    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.grey.shade300,
      ),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 2,
      ),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
    ),

    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.grey.shade200,
      ),
    ),

    errorStyle: const TextStyle(
      color: Colors.red,
      fontSize: 12,
    ),
  ),


  // inputDecorationTheme: InputDecorationTheme(
  //   errorStyle: TextStyle(color: Colors.red),
  //   hintStyle: TextStyle(color: Color(0xff6D6D6D)),
  //   filled: true,
  //   fillColor: Color(0xffFFFFFF),
  //   border: OutlineInputBorder(
  //     borderRadius: BorderRadius.zero,
  //     borderSide: BorderSide(color: Color(0xff9E9E9E), width: 0),
  //   ),
  // ),

  // checkboxTheme: CheckboxThemeData(
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  //   side: BorderSide(color: Color(0xffD1DAD6), width: 2),
  // ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: LightColor.background,
    selectedItemColor: Color(0xffC53030),
    unselectedItemColor: Color(0xff363636),
    selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontSize: 11),
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true
  ),
  // iconTheme: IconThemeData(color: Color(0xff3A4640)),
  // listTileTheme: ListTileThemeData(
  //   titleTextStyle: TextStyle(
  //     color: Color(0xff161F1B),
  //     fontSize: 16,
  //     fontWeight: FontWeight.w400,
  //   ),
  // ),
  // dividerTheme: DividerThemeData(color: Color(0xffCAC4D0), thickness: 1),
  // textSelectionTheme: TextSelectionThemeData(
  //   cursorColor: Colors.black,
  //   selectionColor: Colors.grey.withValues(alpha: 0.5),
  // ),
  splashFactory: NoSplash.splashFactory,

  //   popupMenuTheme: PopupMenuThemeData(
  //   color: Color(0xffF6F7F9),
  //   shape: RoundedRectangleBorder(
  //     side: BorderSide(color: Color(0xff14A662), width: 1),
  //     borderRadius: BorderRadius.circular(15),
  //   ),
  //   labelTextStyle: WidgetStateProperty.all(TextStyle(fontSize: 16, color: Color(0xff161F1B))),
  //   elevation: 5,
  //   shadowColor: Color(0xff3A4640)
  // ),
);
