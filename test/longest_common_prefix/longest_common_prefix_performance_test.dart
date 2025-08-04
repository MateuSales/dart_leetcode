import 'package:dart_leetcode/longest_common_prefix/longest_common_prefix.dart';

void main() {
  final longestCommonPrefix = LongestCommonPrefix();

  print('=== TESTE DE PERFORMANCE - LONGEST COMMON PREFIX ===\n');

  // Teste com arrays pequenos (benchmark básico)
  print('1. Testando com arrays pequenos (10000 execuções)...\n');
  _runPerformanceTest(longestCommonPrefix, [
    ['flower', 'flow', 'flight'],
    ['abc', 'ab', 'a'],
    ['test', 'testing', 'tester'],
  ], 10000);

  // Teste com arrays médios
  print('\n2. Testando com arrays médios (1000 execuções)...\n');
  _runPerformanceTest(longestCommonPrefix, [
    ['programming', 'program', 'progress', 'project'],
    ['leetcode', 'leet', 'leetcoding', 'leetcoder'],
    ['algorithm', 'algo', 'algebraic', 'algebra'],
  ], 1000);

  // Teste com arrays grandes e strings longas
  print('\n3. Testando com arrays grandes (100 execuções)...\n');
  List<String> longStrings = List.generate(
    50,
    (i) => 'commonprefix' + 'different$i' + 'suffix',
  );
  _runPerformanceTest(longestCommonPrefix, [longStrings], 100);

  // Teste com casos extremos
  print('\n4. Testando casos extremos (5000 execuções)...\n');
  _runPerformanceTest(longestCommonPrefix, [
    ['', 'a', 'ab'],
    ['a'],
    [],
    ['same', 'same', 'same', 'same'],
    ['ab', 'abc', 'abcd', 'abcde', 'abcdef'],
  ], 5000);

  print('\n=== ANÁLISE DETALHADA ===\n');
  _detailedAnalysis(longestCommonPrefix);
}

void _runPerformanceTest(
  LongestCommonPrefix lcp,
  List<List<String>> testCases,
  int iterations,
) {
  Map<String, int> totalTimes = {
    'Original': 0,
    'Optimized': 0,
    'Classic': 0,
    'BinarySearch': 0,
  };

  for (List<String> testCase in testCases) {
    print('Testando caso: ${testCase.length} strings');
    if (testCase.isNotEmpty && testCase.first.isNotEmpty) {
      print('  Primeira string: "${testCase.first}"');
    }

    // Teste implementação original
    Stopwatch sw1 = Stopwatch()..start();
    for (int i = 0; i < iterations; i++) {
      lcp.execute(List.from(testCase)); // Cópia para evitar modificação
    }
    sw1.stop();
    totalTimes['Original'] = totalTimes['Original']! + sw1.elapsedMicroseconds;

    // Teste implementação otimizada
    Stopwatch sw2 = Stopwatch()..start();
    for (int i = 0; i < iterations; i++) {
      lcp.executeOptimized(testCase);
    }
    sw2.stop();
    totalTimes['Optimized'] =
        totalTimes['Optimized']! + sw2.elapsedMicroseconds;

    // Teste implementação clássica
    Stopwatch sw3 = Stopwatch()..start();
    for (int i = 0; i < iterations; i++) {
      lcp.executeClassic(testCase);
    }
    sw3.stop();
    totalTimes['Classic'] = totalTimes['Classic']! + sw3.elapsedMicroseconds;

    // Teste implementação binary search
    Stopwatch sw4 = Stopwatch()..start();
    for (int i = 0; i < iterations; i++) {
      lcp.executeBinarySearch(testCase);
    }
    sw4.stop();
    totalTimes['BinarySearch'] =
        totalTimes['BinarySearch']! + sw4.elapsedMicroseconds;

    print('  Original: ${sw1.elapsedMicroseconds}μs');
    print('  Optimized: ${sw2.elapsedMicroseconds}μs');
    print('  Classic: ${sw3.elapsedMicroseconds}μs');
    print('  BinarySearch: ${sw4.elapsedMicroseconds}μs');
    print('');
  }

  print('=== TOTAIS ACUMULADOS ===');
  totalTimes.forEach((method, time) {
    print('$method: ${time}μs');
  });

  // Calcula melhorias de performance
  int originalTime = totalTimes['Original']!;
  if (originalTime > 0) {
    totalTimes.forEach((method, time) {
      if (method != 'Original' && time > 0) {
        double improvement = originalTime / time;
        print(
          '$method é ${improvement.toStringAsFixed(2)}x comparado ao Original',
        );
      }
    });
  }
}

void _detailedAnalysis(LongestCommonPrefix lcp) {
  print('Análise detalhada com diferentes cenários:\n');

  // Cenário 1: Strings com prefixo comum longo
  List<String> longPrefix = [
    'commonverylongprefix123',
    'commonverylongprefix456',
    'commonverylongprefix789',
  ];

  print('1. Strings com prefixo longo:');
  _compareImplementations(lcp, longPrefix);

  // Cenário 2: Sem prefixo comum
  List<String> noPrefix = ['abc', 'def', 'ghi'];

  print('\n2. Sem prefixo comum:');
  _compareImplementations(lcp, noPrefix);

  // Cenário 3: Uma string muito curta
  List<String> shortString = ['a', 'abcdefghijklmnop', 'abcdefg'];

  print('\n3. Uma string muito curta:');
  _compareImplementations(lcp, shortString);

  // Cenário 4: Muitas strings
  List<String> manyStrings = List.generate(100, (i) => 'prefix$i');

  print('\n4. Muitas strings (100):');
  _compareImplementations(lcp, manyStrings);
}

void _compareImplementations(LongestCommonPrefix lcp, List<String> testCase) {
  const int iterations = 1000;

  print('  Caso: ${testCase.length} strings');
  if (testCase.isNotEmpty) {
    print('  Exemplo: "${testCase.first}"');
  }

  Map<String, int> times = {};

  // Original
  Stopwatch sw = Stopwatch()..start();
  for (int i = 0; i < iterations; i++) {
    lcp.execute(List.from(testCase));
  }
  sw.stop();
  times['Original'] = sw.elapsedMicroseconds;

  // Optimized
  sw = Stopwatch()..start();
  for (int i = 0; i < iterations; i++) {
    lcp.executeOptimized(testCase);
  }
  sw.stop();
  times['Optimized'] = sw.elapsedMicroseconds;

  // Classic
  sw = Stopwatch()..start();
  for (int i = 0; i < iterations; i++) {
    lcp.executeClassic(testCase);
  }
  sw.stop();
  times['Classic'] = sw.elapsedMicroseconds;

  // Binary Search
  sw = Stopwatch()..start();
  for (int i = 0; i < iterations; i++) {
    lcp.executeBinarySearch(testCase);
  }
  sw.stop();
  times['BinarySearch'] = sw.elapsedMicroseconds;

  // Mostra resultados
  times.forEach((method, time) {
    print('    $method: ${time}μs');
  });

  // Encontra o mais rápido
  String fastest = times.entries
      .reduce((a, b) => a.value < b.value ? a : b)
      .key;
  print('    🏆 Mais rápido: $fastest');
}
