/// Solution of Project Euler Problem 1
///
/// If we list all the natural numbers below 10 that are multiples of 3 or 5,
/// we get 3, 5, 6 and 9. The sum of these multiples is 23.
///
/// Find the sum of all the multiples of 3 or 5 below 1000.
///
/// Ans: 233168
///
/// Click [here](https://projecteuler.net/problem=1) for the problem description.
int problem_1() {
  int sum = 0;
  for (var i = 0; i < 1000; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      sum += i;
    }
  }

  return sum;
}
