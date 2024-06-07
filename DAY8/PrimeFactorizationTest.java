import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class PrimeFactorizationTest {

    @Test
    @DisplayName("Test with a prime number")
    void testPrimeNumber() {
        int input = 13;
        List<Integer> expected = Arrays.asList(13);
        List<Integer> actual = PrimeFactorization.primeFactors(input);
        assertEquals(expected, actual);
    }

    @Test
    @DisplayName("Test with a composite number")
    void testCompositeNumber() {
        int input = 30;
        List<Integer> expected = Arrays.asList(2, 3, 5);
        List<Integer> actual = PrimeFactorization.primeFactors(input);
        assertEquals(expected, actual);
    }

    @Test
    @DisplayName("Test with a number that has only one prime factor")
    void testNumberWithOnePrimeFactor() {
        int input = 8;
        List<Integer> expected = Arrays.asList(2);
        List<Integer> actual = PrimeFactorization.primeFactors(input);
        assertEquals(expected, actual);
    }

    @Test
    @DisplayName("Test with a negative number")
    void testNegativeNumber() {
        int input = -30;
        List<Integer> expected = Collections.emptyList();
        List<Integer> actual = PrimeFactorization.primeFactors(input);
        assertEquals(expected, actual);
    }

    @Test
    @DisplayName("Test with zero")
    void testZero() {
        int input = 0;
        List<Integer> expected = Collections.emptyList();
        List<Integer> actual = PrimeFactorization.primeFactors(input);
        assertEquals(expected, actual);
    }

    @Test
    @DisplayName("Test with one")
    void testOne() {
        int input = 1;
        List<Integer> expected = Collections.emptyList();
        List<Integer> actual = PrimeFactorization.primeFactors(input);
        assertEquals(expected, actual);
    }

    @Test
    @DisplayName("Test with large composite number")
    void testLargeCompositeNumber() {
        int input = 100;
        List<Integer> expected = Arrays.asList(2, 5);
        List<Integer> actual = PrimeFactorization.primeFactors(input);
        assertEquals(expected, actual);
    }

    @Test
    @DisplayName("Test with large prime number")
    void testLargePrimeNumber() {
        int input = 101;
        List<Integer> expected = Arrays.asList(101);
        List<Integer> actual = PrimeFactorization.primeFactors(input);
        assertEquals(expected, actual);
    }
}
