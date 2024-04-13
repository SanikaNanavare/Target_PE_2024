package com.targetindia;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class StudentGradeAnalyzer {
    public static void main(String[] args) {
        // Read the input CSV file
        List<String> lines = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader("grades.csv"))) {
            lines = br.lines().collect(Collectors.toList());
        } catch (IOException e) {
            System.err.println("Error reading input file: " + e.getMessage());
            return;
        }

        // Parse the CSV and calculate statistics
        int totalGrades = 0;
        int highestGrade = Integer.MIN_VALUE;
        int lowestGrade = Integer.MAX_VALUE;
        int passedCount = 0;

        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length != 2) {
                System.err.println("Invalid input format: " + line);
                continue;
            }
            String studentName = parts[0].trim();
            int grade = Integer.parseInt(parts[1].trim());
            totalGrades += grade;
            highestGrade = Math.max(highestGrade, grade);
            lowestGrade = Math.min(lowestGrade, grade);
            if (grade >= 60) {
                passedCount++;
            }
        }
        int totalStudents = lines.size();
        int failedCount = totalStudents - passedCount;
        double averageGrade = (double) totalGrades / totalStudents;

        // Display statistics
        System.out.println("Statistics:");
        System.out.println("- Average grade: " + averageGrade);
        System.out.println("- Highest grade: " + highestGrade);
        System.out.println("- Lowest grade: " + lowestGrade);
        System.out.println("- Number of students passed: " + passedCount);
        System.out.println("- Number of students failed: " + failedCount);
    }
}

