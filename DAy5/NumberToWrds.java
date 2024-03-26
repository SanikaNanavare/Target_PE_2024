public class NumberToWrds {

    private static final String[] ones = {"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
    private static final String[] teens = {"ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
    private static final String[] tens = {"", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};

    public static String inWords(int num) {
        if (num < 0 || num > 999999999) {
            return "Number out of range";
        }

        if (num == 0) {
            return "zero";
        }

        return convertToWords(num);
    }

    private static String convertToWords(int num) {
        String words = "";

        if (num >= 10000000) {
            words += convertToWords(num / 10000000) + " crore ";
            num %= 10000000;
        }

        if (num >= 100000) {
            words += convertToWords(num / 100000) + " lakh ";
            num %= 100000;
        }

        if (num >= 1000) {
            words += convertToWords(num / 1000) + " thousand ";
            num %= 1000;
        }

        if (num >= 100) {
            words += convertToWords(num / 100) + " hundred ";
            num %= 100;
        }

        if (num > 0) {
            if (!words.isEmpty()) {
                words += "and ";
            }

            if (num < 10) {
                words += ones[num];
            } else if (num < 20) {
                words += teens[num - 10];
            } else {
                words += tens[num / 10] + " " + ones[num % 10];
            }
        }

        return words;
    }

    public static void main(String[] args) {
        System.out.println(inWords(12345));    // twelve thousand three hundred forty five
        System.out.println(inWords(10203040)); // one crore two lakh three thousand forty
    }
}