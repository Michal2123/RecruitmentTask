import 'package:flutter/material.dart';

class CustomThemeData {
  final ThemeData theme;
  const CustomThemeData({required this.theme}) : super();
  factory CustomThemeData.createTheme() {
    return CustomThemeData(
        theme: ThemeData(
      tabBarTheme: TabBarTheme(
          labelColor: Colors.blue,
          overlayColor: MaterialStatePropertyAll(Colors.blue.shade100),
          indicatorColor: Colors.blue),
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: Colors.blue)),
      iconTheme: const IconThemeData(color: Colors.blue),
      primarySwatch: Colors.blue,
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.blue,
          selectionHandleColor: Colors.blue,
          selectionColor: Colors.blue),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            elevation: MaterialStatePropertyAll(3),
            alignment: Alignment.center,
            overlayColor:
                MaterialStatePropertyAll(Color.fromRGBO(237, 248, 255, 1)),
            surfaceTintColor:
                MaterialStatePropertyAll(Color.fromRGBO(251, 253, 255, 1)),
            backgroundColor:
                MaterialStatePropertyAll(Color.fromRGBO(251, 253, 255, 1)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))))),
      ),
      cardTheme: const CardTheme(
        elevation: 8,
        color: Color.fromRGBO(251, 253, 255, 1),
        surfaceTintColor: Color.fromRGBO(251, 253, 255, 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent)),
          fillColor: const Color.fromRGBO(255, 255, 255, 1),
          filled: true),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 3,
          shape: CircleBorder(eccentricity: 1),
          foregroundColor: Colors.blue,
          backgroundColor: Color.fromRGBO(251, 253, 255, 1),
          splashColor: Color.fromRGBO(237, 248, 255, 1)),
    ));
  }
}
