import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class WordReversalTest {

    @Test
    @DisplayName("Test with a single word input")
    void testSingleWord() {
        String input = "Hello";
        String expected = "Hello";
        String actual = WordReversal.reverseWords(input);
        assertEquals(expected, actual);
    }

    @Test
    @DisplayName("Test with multiple words input")
    void testMultipleWords() {
        String input = "This is a test";
        String expected = "test a is This";
        String actual = WordReversal.reverseWords(input);
        assertEquals(expected, actual);
    }

    @Test
    @DisplayName("Test with leading and trailing spaces")
    void testLeadingTrailingSpaces() {
        String input = "  Hello World  ";
        String expected = "World Hello";
        String actual = WordReversal.reverseWords(input).trim();
        assertEquals(expected, actual);
    }

    @Test
    @DisplayName("Test with extra spaces between words")
    void testExtraSpacesBetweenWords() {
        String input = "This   is  a   test";
        String expected = "test a is This";
        String actual = WordReversal.reverseWords(input);
        assertEquals(expected, actual);
    }

    @Test
    @DisplayName("Test with an empty string input")
    void testEmptyString() {
        String input = "";
        String expected = "";
        String actual = WordReversal.reverseWords(input);
        assertEquals(expected, actual);
    }

    @Test
    @DisplayName("Test with special characters and punctuation marks")
    void testSpecialCharacters() {
        String input = "Hello, world! This is a test.";
        String expected = "test. a is This world! Hello,";
        String actual = WordReversal.reverseWords(input);
        assertEquals(expected, actual);
    }
}
