package com.example.MyFUND.servises;

import com.example.MyFUND.pojo.bondsPojo.NewBondResponseItem;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.*;
import java.lang.reflect.Type;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class BondService {
    public static void main(String[] args) throws IOException {
        System.out.println(getBondsList(getStringJson()));
    }

    private static final String bondsURL = "https://www.dohod.ru/assets/components/dohodbonds/connectorweb.php?action=info";

    public static String getFileJson(String url) throws IOException {
        String outputFile = "output.json";//Создан файл для записи

        URL jsonUrl = new URL(url);//Создаем объект URL из строки URL
        BufferedReader reader = new BufferedReader(new InputStreamReader(jsonUrl.openStream(), StandardCharsets.UTF_8));// открываем поток для чтения данных с URL
        StringBuilder stringBuilder = new StringBuilder();// читаем данные из URL и записываем в строку
        String line;
        while ((line = reader.readLine()) != null) {
            stringBuilder.append(line);
        }
        reader.close();
        FileWriter fileWriter = new FileWriter(outputFile);//создаем средство записи в файл
        fileWriter.write(stringBuilder.toString());// записываем данные в файл
        fileWriter.close();// закрываем файл

        return outputFile;// возвращаем файл
    }

    public static List<NewBondResponseItem> getStringJson() throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();// создаем средство десериализации
        File file = new File(getFileJson(bondsURL));//получаем файл для десериализации//("src/main/java/service/Bond.json");
        return objectMapper.readValue(file, new TypeReference<>() {
            @Override
            public Type getType() {
                return super.getType();
            }
        });
    }

    public static List<NewBondResponseItem> getBondsList(List<NewBondResponseItem> item) {
        return item;
    }

    // Метод для фильтрации облигаций по значению столбца
    public static List<NewBondResponseItem> filterBondsByColumn(List<NewBondResponseItem> bondsList, int columnIndex, String filterValue) {
        List<NewBondResponseItem> filteredList = new ArrayList<>();

        for (NewBondResponseItem bond : bondsList) {
            // Выбираем значение из соответствующего столбца (здесь columnIndex - это индекс столбца в вашей таблице)
            String columnValue = getColumnValue(bond, columnIndex);

            // Если значение в столбце соответствует фильтру, добавляем облигацию в отфильтрованный список
            if (columnValue != null && columnValue.contains(filterValue)) {
                filteredList.add(bond);
            }
        }

        return filteredList;
    }

    // Метод для получения значения столбца для облигации
    private static String getColumnValue(NewBondResponseItem bond, int columnIndex) {
        switch (columnIndex) {
            case 0:
                return bond.getName();
            case 1:
                return bond.getPriceReturn();
            case 2:
                return bond.getPrice();
            case 3:
                return bond.getCouponvalue();
            case 4:
                return bond.getCouponperiod();
            case 5:
                return bond.getDuration();
            case 6:
                return bond.getCreditRatingText();
            case 7:
                return bond.getCouponType();
            case 8:
                return bond.getCurrency();
            case 9:
                return bond.getIsin();
            default:
                return null;
        }

    }
}
