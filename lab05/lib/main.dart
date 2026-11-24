import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const _size = 50.0;
const _bgColor = Colors.green;
const _borderColor = Colors.grey;
const _borderWidth = 3.0;
const _borderRadius = 8.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pixel Digit 7',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Практична робота №5 (Варіант 14)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildSeven(),
        ),
      ),
    );
  }

  /// Формуємо 6 рядків для відображення цифри 7
  List<Widget> _buildSeven() {
    return [
      _buildTopLine(),      // [■][■][■][■]
      _buildRow(3),         // [ ][ ][ ][■]
      _buildRow(2),         // [ ][ ][■][ ]
      _buildRow(1),         // [ ][■][ ][ ]
      _buildRow(1),         // [ ][■][ ][ ]
      _buildRow(1),         // [ ][■][ ][ ]
    ];
  }

  /// Верхня горизонтальна лінія цифри 7
  Widget _buildTopLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(),
        _buildDot(),
        _buildDot(),
        _buildDot(),
      ],
    );
  }

  /// Рядок із 4 комірок, де зелений піксель стоїть на позиції [dotIndex] (від 0 до 3)
  Widget _buildRow(int dotIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return index == dotIndex ? _buildDot() : _buildEmpty();
      }),
    );
  }

  /// Один зафарбований піксель (Container)
  Widget _buildDot() {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(_borderRadius),
        ),
        border: Border.all(
          color: _borderColor,
          width: _borderWidth,
        ),
      ),
    );
  }

  /// Порожня комірка-заповнювач (SizedBox)
  Widget _buildEmpty() {
    return const SizedBox(
      width: _size,
      height: _size,
    );
  }
}
