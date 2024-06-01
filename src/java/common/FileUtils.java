/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package common;

import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

public class FileUtils {

    public static String writeFile(Part filePart, String desPath) throws IOException {
        // get name file which we just upload
        String fileName = filePart.getSubmittedFileName();
        // status
        String status = "";
        if (fileName != null && !fileName.isEmpty()) {
            filePart.write(desPath + fileName);
            status += (fileName);
        } else {
            status += "No file selected for upload.";
        }
        return status;
    }

    public static boolean deleteFile(String filePath) {
        File file = new File(filePath);
        if (file.exists() && file.isFile()) {
            return file.delete();
        }
        return false;
    }
}
