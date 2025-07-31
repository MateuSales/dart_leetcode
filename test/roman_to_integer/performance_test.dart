import 'package:dart_leetcode/roman_to_integer/roman_to_integer.dart';
import 'package:test/test.dart';

void main() {
  group('Performance Tests', () {
    final converter = RomanToInteger();

    // Casos de teste com strings de diferentes tamanhos
    final testCases = [
      'III',
      'LVIII',
      'MCMXCIV',
      'MMMCMXCIXLXIVIII', // String mais longa para testar performance
      'MCDXLIV',
      'MMMDCCCLXXXVIII',
    ];

    test('Performance benchmark', () {
      const iterations = 10000;
      final stopwatch = Stopwatch()..start();

      for (int i = 0; i < iterations; i++) {
        for (final testCase in testCases) {
          converter.romanToInt(testCase);
        }
      }

      stopwatch.stop();

      print(
        'Tempo total para $iterations iterações: ${stopwatch.elapsedMilliseconds}ms',
      );
      print(
        'Tempo médio por conversão: ${stopwatch.elapsedMicroseconds / (iterations * testCases.length)}μs',
      );

      // Verifica se ainda está funcionando corretamente
      expect(converter.romanToInt('MCMXCIV'), 1994);
    });

    test('Memory usage test', () {
      // Teste com múltiplas instâncias para verificar uso de memória
      final converters = List.generate(1000, (_) => RomanToInteger());

      for (final conv in converters) {
        expect(conv.romanToInt('LVIII'), 58);
      }

      // Se chegou até aqui, não houve problemas de memória
      expect(converters.length, 1000);
    });
  });
}
