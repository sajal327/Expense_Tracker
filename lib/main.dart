import 'package:expense_tracker/widgets/Expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 183, 228, 238),
);
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 21, 99, 138),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
          cardTheme: const CardTheme()
              .copyWith(color: kDarkColorScheme.onPrimaryFixed)),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          centerTitle: false,
        ),
        cardTheme: const CardTheme().copyWith(
          color: const Color.fromARGB(255, 202, 241, 250),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 223, 239, 249),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
      themeMode: ThemeMode.light,
    );
  }
}
