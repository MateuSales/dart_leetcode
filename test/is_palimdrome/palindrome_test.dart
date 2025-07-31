import 'package:dart_leetcode/is_palindrome/palindrome.dart';
import 'package:test/test.dart';

void main() {
  group('Palindrome Tests', () {
    late Palindrome palindrome;

    setUp(() {
      palindrome = Palindrome();
    });

    group('Casos básicos', () {
      test('números positivos palíndromos', () {
        expect(palindrome.isPalindrome(121), isTrue);
        expect(palindrome.isPalindromeOptimized(121), isTrue);
        expect(palindrome.isPalindromeString(121), isTrue);
        expect(palindrome.isPalindromeMath(121), isTrue);

        expect(palindrome.isPalindrome(1221), isTrue);
        expect(palindrome.isPalindromeOptimized(1221), isTrue);
        expect(palindrome.isPalindromeString(1221), isTrue);
        expect(palindrome.isPalindromeMath(1221), isTrue);
      });

      test('números não palíndromos', () {
        expect(palindrome.isPalindrome(123), isFalse);
        expect(palindrome.isPalindromeOptimized(123), isFalse);
        expect(palindrome.isPalindromeString(123), isFalse);
        expect(palindrome.isPalindromeMath(123), isFalse);

        expect(palindrome.isPalindrome(1234), isFalse);
        expect(palindrome.isPalindromeOptimized(1234), isFalse);
        expect(palindrome.isPalindromeString(1234), isFalse);
        expect(palindrome.isPalindromeMath(1234), isFalse);
      });

      test('números negativos', () {
        expect(palindrome.isPalindromeOptimized(-121), isFalse);
        expect(palindrome.isPalindromeString(-121), isFalse);
        expect(palindrome.isPalindromeMath(-121), isFalse);
        expect(palindrome.isPalindromeBruteForce(-121), isFalse);
      });

      test('números de um dígito', () {
        for (int i = 0; i <= 9; i++) {
          expect(palindrome.isPalindrome(i), isTrue);
          expect(palindrome.isPalindromeOptimized(i), isTrue);
          expect(palindrome.isPalindromeString(i), isTrue);
          expect(palindrome.isPalindromeMath(i), isTrue);
        }
      });

      test('números terminados em zero', () {
        expect(palindrome.isPalindromeOptimized(10), isFalse);
        expect(palindrome.isPalindromeString(10), isFalse);
        expect(palindrome.isPalindromeMath(10), isFalse);

        expect(palindrome.isPalindromeOptimized(100), isFalse);
        expect(palindrome.isPalindromeString(100), isFalse);
        expect(palindrome.isPalindromeMath(100), isFalse);
      });
    });

    group('Casos específicos do LeetCode', () {
      test('exemplo 1: x = 121', () {
        expect(palindrome.isPalindrome(121), isTrue);
        expect(palindrome.isPalindromeOptimized(121), isTrue);
        expect(palindrome.isPalindromeString(121), isTrue);
        expect(palindrome.isPalindromeMath(121), isTrue);
      });

      test('exemplo 2: x = -121', () {
        expect(palindrome.isPalindromeOptimized(-121), isFalse);
        expect(palindrome.isPalindromeString(-121), isFalse);
        expect(palindrome.isPalindromeMath(-121), isFalse);
      });

      test('exemplo 3: x = 10', () {
        expect(palindrome.isPalindromeOptimized(10), isFalse);
        expect(palindrome.isPalindromeString(10), isFalse);
        expect(palindrome.isPalindromeMath(10), isFalse);
      });
    });

    group('Casos extremos', () {
      test('números grandes', () {
        expect(palindrome.isPalindrome(12321), isTrue);
        expect(palindrome.isPalindromeOptimized(12321), isTrue);
        expect(palindrome.isPalindromeString(12321), isTrue);
        expect(palindrome.isPalindromeMath(12321), isTrue);

        expect(palindrome.isPalindrome(123454321), isTrue);
        expect(palindrome.isPalindromeOptimized(123454321), isTrue);
        expect(palindrome.isPalindromeString(123454321), isTrue);
        expect(palindrome.isPalindromeMath(123454321), isTrue);
      });

      test('palíndromos com números pares de dígitos', () {
        expect(palindrome.isPalindrome(1001), isTrue);
        expect(palindrome.isPalindromeOptimized(1001), isTrue);
        expect(palindrome.isPalindromeString(1001), isTrue);
        expect(palindrome.isPalindromeMath(1001), isTrue);

        expect(palindrome.isPalindrome(123321), isTrue);
        expect(palindrome.isPalindromeOptimized(123321), isTrue);
        expect(palindrome.isPalindromeString(123321), isTrue);
        expect(palindrome.isPalindromeMath(123321), isTrue);
      });

      test('palíndromos com números ímpares de dígitos', () {
        expect(palindrome.isPalindrome(12321), isTrue);
        expect(palindrome.isPalindromeOptimized(12321), isTrue);
        expect(palindrome.isPalindromeString(12321), isTrue);
        expect(palindrome.isPalindromeMath(12321), isTrue);

        expect(palindrome.isPalindrome(1234321), isTrue);
        expect(palindrome.isPalindromeOptimized(1234321), isTrue);
        expect(palindrome.isPalindromeString(1234321), isTrue);
        expect(palindrome.isPalindromeMath(1234321), isTrue);
      });
    });

    group('Consistência entre implementações', () {
      test('todas as implementações devem retornar o mesmo resultado', () {
        List<int> testCases = [
          0,
          1,
          5,
          9,
          10,
          11,
          121,
          -121,
          123,
          1221,
          12321,
          123321,
          1234321,
          12344321,
          1001,
          1010,
          9009,
          90109,
          123454321,
        ];

        for (int testCase in testCases) {
          bool original = palindrome.isPalindrome(testCase);
          bool optimized = palindrome.isPalindromeOptimized(testCase);
          bool stringMethod = palindrome.isPalindromeString(testCase);
          bool mathMethod = palindrome.isPalindromeMath(testCase);
          bool bruteForce = palindrome.isPalindromeBruteForce(testCase);

          expect(
            optimized,
            equals(original),
            reason: 'Optimized method failed for $testCase',
          );
          expect(
            stringMethod,
            equals(original),
            reason: 'String method failed for $testCase',
          );
          expect(
            mathMethod,
            equals(original),
            reason: 'Math method failed for $testCase',
          );
          expect(
            bruteForce,
            equals(original),
            reason: 'Brute force method failed for $testCase',
          );
        }
      });
    });
  });
}
