import "dart:math";

/// Solution of Project Euler Problem 1
///
/// Find the sum of all the multiples of 3 or 5 below 1000.
///
/// Here's the [link](https://projecteuler.net/problem=1)
p1() => List<int>.generate(999, (i) => ++i)
    .where((i) => i % 3 == 0 || i % 5 == 0)
    .reduce((a, b) => a + b);

/// Solution of Project Euler Problem 2
///
/// By considering the terms in the Fibonacci sequence whose values do not exceed
/// four million, find the sum of the even-valued terms.
///
/// Here's the [link](https://projecteuler.net/problem=2)
problem2() => (([butLast = 1, last = 1]) sync* {
      while (last <= 4000000) {
        yield last;
        var temp = butLast;
        butLast = last;
        last = temp + butLast;
      }
    })()
        .where((i) => i % 2 == 0)
        .reduce((a, b) => a + b);

/// Solution of Project Euler Problem 3
///
/// What is the largest prime factor of the number 600851475143 ?
///
/// Here's the [link](https://projecteuler.net/problem=3)
p3() {
  int n = 600851475143, i = 2;

  while (i * i <= n)
    if (n % i == 0)
      n ~/= i;
    else
      i++;

  return n;
}

/// Solution of Project Euler Problem 4
///
/// Find the largest palindrome made from the product of two 3-digit numbers.
///
/// Here's the [link](https://projecteuler.net/problem=4)
p4() {
  bool isPalindrome(int original) {
    int reversed = 0;
    int temp = original;

    while (temp > 0) {
      reversed = 10 * reversed + temp % 10;
      temp ~/= 10;
    }
    return reversed == original;
  }

  var max = -1;
  for (var i = 100; i <= 999; i++) {
    for (var j = 100; j <= 999; j++) {
      var p = i * j;
      if (p > max && isPalindrome(p)) {
        max = p;
      }
    }
  }

  return max;
}

/// Solution of Project Euler Problem 5
///
/// What is the smallest positive number that is evenly divisible by all of the
/// numbers from 1 to 20?
///
/// Here's the [link](https://projecteuler.net/problem=5)
p5() {
  divisibleByAll(int number, limit) => List<int>.generate(limit, (i) => i + 1)
      .map((i) => number % i)
      .reduce((a, b) => a + b);

  return ((limit) {
    var i = limit;

    while (true) {
      if (divisibleByAll(i, limit) == 0) return i;
      i += limit;
    }
  })(20);
}

/// Solution of Project Euler Problem 6
///
/// Find the difference between the sum of the squares of the first
/// one hundred natural numbers and the square of the sum.
///
/// Here's the [link](https://projecteuler.net/problem=6)
p6() => (pow(List<int>.generate(100, (i) => i + 1).reduce((a, b) => a + b), 2) -
    List<int>.generate(100, (i) => i + 1)
        .map((n) => n * n)
        .reduce((a, b) => a + b));

/// Solution of Project Euler Problem 7
///
/// What is the 10 001st prime number?
///
/// Here's the [link](https://projecteuler.net/problem=7)
p7() {
  bool isPrime(int n) {
    if (n % 2 == 0) return n == 2;
    for (var i = 3; i * i <= n; i += 2) if (n % i == 0) return false;
    return true;
  }

  int nth = 0, i = 0;
  while (nth <= 10001) if (isPrime(++i)) ++nth;

  return i;
}
