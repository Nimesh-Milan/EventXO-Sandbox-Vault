package com.sliit.eventbooking.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {

    private static final String DATA_DIR = "DataFiles/";

    public static void saveRecord(String fileName, String data) {
        File directory = new File(DATA_DIR);
        if (!directory.exists()) {
            directory.mkdirs();
        }

        File file = new File(DATA_DIR + fileName);
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(file, true))) {
            bw.write(data);
            bw.newLine();
        } catch (IOException e) {
            System.err.println("Error writing to file " + fileName + ": " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static List<String> readAllRecords(String fileName) {
        List<String> records = new ArrayList<>();
        File file = new File(DATA_DIR + fileName);
        
        if (!file.exists()) {
            return records;
        }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                records.add(line);
            }
        } catch (IOException e) {
            System.err.println("Error reading from file " + fileName + ": " + e.getMessage());
            e.printStackTrace();
        }
        return records;
    }

    public static void rewriteFile(String fileName, List<String> records) {
        File file = new File(DATA_DIR + fileName);
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(file, false))) { // false to overwrite
            for (String record : records) {
                bw.write(record);
                bw.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error rewriting file " + fileName + ": " + e.getMessage());
            e.printStackTrace();
        }
    }
}
