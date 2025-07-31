import 'package:dart_leetcode/two_sum/two_sum.dart';

void main() {
  final twoSum = TwoSum();

  print('=' * 50);
  print('         TESTE COM LOGS - TWO SUM');
  print('=' * 50);

  // Teste 1: Caso simples
  print('\n🧪 TESTE 1: Caso básico');
  print('-' * 30);
  var result1 = twoSum.twoSum([2, 7, 11, 15], 9);
  print('🎉 Resultado final: $result1\n');

  // Teste 2: Números iguais
  print('\n🧪 TESTE 2: Números iguais');
  print('-' * 30);
  var result2 = twoSum.twoSum([3, 3], 6);
  print('🎉 Resultado final: $result2\n');

  // Teste 3: Par no final
  print('\n🧪 TESTE 3: Par no final do array');
  print('-' * 30);
  var result3 = twoSum.twoSum([1, 2, 3, 4], 7);
  print('🎉 Resultado final: $result3\n');

  // Teste 4: Sem solução
  print('\n🧪 TESTE 4: Sem solução');
  print('-' * 30);
  var result4 = twoSum.twoSum([1, 2, 3], 10);
  print('🎉 Resultado final: $result4\n');
}
