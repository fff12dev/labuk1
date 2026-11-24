// file: calc.dart

class Calc {
  bool verbose = false;
  double? _result;

  late double rangeFrom;
  late double rangeTo;
  late double step;

  /// Конструктор: приймає межі діапазону, крок за замовчуванням 0.1
  Calc(this.rangeFrom, this.rangeTo, {this.step = 0.1});

  /// Геттер для отримання результату (суми значень функції)
  double? get result => _result;

  /// Метод для зміни кроку табулювання (ДЗ02.02)
  void setStep(double value) {
    if (value > 0) {
      step = value;
    }
  }

  /// Перемикач виводу проміжних розрахунків
  void setVerbose(bool value) {
    verbose = value;
  }

  /// Основний метод табулювання з використанням циклу for
  void runCalc() {
    var sum = 0.0;

    // Використовуємо + 1e-9 для уникнення похибки чисел з плаваючою точкою (double)
    for (var x = rangeFrom; x <= rangeTo + 1e-9; x += step) {
      final y = _calc(x);

      if (verbose) {
        print(
          "x = ${x.toStringAsFixed(2)}, "
              "19 * ${x.toStringAsFixed(2)} - 0.5 * ${x.toStringAsFixed(2)}^2 = ${y.toStringAsFixed(4)}",
        );
      }

      sum += y;
    }

    _result = sum;
  }

  /// Приватний метод обчислення значення функції y = 19x - 0.5x^2
  double _calc(double x) {
    return 19 * x - 0.5 * x * x;
  }
}
