import 'package:dart_leetcode/two_sum/two_sum.dart';
import 'package:test/test.dart';

void main() {
  test('Two Sum', () {
    final twoSum = TwoSum();
    expect(twoSum.twoSum([2, 7, 11, 15], 9), [0, 1]);
    expect(twoSum.twoSum([3, 2, 4], 6), [1, 2]);
    expect(twoSum.twoSum([3, 3], 6), [0, 1]);
    expect(twoSum.twoSum([1, 2, 3, 6, 9, 10, 13], 14), [0, 6]);
    expect(twoSum.twoSum([0, 4, 3, 0], 0), [0, 3]);
  });
}
