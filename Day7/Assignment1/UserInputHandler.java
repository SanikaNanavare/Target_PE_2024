package com.day7assign.handler;

import java.util.InputMismatchException;
import java.util.Scanner;

public class UserInputHandler {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int numInputs = 0;
        int numIntegers = 0;
        int numNonIntegers = 0;
        int sumIntegers = 0;
        StringBuilder integerInputs = new StringBuilder();
        StringBuilder nonIntegerInputs = new StringBuilder();

        while (true) {
            try {
                System.out.print("Enter an integer (or 'NO' to stop): ");
                String input = scanner.next();

                if (input.equalsIgnoreCase("NO")) {
                    break;
                }

                numInputs++;

                try {
                    int number = Integer.parseInt(input);
                    numIntegers++;
                    sumIntegers += number;
                    if (numIntegers == 1) {
                        integerInputs.append(number);
                    } else {
                        integerInputs.append(", ").append(number);
                    }
                } catch (NumberFormatException e) {
                    numNonIntegers++;
                    if (numNonIntegers == 1) {
                        nonIntegerInputs.append(input);
                    } else {
                        nonIntegerInputs.append(", ").append(input);
                    }
                }
            } catch (InputMismatchException e) {
                System.out.println("Invalid input. Please enter an integer.");
                scanner.next(); // clear the invalid input
            }
        }

        System.out.println("Number of inputs = " + numInputs);
        System.out.println("Number of integer inputs = " + numIntegers);
        System.out.println("Number of non-integer inputs = " + numNonIntegers);
        System.out.println("Sum of all integer inputs = " + sumIntegers);
        System.out.println("The integer inputs = " + integerInputs.toString());
        System.out.println("The non-integer inputs = " + nonIntegerInputs.toString());

        scanner.close();
    }
}
