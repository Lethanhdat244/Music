/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package common;

/**
 *
 * @author thanh
 */
import org.apache.tika.*;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import org.apache.tika.exception.TikaException;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.mp3.Mp3Parser;
import org.apache.tika.sax.BodyContentHandler;
import org.xml.sax.SAXException;

public class Mp3Utils {

    public static Metadata getMetadata(String filePath) {
        try {
            // create input stream for MP3 file
            InputStream inputStream = new FileInputStream(filePath);

            //Initialize
            Mp3Parser parser = new Mp3Parser();
            BodyContentHandler handler = new BodyContentHandler();
            Metadata metadata = new Metadata();

            // Parse the MP3 file and extract metadata
            parser.parse(inputStream, handler, metadata, new ParseContext());
            return metadata;

        } catch (IOException | TikaException | SAXException e) {
        }
        return null;
    }

    public static String readFile(Metadata data) {
        String[] metadataNames = data.names();
        String output = "";
        for (String name : metadataNames) {
            output += (name + ": " + data.get(name) + "\n");
        }
        return output;
    }

    public static HashMap<String, String> info(Metadata data) {
        String[] metadataNames = data.names();
        int i = 0;
        HashMap<String, String> output = new HashMap<>();

        for (String name : metadataNames) {
            output.put(name, data.get(name));
        }
        return output;
    }

    public static void none(String[] args) {
        String filePath = "D:\\Music\\Music\\web\\resources\\songs\\SonTungMTP\\TheresNoOneAtAll-SonTungMTP-7583837.mp3";
        try {
            // create input stream for MP3 file
            InputStream inputStream = new FileInputStream(filePath);

            //Initializej 
            Mp3Parser parser = new Mp3Parser();
            BodyContentHandler handler = new BodyContentHandler();
            Metadata metadata = new Metadata();

            // Parse the MP3 file and extract metadata
            parser.parse(inputStream, handler, metadata, new ParseContext());
            String[] metadataNames = metadata.names();

            System.out.println("Contents of the document:\n" + handler.toString());
            System.out.println("Metadata of the document:");

            for (String name : metadataNames) {
                System.out.println(name + ": " + metadata.get(name));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
