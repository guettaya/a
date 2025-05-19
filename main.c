#include <stdio.h>


extern void initializeArray(int *arr, int size, int value);
extern void printArray(int *arr, int size);
extern int findMax(int *arr, int size);

int main() {
    int arr[6];
    initializeArray(arr, 6, 7);
    arr[3] = 42;
    printArray(arr, 6);
    printf("\nMax = %d\n", findMax(arr, 6));
}
