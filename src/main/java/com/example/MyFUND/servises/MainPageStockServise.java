package com.example.MyFUND.servises;

import com.example.MyFUND.pojo.stocksPojo.DataItem;
import com.example.MyFUND.pojo.stocksPojo.Response;
import lombok.NonNull;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static io.restassured.RestAssured.given;

@Service
public class MainPageStockServise {


    public static void main(String[] args) {
        // System.out.println(stockAnalize(getStockDataFromJson(getRsi_month_all())));
        System.out.println(info());


    }

    private static final String URL = "https://scanner.tradingview.com/russia/scan";
    //    public static final String rsi_day_all = "{\"filter\":[{\"left\":\"type\",\"operation\":\"in_range\",\"right\":[\"stock\",\"dr\"]},{\"left\":\"subtype\",\"operation\":\"in_range\",\"right\":[\"common\",\"foreign-issuer\",\"\",\"preferred\"]},{\"left\":\"active_symbol\",\"operation\":\"equal\",\"right\":true}],\"options\":{\"lang\":\"ru\"},\"markets\":[\"russia\"],\"symbols\":{\"query\":{\"types\":[]},\"tickers\":[]},\"columns\":[\"logoid\",\"name\",\"close\",\"RSI\",\"MACD.macd\",\"MACD.signal\",\"Perf.Y\",\"Perf.1M\",\"Perf.W\",\"Perf.YTD\",\"description\",\"type\",\"subtype\",\"update_mode\",\"pricescale\",\"minmov\",\"fractional\",\"minmove2\",\"RSI[1]\",\"currency\",\"fundamental_currency_code\"],\"sort\":{\"sortBy\":\"market_cap_basic\",\"sortOrder\":\"desc\"},\"price_conversion\":{\"to_symbol\":false},\"range\":[0,244]}";
    public static final String rsi_day_all = "{\"filter\":[{\"left\":\"type\",\"operation\":\"in_range\",\"right\":[\"stock\",\"dr\"]},{\"left\":\"subtype\",\"operation\":\"in_range\",\"right\":[\"common\",\"foreign-issuer\",\"\",\"preferred\"]},{\"left\":\"active_symbol\",\"operation\":\"equal\",\"right\":true}],\"options\":{\"lang\":\"ru\"},\"markets\":[\"russia\"],\"symbols\":{\"query\":{\"types\":[]},\"tickers\":[]},\"columns\":[\"logoid\",\"name\",\"close\",\"RSI\",\"MACD.macd\",\"MACD.signal\",\"Perf.Y\",\"Perf.1M\",\"Perf.W\",\"Perf.YTD\",\"sector\",\"description\",\"type\",\"subtype\",\"update_mode\",\"pricescale\",\"minmov\",\"fractional\",\"minmove2\",\"RSI[1]\",\"currency\",\"fundamental_currency_code\"],\"sort\":{\"sortBy\":\"sector\",\"sortOrder\":\"desc\"},\"price_conversion\":{\"to_symbol\":false},\"range\":[0,300]}";
    public static final String rsi_week_all = "{\"filter\":[{\"left\":\"type\",\"operation\":\"in_range\",\"right\":[\"stock\",\"dr\"]},{\"left\":\"subtype\",\"operation\":\"in_range\",\"right\":[\"common\",\"foreign-issuer\",\"\",\"preferred\"]},{\"left\":\"active_symbol\",\"operation\":\"equal\",\"right\":true}],\"options\":{\"lang\":\"ru\"},\"markets\":[\"russia\"],\"symbols\":{\"query\":{\"types\":[]},\"tickers\":[]},\"columns\":[\"logoid\",\"name\",\"close|1W\",\"RSI|1W\",\"MACD.macd|1W\",\"MACD.signal|1W\",\"Perf.Y\",\"Perf.1M\",\"Perf.W\",\"Perf.YTD\",\"sector\",\"description\",\"type\",\"subtype\",\"update_mode|1W\",\"pricescale\",\"minmov\",\"fractional\",\"minmove2\",\"RSI[1]|1W\",\"currency\",\"fundamental_currency_code\"],\"sort\":{\"sortBy\":\"sector\",\"sortOrder\":\"desc\"},\"price_conversion\":{\"to_symbol\":false},\"range\":[0,300]}";
    //    private static final String rsi_week_all = "{\"filter\":[{\"left\":\"type\",\"operation\":\"in_range\",\"right\":[\"stock\",\"dr\"]},{\"left\":\"subtype\",\"operation\":\"in_range\",\"right\":[\"common\",\"foreign-issuer\",\"\",\"preferred\"]},{\"left\":\"active_symbol\",\"operation\":\"equal\",\"right\":true}],\"options\":{\"lang\":\"ru\"},\"markets\":[\"russia\"],\"symbols\":{\"query\":{\"types\":[]},\"tickers\":[]},\"columns\":[\"logoid\",\"name\",\"close|1W\",\"RSI|1W\",\"MACD.macd|1W\",\"MACD.signal|1W\",\"Perf.Y\",\"Perf.1M\",\"Perf.W\",\"Perf.YTD\",\"description\",\"type\",\"subtype\",\"update_mode|1W\",\"pricescale\",\"minmov\",\"fractional\",\"minmove2\",\"RSI[1]|1W\",\"currency\",\"fundamental_currency_code\"],\"sort\":{\"sortBy\":\"market_cap_basic\",\"sortOrder\":\"desc\"},\"price_conversion\":{\"to_symbol\":false},\"range\":[0,244]}";
//    private static final String rsi_month_all = "{\"filter\":[{\"left\":\"type\",\"operation\":\"in_range\",\"right\":[\"stock\",\"dr\"]},{\"left\":\"subtype\",\"operation\":\"in_range\",\"right\":[\"common\",\"foreign-issuer\",\"\",\"preferred\"]},{\"left\":\"active_symbol\",\"operation\":\"equal\",\"right\":true}],\"options\":{\"lang\":\"ru\"},\"markets\":[\"russia\"],\"symbols\":{\"query\":{\"types\":[]},\"tickers\":[]},\"columns\":[\"logoid\",\"name\",\"close|1M\",\"RSI|1M\",\"MACD.macd|1M\",\"MACD.signal|1M\",\"Perf.Y\",\"Perf.1M\",\"Perf.W\",\"Perf.YTD\",\"description\",\"type\",\"subtype\",\"update_mode|1M\",\"pricescale\",\"minmov\",\"fractional\",\"minmove2\",\"RSI[1]|1M\",\"currency\",\"fundamental_currency_code\"],\"sort\":{\"sortBy\":\"market_cap_basic\",\"sortOrder\":\"desc\"},\"price_conversion\":{\"to_symbol\":false},\"range\":[0,244]}";
    private static final String rsi_month_all = "{\"filter\":[{\"left\":\"type\",\"operation\":\"in_range\",\"right\":[\"stock\",\"dr\"]},{\"left\":\"subtype\",\"operation\":\"in_range\",\"right\":[\"common\",\"foreign-issuer\",\"\",\"preferred\"]},{\"left\":\"active_symbol\",\"operation\":\"equal\",\"right\":true}],\"options\":{\"lang\":\"ru\"},\"markets\":[\"russia\"],\"symbols\":{\"query\":{\"types\":[]},\"tickers\":[]},\"columns\":[\"logoid\",\"name\",\"close|1M\",\"RSI|1M\",\"MACD.macd|1M\",\"MACD.signal|1M\",\"Perf.Y\",\"Perf.1M\",\"Perf.W\",\"Perf.YTD\",\"sector\",\"description\",\"type\",\"subtype\",\"update_mode|1M\",\"pricescale\",\"minmov\",\"fractional\",\"minmove2\",\"RSI[1]|1M\",\"currency\",\"fundamental_currency_code\"],\"sort\":{\"sortBy\":\"sector\",\"sortOrder\":\"desc\"},\"price_conversion\":{\"to_symbol\":false},\"range\":[0,300]}";

    public static String getURL() {
        return URL;
    }

    public static @NonNull String getRsi_month_all() {
        return rsi_month_all;
    }

    public static @NonNull String getRsi_week_all() {
        return rsi_week_all;
    }

    public static @NonNull String getRsi_day_all() {
        return rsi_day_all;
    }


    public static Response stockData(String requestBody) {
        return given()
                .contentType("application/json")
                .and()
                .body(requestBody)
                .when()
                .post(getURL())
                .then()//.log().all()
                .extract().as(Response.class);
    }


    public static @NonNull List<String> getStockDataFromJson(String URL) {
        List<String> list = new ArrayList<>();
        List<DataItem> dataItems = stockData(URL).getData();
        for (DataItem dataItem : dataItems) {
            if (dataItem != null) {
                String str = dataItem.getD().toString();
                list.add(str);
            }
        }
        return list;
    }

    public static @NotNull List<String> stockAnalize(@NotNull List<String> changePrices) {
        List<String> text = new ArrayList<>();
        DecimalFormat d = new DecimalFormat("#.##");
        for (String s : changePrices) {
            try {
                text.add("\nRSI:" + (d.format(new StockData(s).getIndRsi()) + "   \n") + ("\nТикер:" + (new StockData(s).getTiker()) + "\n") + ("Полное наименование:" + new StockData(s).getFullName() + "\n") + ("Текущая цена:" + new StockData(s).getPrice() + "\n")
                        + /*("Отрасль:" + new DinamicPeriod(s).getOtrasl()+ "\n") +*/ ("Изменение цены за год:" + (d.format(new StockData(s).getIzmYear())) + "\n") + ("Изменение цены YTD:" + (d.format(new StockData(s).getIzmYTD())) + "\n")
                        + ("Изменение цены за месяц:" + (d.format(new StockData(s).getIzmMonth())) + "\n") + ("Изменение цены за неделю:" + (d.format(new StockData(s).getIzmWeek())) + "\n") + ("\nСектор:" + (new StockData(s).getSector()) + "\n\n"));

            } catch (NumberFormatException e) {
                System.out.println();
            }
            Collections.sort(text);
        }
        return text;
    }

    public static @NotNull List<String> izmForPeriod(@NotNull List<String> changePrices) {
        List<String> text = new ArrayList<>();
        DecimalFormat d = new DecimalFormat("#.##");
        for (String s : changePrices) {
            try {
                text.add(("\nТикер:" + (new StockData(s).getTiker()) + "\n") + ("Полное наименование:" + new StockData(s).getFullName() + "\n") + ("Текущая цена:" + new StockData(s).getPrice() + "\n")
                        + ("Изменение цены за год:" + (d.format(new StockData(s).getIzmYear())) + "\n") + ("Изменение цены YTD:" + (d.format(new StockData(s).getIzmYTD())) + "\n")
                        + ("Изменение цены за месяц:" + (d.format(new StockData(s).getIzmMonth())) + "\n") + ("Изменение цены за неделю:" + (d.format(new StockData(s).getIzmWeek())) + "\n") + ("Сектор:" + (new StockData(s).getSector()) + "\n\n"));

            } catch (NumberFormatException e) {
                System.out.println();
            }
            Collections.sort(text);
        }
        return text;
    }

    public static @NotNull List<String> rsiByPeriod(@NotNull List<String> changePrices, String period) {
        List<String> text = new ArrayList<>();
        DecimalFormat d = new DecimalFormat("#.##");
        for (String s : changePrices) {
            try {
                text.add(  ("\nТикер:" + (new StockData(s).getTiker()) + "\n")+"RSI"+period+":" + (d.format(new StockData(s).getIndRsi()) + "\n"));

            } catch (NumberFormatException e) {
                System.out.println();
            }
            Collections.sort(text);
        }
        return text;
    }

    public static @NotNull List<String> info() {
        List<String> text = new ArrayList<>();
        try {
            text = Stream.of(izmForPeriod(getStockDataFromJson(getRsi_day_all())), rsiByPeriod(getStockDataFromJson(getRsi_day_all()), " день"),rsiByPeriod(getStockDataFromJson(getRsi_week_all())," неделя"),rsiByPeriod(getStockDataFromJson(getRsi_month_all())," месяц"))
                    .flatMap(List::stream)
                    .collect(Collectors.toList());

            List<String> sortedList = text.stream()
                    .collect(Collectors.groupingBy(
                            s -> s.split(" ")[1], // Группируем по значению тикера
                            TreeMap::new,
                            Collectors.toList()
                    ))
                    .entrySet().stream()
                    .flatMap(entry -> entry.getValue().stream()
                            .sorted())
                    .toList();


        } catch (NumberFormatException e) {
            System.out.println();
        } Collections.sort(text);
        return text;
    }



    public static List<String> replaceAllZpt(@NotNull List<String> cel) {
        return Collections.singletonList(String.join("", cel));
    }


}


