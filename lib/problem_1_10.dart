/// Solution of Project Euler Problem 1
///
/// If we list all the natural numbers below 10 that are multiples of 3 or 5,
/// we get 3, 5, 6 and 9. The sum of these multiples is 23.
///
/// Find the sum of all the multiples of 3 or 5 below 1000.
///
/// Ans: 233168
///
/// Here's the [link](https://projecteuler.net/problem=1)
problem_1() => List<int>.generate(999, (i) => ++i)
    .where((i) => i % 3 == 0 || i % 5 == 0)
    .reduce((a, b) => a + b);

/// Each new term in the Fibonacci sequence is generated by adding the previous
/// two terms. By starting with 1 and 2, the first 10 terms will be:
///
/// 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
///
/// By considering the terms in the Fibonacci sequence whose values do not exceed
/// four million, find the sum of the even-valued terms.
///
/// Here's the [link](https://projecteuler.net/problem=2)
problem_2() => (([butLast = 1, last = 1]) sync* {
      while (last <= 4000000) {
        yield last;
        var temp = butLast;
        butLast = last;
        last = temp + butLast;
      }
    })()
        .where((i) => i % 2 == 0)
        .reduce((a, b) => a + b);
