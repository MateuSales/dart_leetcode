import 'package:dart_leetcode/is_palindrome/palindrome.dart';

void main() {
  final palindrome = Palindrome();

  print('=== TESTE DE PERFORMANCE - PALINDROME ===\n');

  // Teste com números pequenos (benchmark básico)
  print('1. Testando com números pequenos (1000 execuções)...\n');
  _runPerformanceTest(palindrome, [121, 1221, 12321, 123321], 1000);

  // Teste com números médios
  print('\n2. Testando com números médios (1000 execuções)...\n');
  _runPerformanceTest(palindrome, [1234321, 12344321, 123454321], 1000);

  // Teste com números grandes
  print('\n3. Testando com números grandes (100 execuções)...\n');
  _runPerformanceTest(palindrome, [1234567890987654321], 100);

  // Teste com casos extremos
  print('\n4. Testando casos extremos (10000 execuções)...\n');
  _runPerformanceTest(palindrome, [0, 1, 9, 10, 11, -121], 10000);

  print('\n=== ANÁLISE DETALHADA ===\n');
  _detailedAnalysis(palindrome);
}

void _runPerformanceTest(
  Palindrome palindrome,
  List<int> testNumbers,
  int iterations,
) {
  Map<String, int> totalTimes = {
    'Original': 0,
    'Optimized': 0,
    'String': 0,
    'Math': 0,
    'BruteForce': 0,
  };

  for (int number in testNumbers) {
    print('Testando número: $number');

    // Teste implementação original
    Stopwatch sw1 = Stopwatch()..start();
    for (int i = 0; i < iterations; i++) {
      palindrome.isPalindrome(number);
    }
    sw1.stop();
    totalTimes['Original'] = totalTimes['Original']! + sw1.elapsedMicroseconds;

    // Teste implementação otimizada
    Stopwatch sw2 = Stopwatch()..start();
    for (int i = 0; i < iterations; i++) {
      palindrome.isPalindromeOptimized(number);
    }
    sw2.stop();
    totalTimes['Optimized'] =
        totalTimes['Optimized']! + sw2.elapsedMicroseconds;

    // Teste implementação com string
    Stopwatch sw3 = Stopwatch()..start();
    for (int i = 0; i < iterations; i++) {
      palindrome.isPalindromeString(number);
    }
    sw3.stop();
    totalTimes['String'] = totalTimes['String']! + sw3.elapsedMicroseconds;

    // Teste implementação matemática
    Stopwatch sw4 = Stopwatch()..start();
    for (int i = 0; i < iterations; i++) {
      palindrome.isPalindromeMath(number);
    }
    sw4.stop();
    totalTimes['Math'] = totalTimes['Math']! + sw4.elapsedMicroseconds;

    // Teste força bruta
    Stopwatch sw5 = Stopwatch()..start();
    for (int i = 0; i < iterations; i++) {
      palindrome.isPalindromeBruteForce(number);
    }
    sw5.stop();
    totalTimes['BruteForce'] =
        totalTimes['BruteForce']! + sw5.elapsedMicroseconds;

    print('  Original:    ${sw1.elapsedMicroseconds} μs');
    print('  Optimized:   ${sw2.elapsedMicroseconds} μs');
    print('  String:      ${sw3.elapsedMicroseconds} μs');
    print('  Math:        ${sw4.elapsedMicroseconds} μs');
    print('  BruteForce:  ${sw5.elapsedMicroseconds} μs');
    print('');
  }

  print('TOTAIS ($iterations iterações por número):');
  totalTimes.forEach((method, time) {
    print('  $method: $time μs');
  });

  // Encontrar o método mais rápido
  String fastest = totalTimes.entries
      .reduce((a, b) => a.value < b.value ? a : b)
      .key;
  print('\nMétodo mais rápido: $fastest');

  // Calcular melhorias de performance
  int originalTime = totalTimes['Original']!;
  print('\nMelhorias em relação ao método original:');
  totalTimes.forEach((method, time) {
    if (method != 'Original' && time > 0) {
      double improvement = originalTime / time;
      print(
        '  $method: ${improvement.toStringAsFixed(2)}x ${improvement > 1 ? 'mais rápido' : 'mais lento'}',
      );
    }
  });
}

void _detailedAnalysis(Palindrome palindrome) {
  print('Complexidade de tempo e espaço por algoritmo:\n');

  print('1. isPalindrome (Original):');
  print('   - Tempo: O(log n) - precisa processar todos os dígitos');
  print('   - Espaço: O(log n) - armazena dígitos em lista');
  print('   - Uso: Lista + operações matemáticas\n');

  print('2. isPalindromeOptimized (Otimizado):');
  print('   - Tempo: O(log n) - processa apenas metade dos dígitos');
  print('   - Espaço: O(1) - usa apenas variáveis');
  print('   - Uso: Matemática pura, mais eficiente\n');

  print('3. isPalindromeString (String):');
  print('   - Tempo: O(log n) - conversão + comparação');
  print('   - Espaço: O(log n) - string temporária');
  print('   - Uso: Conversão para string + ponteiros\n');

  print('4. isPalindromeMath (Matemático):');
  print('   - Tempo: O(log n) - reverte número completo');
  print('   - Espaço: O(1) - usa apenas variáveis');
  print('   - Uso: Matemática pura, simples\n');

  print('5. isPalindromeBruteForce (Força Bruta):');
  print('   - Tempo: O(log n) - conversão + reversão + comparação');
  print('   - Espaço: O(log n) - múltiplas strings temporárias');
  print('   - Uso: Múltiplas operações de string\n');

  print('RECOMENDAÇÕES:');
  print('- Para performance máxima: isPalindromeOptimized');
  print('- Para simplicidade: isPalindromeMath');
  print('- Para legibilidade: isPalindromeString');
  print('- Evitar: isPalindromeBruteForce (menos eficiente)');

  // Teste específico de casos extremos
  print('\n=== TESTE DE CASOS EXTREMOS ===');

  List<int> extremeCases = [
    0, // menor caso
    9, // maior dígito único
    99, // menor palíndromo de 2 dígitos
    101, // palíndromo simples
    1001, // palíndromo com zeros
    9999, // maior palíndromo de 4 dígitos
    12321, // palíndromo ímpar
    123321, // palíndromo par
    1234321, // palíndromo maior ímpar
    12344321, // palíndromo maior par
    -121, // número negativo
  ];

  for (int testCase in extremeCases) {
    bool result1 = palindrome.isPalindromeOptimized(testCase);
    bool result2 = palindrome.isPalindromeString(testCase);
    bool result3 = palindrome.isPalindromeMath(testCase);

    String status = (result1 == result2 && result2 == result3) ? '✓' : '✗ ERRO';
    print('$testCase: $result1 $status');
  }
}
