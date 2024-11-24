import 'dart:io';
import 'dart:math';

void main() {
  double a, b, c;
  String? input;
  
  print('CHƯƠNG TRÌNH GIẢI PHƯƠNG TRÌNH BẬC 2');
  print('Dạng: ax² + bx + c = 0 (với a ≠ 0)');
  print('-----------------------------------');

  // Nhập hệ số a (khác 0)
  do {
    stdout.write('Nhập hệ số a (a ≠ 0): ');
    input = stdin.readLineSync();
    a = double.tryParse(input ?? '') ?? 0;
    
    if (a == 0 || a is String) {
      print('Nhập sai, Vui lòng nhập lại.');
    }
  } while (a == 0);

  // Nhập hệ số b
  do {
    stdout.write('Nhập hệ số b: ');
    input = stdin.readLineSync();
    b = double.tryParse(input ?? '') ?? 0;
    
    if (input == null || double.tryParse(input) == null) {
      print('Nhập sai, nhập lại!');
    }
  } while (input == null || double.tryParse(input) == null);

  // Nhập hệ số c
  do {
    stdout.write('Nhập hệ số c: ');
    input = stdin.readLineSync();
    c = double.tryParse(input ?? '') ?? 0;
    
    if (input == null || double.tryParse(input) == null) {
      print('Nhập sai, nhập lại!');
    }
  } while (input == null || double.tryParse(input) == null);

  // Hiển thị phương trình
  print('\nPhương trình: ${a}x² + ${b}x + $c = 0');

  // Tính delta
  double delta = b * b - 4 * a * c;
  print('Delta = ${delta.toStringAsFixed(2)}');

  // Giải phương trình
  if (delta < 0) {
    print('Phương trình vô nghiệm');
  }
}