#include <stdio.h>
#include <stdbool.h>

extern long factorial(int num);
extern bool isEven(int num);
extern int gcd(int a, int b);

int main() {
    int a = 6, b = 15;

    printf("Factorial of %d = %ld\n", a, factorial(a));
    printf("%d is %s\n", a, isEven(a) ? "Even" : "Odd");
    printf("GCD of %d and %d = %d\n", a, b, gcd(a, b));

    return 0;
}
