// file: main.dart
import 'calc.dart';

void main() {
  // Створюємо об'єкт класу Calc, вказуючи діапазон табулювання (крок за замовчуванням = 0.1)
  final processor = Calc(-2.0, 4.0);

  // Вмикаємо вивід кожного кроку табулювання
  processor.setVerbose(true);

  print("=== Розрахунок із кроком за замовчуванням (0.1) ===");
  processor.runCalc();
  print("\nСума значень функції (result) = ${processor.result?.toStringAsFixed(4)}\n");

  // Демонстрація роботи методу setStep (змінюємо крок на 0.5)
  print("=== Розрахунок після зміни кроку через setStep(0.5) ===");
  processor.setStep(0.5);
  processor.runCalc();
  print("\nСума значень функції (result) = ${processor.result?.toStringAsFixed(4)}");
}
