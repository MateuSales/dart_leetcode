import 'dart:math';

class Palindrome {
  /// Implementação original - menos otimizada
  bool isPalindrome(int x) {
    int value = x;
    List<int> number = [];
    int numberReverse = 0;

    do {
      final resto = value % 10;
      value = value ~/ 10;
      number.add(resto);
    } while (value != 0);

    for (int i = 0; i < number.length; i++) {
      numberReverse += number[i] * pow(10, number.length - (i + 1)).toInt();
    }

    return numberReverse == x;
  }

  /// Implementação otimizada 1: Reverte apenas metade do número
  /// Complexidade: O(log n) tempo, O(1) espaço
  bool isPalindromeOptimized(int x) {
    // Números negativos não são palíndromos
    if (x < 0) return false;

    // Números de um dígito são palíndromos
    if (x < 10) return true;

    // Números terminados em 0 (exceto 0) não são palíndromos
    if (x % 10 == 0) return false;

    int reversedHalf = 0;

    // Reverte apenas a metade direita do número
    while (x > reversedHalf) {
      reversedHalf = reversedHalf * 10 + x % 10;
      x ~/= 10;
    }

    // Para números com quantidade par de dígitos: x == reversedHalf
    // Para números com quantidade ímpar de dígitos: x == reversedHalf ~/ 10
    return x == reversedHalf || x == reversedHalf ~/ 10;
  }

  /// Implementação otimizada 2: Usando conversão para string
  /// Complexidade: O(log n) tempo, O(log n) espaço
  bool isPalindromeString(int x) {
    // Números negativos não são palíndromos
    if (x < 0) return false;

    String str = x.toString();
    int left = 0;
    int right = str.length - 1;

    while (left < right) {
      if (str[left] != str[right]) {
        return false;
      }
      left++;
      right--;
    }

    return true;
  }

  /// Implementação otimizada 3: Matemática pura sem lista
  /// Complexidade: O(log n) tempo, O(1) espaço
  bool isPalindromeMath(int x) {
    // Números negativos não são palíndromos
    if (x < 0) return false;

    // Números de um dígito são palíndromos
    if (x < 10) return true;

    int original = x;
    int reversed = 0;

    while (x > 0) {
      reversed = reversed * 10 + x % 10;
      x ~/= 10;
    }

    return original == reversed;
  }

  /// Implementação para teste de força bruta (menos eficiente)
  /// Usado apenas para comparação de performance
  bool isPalindromeBruteForce(int x) {
    if (x < 0) return false;

    String str = x.toString();
    String reversed = str.split('').reversed.join('');

    return str == reversed;
  }
}
