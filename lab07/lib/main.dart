import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// StatelessWidget — кореневий віджет додатку, який не має власного змінюваного стану
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corner Configurator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CornerConfiguratorScreen(),
    );
  }
}

/// StatefulWidget — екран із внутрішнім станом для динамічної зміни радіусів
class CornerConfiguratorScreen extends StatefulWidget {
  const CornerConfiguratorScreen({super.key});

  @override
  State<CornerConfiguratorScreen> createState() =>
      _CornerConfiguratorScreenState();
}

class _CornerConfiguratorScreenState extends State<CornerConfiguratorScreen> {
  // Змінні стану для кожного з чотирьох кутків контейнера
  double _topLeft = 0.0;
  double _topRight = 0.0;
  double _bottomLeft = 0.0;
  double _bottomRight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 24),

            // Синій контейнер 150x150 із динамічним заокругленням кожного кутка
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_topLeft),
                    topRight: Radius.circular(_topRight),
                    bottomLeft: Radius.circular(_bottomLeft),
                    bottomRight: Radius.circular(_bottomRight),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 36),

            // Слайдери для налаштування кутків (максимум 75 = половина від 150)
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildSliderSection(
                      label: 'Top Left',
                      value: _topLeft,
                      onChanged: (val) => setState(() => _topLeft = val),
                    ),
                    _buildSliderSection(
                      label: 'Top Right',
                      value: _topRight,
                      onChanged: (val) => setState(() => _topRight = val),
                    ),
                    _buildSliderSection(
                      label: 'Bottom Left',
                      value: _bottomLeft,
                      onChanged: (val) => setState(() => _bottomLeft = val),
                    ),
                    _buildSliderSection(
                      label: 'Bottom Right',
                      value: _bottomRight,
                      onChanged: (val) => setState(() => _bottomRight = val),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Допоміжний метод для рендерингу підпису, поточного значення та слайдера
  Widget _buildSliderSection({
    required String label,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('$label: ', style: const TextStyle(fontSize: 15)),
            Text(
              value.toStringAsFixed(2),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Slider(
          value: value,
          min: 0.0,
          max: 75.0,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
