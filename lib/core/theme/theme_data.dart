import 'package:flutter/material.dart';

class RickAndMortyTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color.fromARGB(255, 0, 207, 86), // Color principal
      scaffoldBackgroundColor: Colors.black87, // Fondo oscuro
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 78, 219, 137),
          fill: 1,
          ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 17),
        bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
        bodySmall: TextStyle(color: Colors.white54, fontSize: 14),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.greenAccent, // Botones verdes
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent, // Fondo verde
          foregroundColor: Colors.black, // Texto negro
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: Colors.greenAccent
      )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.greenAccent,
      ),
      cardTheme: CardTheme(
        color: Colors.black.withOpacity(0.8), // Fondo oscuro con transparencia
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
      ),
    );
  }
}
