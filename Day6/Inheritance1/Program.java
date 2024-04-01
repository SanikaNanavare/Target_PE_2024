package com.Day6.inheritance1;

public class Program

{
    public static void main(String[] args)
    {
        Person[] people = {
                new Student("Shyam", "Bangalore, Karnataka", "Java fundamentals", 2010, 4500.0),
                new Staff("Anand", "Bangalore, Karnataka", "Delhi Public school", 35000.0),
                new Staff("Umesh", "Bangalore, Karnataka", "National Public school", 42000.0),
                new Student("Suresh", "Hassan, Karnataka", "Java fundamentals", 2012, 4750.0),
                new Student("Kiran", "Vasco, Goa", "ReactJS", 2017, 12500.0)
        };

        for (Person person : people) {
            System.out.println(person);
        }
    }
}
