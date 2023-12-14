package com.example.MyFUND.servises;

import lombok.Data;

import java.util.Arrays;
import java.util.List;

@Data
public class StockData {
    private String tiker;
    private String fullName;
    private Double indRsi;
    private Double price;
    private Double signalMacd;
    private Double urovenMacd;
    private Double izmYTD;
    private Double izmYear;
    private Double izmMonth;
    private Double izmWeek;
    private String sector;
    public StockData(String resp){
        List<String> splitResp = Arrays.stream(resp.split(",")).toList();
        try {
            tiker = splitResp.get(1);
            fullName=splitResp.get(11);
            price = Double.parseDouble(splitResp.get(2));
            urovenMacd = Double.parseDouble(splitResp.get(4));
            signalMacd = Double.parseDouble(splitResp.get(5));
            indRsi = Double.parseDouble(splitResp.get(3));
            izmYTD = Double.parseDouble(splitResp.get(9));
            izmYear = Double.parseDouble(splitResp.get(6));
            izmMonth = Double.parseDouble(splitResp.get(7));
            izmWeek = Double.parseDouble(splitResp.get(8));
            sector = splitResp.get(10);

        } catch (IndexOutOfBoundsException ie) {
            System.out.printf("Ответ пришёл в неверном формате:%s%n", resp);
        }
    }
}
