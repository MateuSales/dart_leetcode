class RomanToInteger {
  // Mapa estático para evitar recriação a cada chamada
  static const _romanValues = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000,
  };

  int romanToInt(String s) {
    if (s.isEmpty) return 0;

    int result = 0;
    int prevValue = 0;

    // Itera apenas uma vez, da direita para a esquerda
    for (int i = s.length - 1; i >= 0; i--) {
      final currentValue = _romanValues[s[i]]!;

      // Se o valor atual é menor que o anterior, subtrai (casos como IV, IX)
      // Senão, soma normalmente
      if (currentValue < prevValue) {
        result -= currentValue;
      } else {
        result += currentValue;
      }

      prevValue = currentValue;
    }

    return result;
  }

    int romanToIntMyImpl(String s) {
    final cornerCases = {
      'IV': 4,
      'IX': 9,
      'XL': 40,
      'XC': 90,
      'CD': 400,
      'CM': 900,
    };

    final cases = {
      'I': 1,
      'V': 5,
      'X': 10,
      'L': 50,
      'C': 100,
      'D': 500,
      'M': 1000,
    };

    int value = 0;
    String roman = s;

    for (var entry in cornerCases.entries) {
      if (roman.contains(entry.key)) {
        value += entry.value;
        roman = roman.replaceFirst(entry.key, '');
      }
    }

    for (int i = 0; i < roman.length; i++) {
      if (cases.keys.contains(roman[i])) {
        value += cases[roman[i]]!;
      }
    }

    return value;
  }
}
