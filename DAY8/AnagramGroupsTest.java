import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class AnagramGroupsTest {

    @Test
    @DisplayName("Test with an array containing anagrams")
    void testArrayWithAnagrams() {
        String[] input = {"eat", "tea", "tan", "ate", "nat", "bat"};
        List<List<String>> expected = Arrays.asList(
                Arrays.asList("eat", "tea", "ate"),
                Arrays.asList("tan", "nat"),
                Arrays.asList("bat")
        );
        List<List<String>> actual = AnagramGroups.groupAnagrams(input);
        assertEquals(expected.size(), actual.size());
        for (List<String> group : expected) {
            assertEquals(true, actual.contains(group));
        }
    }

    @Test
    @DisplayName("Test with an array containing no anagrams")
    void testArrayWithNoAnagrams() {
        String[] input = {"abc", "def", "ghi"};
        List<List<String>> expected = Arrays.asList(
                Arrays.asList("abc"),
                Arrays.asList("def"),
                Arrays.asList("ghi")
        );
        List<List<String>> actual = AnagramGroups.groupAnagrams(input);
        assertEquals(expected.size(), actual.size());
        for (List<String> group : expected) {
            assertEquals(true, actual.contains(group));
        }
    }

    @Test
    @DisplayName("Test with an empty array input")
    void testEmptyArray() {
        String[] input = {};
        List<List<String>> expected = Arrays.asList();
        List<List<String>> actual = AnagramGroups.groupAnagrams(input);
        assertEquals(expected, actual);
    }

    @Test
    @DisplayName("Test with arrays containing words of different lengths")
    void testArrayWithDifferentLengths() {
        String[] input = {"abc", "abcd", "ab"};
        List<List<String>> expected = Arrays.asList(
                Arrays.asList("abc"),
                Arrays.asList("abcd"),
                Arrays.asList("ab")
        );
        List<List<String>> actual = AnagramGroups.groupAnagrams(input);
        assertEquals(expected.size(), actual.size());
        for (List<String> group : expected) {
            assertEquals(true, actual.contains(group));
        }
    }

    @Test
    @DisplayName("Test with arrays containing words with special characters")
    void testArrayWithSpecialCharacters() {
        String[] input = {"a@t", "t@a", "ta@", "a@t"};
        List<List<String>> expected = Arrays.asList(
                Arrays.asList("a@t", "t@a", "ta@", "a@t")
        );
        List<List<String>> actual = AnagramGroups.groupAnagrams(input);
        assertEquals(expected.size(), actual.size());
        for (List<String> group : expected) {
            assertEquals(true, actual.contains(group));
        }
    }

    @Test
    @DisplayName("Test with arrays containing a mix of uppercase and lowercase letters")
    void testArrayWithMixedCase() {
        String[] input = {"bAT", "Tab", "BAT"};
        List<List<String>> expected = Arrays.asList(
                Arrays.asList("bAT", "Tab"),
                Arrays.asList("BAT")
        );
        List<List<String>> actual = AnagramGroups.groupAnagrams(input);
        assertEquals(expected.size(), actual.size());
        for (List<String> group : expected) {
            assertEquals(true, actual.contains(group));
        }
    }
}
