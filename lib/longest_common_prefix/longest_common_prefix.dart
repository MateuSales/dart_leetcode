/// Classe para resolver o problema Longest Common Prefix do LeetCode
/// Implementa múltiplas soluções com diferentes otimizações
class LongestCommonPrefix {
  /// Implementação original baseada na sua solução
  /// Complexidade: O(S) onde S é a soma de todos os caracteres
  /// Espaço: O(S) para as estruturas auxiliares
  String execute(List<String> strs) {
    // Validação de entrada
    if (strs.isEmpty) return '';

    List<String> strAux = strs;
    strAux.sort((a, b) => a.length.compareTo(b.length));
    List<List<String>> matriz = strAux.map((s) => s.split('')).toList();
    String oldChar = '';
    String result = '';

    if (strAux.first.isEmpty) {
      return result;
    }

    for (int j = 0; j < strAux.first.length; j++) {
      for (int i = 0; i < strAux.length; i++) {
        if (i == 0) {
          oldChar = matriz[i][j];
        } else {
          if (oldChar != matriz[i][j]) {
            return result;
          }
        }
      }
      result += oldChar;
    }
    return result;
  }

  /// Implementação otimizada mantendo a lógica da solução original
  /// Melhorias:
  /// - Evita criação de matriz auxiliar
  /// - Usa StringBuffer para concatenação eficiente
  /// - Evita divisão de strings em listas
  /// Complexidade: O(S) onde S é a soma de todos os caracteres
  /// Espaço: O(1) - apenas StringBuffer para resultado
  String executeOptimized(List<String> strs) {
    // Validação de entrada
    if (strs.isEmpty) return '';

    // Cria cópia e ordena por comprimento (mantendo lógica original)
    List<String> sortedStrs = List.from(strs);
    sortedStrs.sort((a, b) => a.length.compareTo(b.length));

    // Se a menor string for vazia, não há prefixo comum
    if (sortedStrs.first.isEmpty) {
      return '';
    }

    StringBuffer result = StringBuffer();
    String shortestStr = sortedStrs.first;

    // Itera pelos caracteres da menor string
    for (int j = 0; j < shortestStr.length; j++) {
      String currentChar = shortestStr[j];

      // Verifica se todos as strings têm o mesmo caractere nesta posição
      for (int i = 1; i < sortedStrs.length; i++) {
        if (sortedStrs[i][j] != currentChar) {
          return result.toString();
        }
      }

      result.write(currentChar);
    }

    return result.toString();
  }

  /// Implementação alternativa sem ordenação (approach clássico)
  /// Complexidade: O(S) onde S é a soma de todos os caracteres
  /// Espaço: O(1)
  String executeClassic(List<String> strs) {
    if (strs.isEmpty) return '';

    String firstStr = strs[0];

    for (int i = 0; i < firstStr.length; i++) {
      String currentChar = firstStr[i];

      for (int j = 1; j < strs.length; j++) {
        // Se chegou ao fim de uma string ou caractere diferente
        if (i >= strs[j].length || strs[j][i] != currentChar) {
          return firstStr.substring(0, i);
        }
      }
    }

    return firstStr;
  }

  /// Implementação usando binary search para encontrar o comprimento máximo
  /// Útil quando temos muitas strings com prefixos comuns longos
  /// Complexidade: O(S * log m) onde m é o comprimento da menor string
  /// Espaço: O(1)
  String executeBinarySearch(List<String> strs) {
    if (strs.isEmpty) return '';

    int minLength = strs.map((s) => s.length).reduce((a, b) => a < b ? a : b);

    int left = 0;
    int right = minLength;

    while (left < right) {
      int mid = (left + right + 1) ~/ 2;

      if (_isCommonPrefix(strs, mid)) {
        left = mid;
      } else {
        right = mid - 1;
      }
    }

    return strs[0].substring(0, left);
  }

  /// Método auxiliar para verificar se existe prefixo comum de comprimento dado
  bool _isCommonPrefix(List<String> strs, int length) {
    String prefix = strs[0].substring(0, length);

    for (int i = 1; i < strs.length; i++) {
      if (!strs[i].startsWith(prefix)) {
        return false;
      }
    }

    return true;
  }
}
