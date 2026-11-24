import 'package:flutter/material.dart';
import '../main.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = TextEditingController();

  void _showDialog(String title, String message, {bool returnToHome = false}) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx); // Закриваємо діалог
                if (returnToHome) {
                  Navigator.pop(context); // Повертаємося на головну сторінку входу
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _handleReset() {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      _showDialog('Помилка', 'Введіть електронну пошту.');
      return;
    }

    if (!UserStorage.isValidEmail(email)) {
      _showDialog('Некоректна пошта', 'Введіть справжню електронну пошту (наприклад, user@gmail.com).');
      return;
    }

    _showDialog(
      'Скидання пароля',
      'Пароль для пошти $email успішно скинуто!',
      returnToHome: true,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.network(
                  'https://wikimedia.org',
                  height: 80,
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),

              const Text('Email:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _handleReset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Reset'),
              ),
              const SizedBox(height: 12),

              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
