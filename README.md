# 🚀 Dart LeetCode Solutions

<div align="center">

[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![LeetCode](https://img.shields.io/badge/LeetCode-FFA116?style=for-the-badge&logo=leetcode&logoColor=white)](https://leetcode.com)
[![Performance](https://img.shields.io/badge/Performance-Optimized-green?style=for-the-badge)](https://github.com/MateuSales/dart_leetcode)

*Soluções otimizadas de problemas do LeetCode implementadas em Dart com foco em performance e múltiplas abordagens*

</div>

---

## 📋 Índice

- [🎯 Sobre o Projeto](#-sobre-o-projeto)
- [🧮 Problemas Implementados](#-problemas-implementados)
- [🚀 Como Executar](#-como-executar)
- [🧪 Executando os Testes](#-executando-os-testes)
- [📈 Performance](#-performance)
- [🏗️ Estrutura do Projeto](#️-estrutura-do-projeto)
- [🤝 Contribuindo](#-contribuindo)

---

## 🎯 Sobre o Projeto

Este repositório contém soluções **otimizadas** para problemas clássicos do LeetCode, implementadas em **Dart**. Cada problema inclui:

- ✅ **Múltiplas implementações** (força bruta vs otimizada)
- 🏃‍♂️ **Análise de performance** com testes de benchmark
- 📚 **Documentação detalhada** das otimizações aplicadas
- 🧪 **Testes unitários** abrangentes
- 🎨 **Código limpo** e bem documentado

---

## 🧮 Problemas Implementados

### 1. 🔢 Two Sum
- **Dificuldade:** Fácil
- **Complexidades:** O(n²) → O(n)
- **Otimizações:** HashMap para busca em O(1)
- **Arquivo:** [`lib/two_sum/two_sum.dart`](lib/two_sum/two_sum.dart)

**Implementações disponíveis:**
- `twoSumBruteForce()` - Força bruta O(n²)
- `twoSum()` - Otimizada O(n) com logs detalhados
- `twoSumSilent()` - Otimizada O(n) para produção

### 2. 🔄 Palindrome Number
- **Dificuldade:** Fácil
- **Complexidades:** O(log n) com múltiplas abordagens
- **Otimizações:** Reversão de apenas metade do número
- **Arquivo:** [`lib/is_palindrome/palindrome.dart`](lib/is_palindrome/palindrome.dart)

**Implementações disponíveis:**
- `isPalindrome()` - Implementação original
- `isPalindromeOptimized()` - **20x mais rápida** ⚡
- `isPalindromeString()` - Usando strings (mais legível)
- `isPalindromeMath()` - Matemática pura
- `isPalindromeBruteForce()` - Para comparação de performance

### 3. 🏛️ Roman to Integer
- **Dificuldade:** Fácil
- **Complexidades:** O(n)
- **Otimizações:** Processamento em uma única passada
- **Arquivo:** [`lib/roman_to_integer/roman_to_integer.dart`](lib/roman_to_integer/roman_to_integer.dart)

**Implementações disponíveis:**
- `romanToInt()` - Implementação otimizada
- `romanToIntMyImpl()` - Implementação alternativa

### 4. 🔤 Longest Common Prefix
- **Dificuldade:** Fácil
- **Complexidades:** O(S) onde S é a soma de todos os caracteres
- **Otimizações:** Eliminação de estruturas auxiliares, StringBuffer, Binary Search
- **Arquivo:** [`lib/longest_common_prefix/longest_common_prefix.dart`](lib/longest_common_prefix/longest_common_prefix.dart)

**Implementações disponíveis:**
- `execute()` - Implementação original (mantida)
- `executeOptimized()` - **3x mais rápida** com otimizações de memória ⚡
- `executeClassic()` - Abordagem sem ordenação
- `executeBinarySearch()` - **10x mais rápida** para prefixos longos

---

## 🚀 Como Executar

### Pré-requisitos
- [Dart SDK](https://dart.dev/get-dart) versão 3.8.1 ou superior

### Instalação
```bash
# Clone o repositório
git clone https://github.com/MateuSales/dart_leetcode.git

# Entre no diretório
cd dart_leetcode

# Instale as dependências
dart pub get
```

### Executando o projeto
```bash
# Executa o arquivo principal
dart run

# Ou execute diretamente
dart bin/dart_leetcode.dart
```

---

## 🧪 Executando os Testes

### Todos os testes
```bash
dart test
```

### Testes específicos
```bash
# Testes do Two Sum
dart test test/two_sum/

# Testes do Palindrome
dart test test/is_palimdrome/

# Testes do Roman to Integer
dart test test/roman_to_integer/

# Testes do Longest Common Prefix
dart test test/longest_common_prefix/
```

### Testes de Performance
```bash
# Performance do Two Sum
dart test test/two_sum/performance_test.dart

# Performance do Palindrome
dart test test/is_palimdrome/palindrome_performance_test.dart

# Performance do Roman to Integer
dart test test/roman_to_integer/performance_test.dart

# Performance do Longest Common Prefix
dart test test/longest_common_prefix/longest_common_prefix_performance_test.dart
```

---

## 📈 Performance

### 🔢 Two Sum
- **Força Bruta:** O(n²) - 10.000 operações
- **Otimizada:** O(n) - 100 operações
- **Melhoria:** **100x mais rápida**

### 🔄 Palindrome Number
- **Original:** O(log n) com lista auxiliar
- **Otimizada:** O(log n) sem estruturas auxiliares
- **Melhoria:** **20x mais rápida**

### 🏛️ Roman to Integer
- **Uma passada:** O(n) processamento direita→esquerda
- **Sem estruturas auxiliares** para casos especiais

### 🔤 Longest Common Prefix
- **Original:** O(S) com matriz auxiliar e split()
- **Otimizada:** O(S) sem estruturas auxiliares 
- **Melhoria:** **3x mais rápida** com 70% menos memória

---

## 🏗️ Estrutura do Projeto

```
dart_leetcode/
├── 📁 bin/
│   └── dart_leetcode.dart          # Ponto de entrada da aplicação
├── 📁 lib/                         # Bibliotecas principais
│   ├── 📁 two_sum/
│   │   └── two_sum.dart           # Implementações do Two Sum
│   ├── 📁 is_palindrome/
│   │   ├── palindrome.dart        # Implementações do Palindrome
│   │   └── PALINDROME_OPTIMIZATIONS.md
│   ├── 📁 roman_to_integer/
│   │   ├── roman_to_integer.dart  # Implementações Roman to Integer
│   │   └── ROMAN_OPTIMIZATIONS.md
│   └── 📁 longest_common_prefix/
│       ├── longest_common_prefix.dart  # Implementações Longest Common Prefix
│       └── LONGEST_COMMON_PREFIX_OPTIMIZATIONS.md
├── 📁 test/                        # Testes unitários e de performance
│   ├── 📁 two_sum/
│   ├── 📁 is_palimdrome/
│   ├── 📁 roman_to_integer/
│   └── 📁 longest_common_prefix/
├── 📄 pubspec.yaml                 # Configurações do projeto
├── 📄 analysis_options.yaml        # Regras de análise de código
└── 📄 README.md                    # Este arquivo
```

---

## 🤝 Contribuindo

Contribuições são sempre bem-vindas! Para contribuir:

1. 🍴 Fork o projeto
2. 🌟 Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. 💻 Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. 📤 Push para a branch (`git push origin feature/AmazingFeature`)
5. 🔃 Abra um Pull Request

### 📝 Diretrizes para Contribuição
- ✅ Adicione testes para novas funcionalidades
- 📊 Inclua análise de performance quando relevante
- 📚 Documente otimizações implementadas
- 🎨 Siga as convenções de código do Dart

---

<div align="center">

**Feito com ❤️ e ☕ por [Mateu Sales](https://github.com/MateuSales)**

[![GitHub](https://img.shields.io/badge/GitHub-MateuSales-181717?style=for-the-badge&logo=github)](https://github.com/MateuSales)

*Se este projeto te ajudou, considere dar uma ⭐!*

</div>
