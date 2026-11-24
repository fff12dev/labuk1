import 'package:flutter/material.dart';
import 'widgets/sign_in_screen.dart';

/// Просте сховище зареєстрованого користувача в межах сесії додатка
class UserStorage {
  static String? name;
  static String? email;
  static String? password;

  /// Перевірка, чи відповідає рядок формату електронної пошти
  static bool isValidEmail(String value) {
    final emailRegex = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value.trim());
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
      ),
      home: const SignInScreen(),
    );
  }
}
