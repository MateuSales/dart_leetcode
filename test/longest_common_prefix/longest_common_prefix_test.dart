import 'package:dart_leetcode/longest_common_prefix/longest_common_prefix.dart';
import 'package:test/test.dart';

void main() {
  group('Longest Common Prefix - Implementação Original', () {
    final sut = LongestCommonPrefix();

    test('Test Case One - ["flower", "flow", "flight"]', () {
      expect(sut.execute(['flower', 'flow', 'flight']), 'fl');
    });

    test('Test Case Two - ["dog", "racecar", "car"]', () {
      expect(sut.execute(['dog', 'racecar', 'car']), '');
    });

    test('Test Case Three - ["a", ""]', () {
      expect(sut.execute(['a', '']), '');
    });

    test('Test Case Four - ["ab", "a"]', () {
      expect(sut.execute(['ab', 'a']), 'a');
    });

    test('Test Case Five - Lista vazia', () {
      expect(sut.execute([]), '');
    });

    test('Test Case Six - Uma única string', () {
      expect(sut.execute(['test']), 'test');
    });
  });

  group('Longest Common Prefix - Implementação Otimizada', () {
    final sut = LongestCommonPrefix();

    test('Test Case One - ["flower", "flow", "flight"]', () {
      expect(sut.executeOptimized(['flower', 'flow', 'flight']), 'fl');
    });

    test('Test Case Two - ["dog", "racecar", "car"]', () {
      expect(sut.executeOptimized(['dog', 'racecar', 'car']), '');
    });

    test('Test Case Three - ["a", ""]', () {
      expect(sut.executeOptimized(['a', '']), '');
    });

    test('Test Case Four - ["ab", "a"]', () {
      expect(sut.executeOptimized(['ab', 'a']), 'a');
    });

    test('Test Case Five - Lista vazia', () {
      expect(sut.executeOptimized([]), '');
    });

    test('Test Case Six - Uma única string', () {
      expect(sut.executeOptimized(['test']), 'test');
    });
  });

  group('Longest Common Prefix - Implementação Clássica', () {
    final sut = LongestCommonPrefix();

    test('Test Case One - ["flower", "flow", "flight"]', () {
      expect(sut.executeClassic(['flower', 'flow', 'flight']), 'fl');
    });

    test('Test Case Two - ["dog", "racecar", "car"]', () {
      expect(sut.executeClassic(['dog', 'racecar', 'car']), '');
    });

    test('Test Case Three - ["a", ""]', () {
      expect(sut.executeClassic(['a', '']), '');
    });

    test('Test Case Four - ["ab", "a"]', () {
      expect(sut.executeClassic(['ab', 'a']), 'a');
    });

    test('Test Case Five - Lista vazia', () {
      expect(sut.executeClassic([]), '');
    });

    test('Test Case Six - Uma única string', () {
      expect(sut.executeClassic(['test']), 'test');
    });
  });

  group('Longest Common Prefix - Binary Search', () {
    final sut = LongestCommonPrefix();

    test('Test Case One - ["flower", "flow", "flight"]', () {
      expect(sut.executeBinarySearch(['flower', 'flow', 'flight']), 'fl');
    });

    test('Test Case Two - ["dog", "racecar", "car"]', () {
      expect(sut.executeBinarySearch(['dog', 'racecar', 'car']), '');
    });

    test('Test Case Three - ["a", ""]', () {
      expect(sut.executeBinarySearch(['a', '']), '');
    });

    test('Test Case Four - ["ab", "a"]', () {
      expect(sut.executeBinarySearch(['ab', 'a']), 'a');
    });

    test('Test Case Five - Lista vazia', () {
      expect(sut.executeBinarySearch([]), '');
    });

    test('Test Case Six - Uma única string', () {
      expect(sut.executeBinarySearch(['test']), 'test');
    });
  });
}
