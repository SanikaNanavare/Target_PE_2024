import java.util.ArrayList;
import java.util.List;

public class PrimeFactorization {

    public static List<Integer> primeFactors(int n) {
        List<Integer> factors = new ArrayList<>();

        if (n <= 1) {
            return factors; // Return an empty list for 0, 1, and negative numbers
        }

        // Divide n by 2 until it is odd
        while (n % 2 == 0) {
            if (!factors.contains(2)) {
                factors.add(2);
            }
            n /= 2;
        }

        // n must be odd at this point, so a skip of 2 is used (i.e., check only odd numbers)
        for (int i = 3; i <= Math.sqrt(n); i += 2) {
            // While i divides n, add i and divide n
            while (n % i == 0) {
                if (!factors.contains(i)) {
                    factors.add(i);
                }
                n /= i;
            }
        }

        // This condition is to check if n is a prime number greater than 2
        if (n > 2) {
            factors.add(n);
        }

        return factors;
    }
}
