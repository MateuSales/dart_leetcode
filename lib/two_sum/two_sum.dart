class TwoSum {
  // Minha implementação do Two Sum em Dart
  List<int> myTwoSum(List<int> nums, int target) {
    int value = target;
    List<int> result = [];
    int j = 0;

    do {
      for (int i = j + 1; i < nums.length; i++) {
        value -= nums[j];
        value -= nums[i];

        result.add(j);
        result.add(i);

        if (value == 0) {
          return result;
        } else {
          result = [];
          value = target;
        }
      }

      j++;
      result = [];
      value = target;
    } while (value != 0);

    return [];
  }

  // Solução O(n²) - Força Bruta Simplificada
  List<int> twoSumBruteForce(List<int> nums, int target) {
    for (int i = 0; i < nums.length - 1; i++) {
      for (int j = i + 1; j < nums.length; j++) {
        if (nums[i] + nums[j] == target) {
          return [i, j];
        }
      }
    }
    return [];
  }

  // Solução O(n) - HashMap/Map (OTIMIZADA)
  List<int> twoSum(List<int> nums, int target) {
    print('🎯 Iniciando Two Sum otimizado');
    print('📊 Array: $nums');
    print('🎪 Target: $target\n');

    Map<int, int> numToIndex = {};

    for (int i = 0; i < nums.length; i++) {
      int complement = target - nums[i];

      print('📍 Índice $i: nums[$i] = ${nums[i]}');
      print('🔍 Procurando complemento: $target - ${nums[i]} = $complement');

      if (numToIndex.containsKey(complement)) {
        print('✅ Complemento encontrado! ${nums[i]} + $complement = $target');
        print('📋 Retornando índices: [${numToIndex[complement]}, $i]');
        print(
          '🏆 Resultado: nums[${numToIndex[complement]}] + nums[$i] = $complement + ${nums[i]} = $target\n',
        );
        return [numToIndex[complement]!, i];
      }

      print('❌ Complemento $complement não encontrado no HashMap');
      print('💾 Armazenando: nums[$i] = ${nums[i]} no índice $i');
      print('🗂️  HashMap atual: $numToIndex\n');

      numToIndex[nums[i]] = i;
    }

    print('❌ Nenhum par encontrado que soma $target');
    return [];
  }

  // Solução O(n) - HashMap/Map (SEM LOGS - para produção)
  List<int> twoSumSilent(List<int> nums, int target) {
    Map<int, int> numToIndex = {};

    for (int i = 0; i < nums.length; i++) {
      int complement = target - nums[i];

      if (numToIndex.containsKey(complement)) {
        return [numToIndex[complement]!, i];
      }

      numToIndex[nums[i]] = i;
    }

    return [];
  }
}
