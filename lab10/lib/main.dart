import 'package:flutter/material.dart';
import 'preview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Previewer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _textController = TextEditingController();
  double _fontSize = 16.0;

  /// Відкриває другий екран і чекає на результат повернення
  Future<void> _openPreview() async {
    final enteredText = _textController.text.trim();

    if (enteredText.isEmpty) {
      _showResultDialog('Please enter some text first!');
      return;
    }

    // Чекаємо, поки користувач закриє PreviewScreen
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewScreen(
          text: enteredText,
          fontSize: _fontSize,
        ),
      ),
    );

    if (!mounted) return;

    // Визначаємо текст діалогового вікна залежно від способу повернення
    String dialogMessage;
    if (result == 'ok') {
      dialogMessage = 'Cool!';
    } else if (result == 'cancel') {
      dialogMessage = 'Let’s try something else';
    } else {
      // Якщо повернулися системною кнопкою "Назад" (result == null)
      dialogMessage = "Don't know what to say";
    }

    _showResultDialog(dialogMessage);
  }

  void _showResultDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Text previewer'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Поле вводу тексту
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Text',
                hintText: 'Enter some text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // Вибір розміру шрифту через Slider
            Row(
              children: [
                const Text('Font size: ', style: TextStyle(fontSize: 16)),
                Text(
                  _fontSize.toInt().toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Slider(
                    value: _fontSize,
                    min: 10.0,
                    max: 60.0,
                    divisions: 50,
                    onChanged: (val) {
                      setState(() {
                        _fontSize = val;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Кнопка переходу на екран попереднього перегляду
            Center(
              child: ElevatedButton(
                onPressed: _openPreview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                ),
                child: const Text('Preview'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
