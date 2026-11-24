import 'dart:math';

void main() {
  const valueFrom = -4.0;
  const valueTo = 3.0;
  const step = 0.5;

  print("y = 12 * x - (x^4 + 1)\n");

  // Оскільки ліва дужка кругла (-4, 3), починаємо з першого кроку після -4.0
  var x = valueFrom + step;
  var sum = 0.0;
  var count = 0;

  // Оскільки права дужка кругла (-4, 3), умова строго менше (<)
  while (x < valueTo) {
    final y = calc(x);
    print("x = $x, 12 * $x - ($x^4 + 1) = $y");

    sum += y;
    count++;
    x += step;
  }

  if (count > 0) {
    final average = sum / count;
    print("\nСереднє арифметичне (average) = $average");
  }
}

double calc(double x) {
  return 12 * x - (pow(x, 4) + 1);
}
