public class CALENDERPRINTER {

    public static void printCalendar(int month, int year) {
        if (isValidInput(month, year)) {
            int[][] calendar = generateCalendar(month, year);
            printFormattedCalendar(calendar);
        } else {
            System.out.println("Invalid input. Please provide a valid month and year.");
        }
    }

    private static boolean isValidInput(int month, int year) {
        return month >= 1 && month <= 12 && year > 0;
    }

    private static int[][] generateCalendar(int month, int year) {
        int[][] calendar = new int[6][7]; // Maximum 6 rows, 7 columns for days of the week
        int daysInMonth = getDaysInMonth(month, year);
        int startDay = getStartDayOfMonth(month, year);
        int day = 1;

        for (int i = 0; i < calendar.length; i++) {
            for (int j = startDay; j < 7 && day <= daysInMonth; j++) {
                calendar[i][j] = day++;
            }
            startDay = 0; // Reset start day for the next row
        }

        return calendar;
    }

    private static int getDaysInMonth(int month, int year) {
        int[] daysInMonth = {31, 28 + (isLeapYear(year) ? 1 : 0), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        return daysInMonth[month - 1];
    }

    private static int getStartDayOfMonth(int month, int year) {
        int startDay = getDayOfWeek(1, month, year); // Get day of the week for the 1st day of the month
        return (startDay + 6) % 7; // Adjust start day index to match calendar format (0-Sunday, 1-Monday, ..., 6-Saturday)
    }

    private static int getDayOfWeek(int day, int month, int year) {
        if (month < 3) {
            month += 12;
            year -= 1;
        }
        int century = year / 100;
        year %= 100;
        int dayOfWeek = (day + (26 * (month + 1)) / 10 + year + year / 4 + century / 4 - 2 * century) % 7;
        return (dayOfWeek + 7) % 7; // Ensure positive result
    }

    private static boolean isLeapYear(int year) {
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    }

    private static void printFormattedCalendar(int[][] calendar) {
        String[] daysOfWeek = {"Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"};

        for (String day : daysOfWeek) {
            System.out.print(day + "\t");
        }
        System.out.println();

        for (int[] week : calendar) {
            for (int day : week) {
                if (day == 0) {
                    System.out.print("\t");
                } else {
                    System.out.print(day + "\t");
                }
            }
            System.out.println();
        }
    }

    public static void main(String[] args) {
        printCalendar(8, 2018);
    }
}
