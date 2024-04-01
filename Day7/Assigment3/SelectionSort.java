package com.day7assign.sort;
interface Sortable {
    void sort(int[] arr);
}
class SelectionSort implements Sortable {
    @Override
    public void sort(int[] arr) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            int minIndex = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] < arr[minIndex]) {
                    minIndex = j;
                }
            }
            int temp = arr[minIndex];
            arr[minIndex] = arr[i];
            arr[i] = temp;
        }
    }
}

public class SelectionSortTest {
    public static void main(String[] args) {
        int[] arr = {8, 3, 6, 4, 2};
        SelectionSort selectionSort = new SelectionSort();
        System.out.println("Using Selection Sort:");
        System.out.println("Original array: " + java.util.Arrays.toString(arr));
        selectionSort.sort(arr);
        System.out.println("Sorted array: " + java.util.Arrays.toString(arr));
    }
}
