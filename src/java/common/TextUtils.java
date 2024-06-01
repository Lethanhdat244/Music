/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package common;

import java.security.SecureRandom;

/**
 *
 * @author thanh
 */
public class TextUtils {

    private static final String LOWERCASE = "abcdefghijklmnopqrstuvwxyz";
    private static final String UPPERCASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String DIGITS = "0123456789";
    private static final String ALL_CHARACTERS = LOWERCASE + UPPERCASE + DIGITS;
    private static SecureRandom random = new SecureRandom();

    public static String initRandomPass(int passwordLength) {
        StringBuilder password = new StringBuilder(passwordLength);

        // Add at least one lowercase, one uppercase, and one digit character
        password.append(LOWERCASE.charAt(random.nextInt(LOWERCASE.length())));
        password.append(UPPERCASE.charAt(random.nextInt(UPPERCASE.length())));
        password.append(DIGITS.charAt(random.nextInt(DIGITS.length())));

        // Fill the remaining characters with a mix of all available characters
        for (int i = 3; i < passwordLength; i++) {
            password.append(ALL_CHARACTERS.charAt(random.nextInt(ALL_CHARACTERS.length())));
        }

        // Shuffle the characters in the password
        String shuffledPassword = shuffleString(password.toString());

        return shuffledPassword;
    }

    // Helper method to shuffle the characters in the password
    private static String shuffleString(String input) {
        char[] characters = input.toCharArray();
        for (int i = characters.length - 1; i > 0; i--) {
            int index = random.nextInt(i + 1);
            char temp = characters[i];
            characters[i] = characters[index];
            characters[index] = temp;
        }
        return new String(characters);
    }

}
