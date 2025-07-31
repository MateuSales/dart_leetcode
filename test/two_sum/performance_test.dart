import 'package:dart_leetcode/two_sum/two_sum.dart';

void main() {
  final twoSum = TwoSum();

  // Teste com array grande para demonstrar diferença de performance
  List<int> largeArray = List.generate(1000, (index) => index);
  int target = 1997; // soma dos últimos dois elementos (998 + 999)

  print(
    'Testando performance com array de ${largeArray.length} elementos...\n',
  );

  // Teste da solução O(n²)
  Stopwatch stopwatch1 = Stopwatch()..start();
  List<int> result1 = twoSum.twoSumBruteForce(largeArray, target);
  stopwatch1.stop();

  print('Solução O(n²) - Força Bruta:');
  print('Resultado: $result1');
  print('Tempo: ${stopwatch1.elapsedMicroseconds} microsegundos\n');

  // Teste da solução O(n)
  Stopwatch stopwatch2 = Stopwatch()..start();
  List<int> result2 = twoSum.twoSum(largeArray, target);
  stopwatch2.stop();

  print('Solução O(n) - HashMap:');
  print('Resultado: $result2');
  print('Tempo: ${stopwatch2.elapsedMicroseconds} microsegundos\n');

  double improvement =
      stopwatch1.elapsedMicroseconds / stopwatch2.elapsedMicroseconds;
  print(
    'Melhoria de performance: ${improvement.toStringAsFixed(1)}x mais rápido',
  );
}
