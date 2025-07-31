import 'package:dart_leetcode/roman_to_integer/roman_to_integer.dart';
import 'package:test/test.dart';

void main() {
  test('conversion from Roman to Integer', () {
    final sut = RomanToInteger();
    expect(sut.romanToInt('III'), 3);
    expect(sut.romanToInt('LVIII'), 58);
    expect(sut.romanToInt('MCMXCIV'), 1994);
  });
}
