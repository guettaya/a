#include <stdio.h>

// Declare assembly functions
extern int stringLength(char* str);
extern void reverseString(char* str);
extern int isPalindrome(char* str);

int main() {
    char str1[] = "hello";
    char str2[] = "madam";
    char str3[] = "racecar";

    printf("Length of '%s' = %d\n", str1, stringLength(str1));

    printf("\nBefore reverse: %s\n", str1);
    reverseString(str1);
    printf("After reverse:  %s\n", str1);

    printf("\nIs '%s' a palindrome? %s\n", str2, isPalindrome(str2) ? "Yes" : "No");
    printf("Is '%s' a palindrome? %s\n", str3, isPalindrome(str3) ? "Yes" : "No");

    return 0;
}
