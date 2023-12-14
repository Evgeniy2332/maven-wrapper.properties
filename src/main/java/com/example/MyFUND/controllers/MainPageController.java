package com.example.MyFUND.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static com.example.MyFUND.servises.MainPageStockServise.*;


@Controller
@RequestMapping("/")
public class MainPageController {

    @GetMapping
    public String index() {
        return "index";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/stats")
    public String stats() {
        return "stats";
    }

    @GetMapping("/getStataRussianStocks")
    public String getStataRussianStocks() {
        return "getStataRussianStocks";
    }


    @GetMapping("/resultMonth")
    public String showResultsMonth(Model model) {
        // Здесь необходимо вызвать методы getInfoMonth, getInfoWeek и getInfoDay
        // и добавить полученные списки в модель
        model.addAttribute("infoMonth", getInfoMonth());
        return "resultMonth";
    }

    @GetMapping("/resultWeek")
    public String showResultsWeek(Model model) {

//        model.addAttribute("infoMonth", getInfoMonth());
        model.addAttribute("infoWeek", getInfoWeek());
//        model.addAttribute("infoDay", getInfoDay());

        return "resultWeek";
    }

    @GetMapping("/resultDay")
    public String showResultsDay(Model model) {

        model.addAttribute("infoDay", getInfoDay());

        return "resultDay";
    }
    @GetMapping("/searchResults")
    public String showResults(Model model) {
        model.addAttribute("infoDay", getInfoDay());

        return "searchResults";
    }

    @PostMapping("/search")
    public String search(
            @RequestParam("searchText") String searchText,Model model
    ) {
        List<String> matchingItems = new ArrayList<>();
        List<String> items = null;

        // Определить, какой из трех вариантов items использовать, на основе значения параметра "period"

            items = info(); //stockAnalize(getStockDataFromJson(getRsi_month_all()));


        for (String item : items) {
            if (item.toLowerCase().contains(searchText.toLowerCase())) {
                matchingItems.add(item);
            }
        }

        model.addAttribute("matchingItems", matchingItems);
        return "searchResults"; // Вернуть имя представления для отображения результатов
    }

    @PostMapping("/search/sector")
    public String searchSector(@RequestParam("sector") String selectedSector, Model model) {
        List<String> matchingItems = new ArrayList<>();
        List<String> items =stockAnalize(getStockDataFromJson(getRsi_day_all())); //Stream.of(info(),izmForPeriod(getStockDataFromJson(getRsi_day_all()))).flatMap(List::stream).toList();//
        for (String item : items) {
            if (item.toLowerCase().contains(selectedSector.toLowerCase())) {
                matchingItems.add(item);
            }
        }

        model.addAttribute("matchingItems", matchingItems);
        return "searchResults"; // Вернуть имя представления для отображения результатов
    }

    @PostMapping("/searchFirstTen")
    public String searchFirstTen(Model model) {
        List<String> matchingItems = new ArrayList<>();
        List<String> items = stockAnalize(getStockDataFromJson(getRsi_day_all()));
        matchingItems = items.stream().limit(10).collect(Collectors.toList());

        model.addAttribute("matchingItems", matchingItems);
        return "searchResults"; // Вернуть имя представления для отображения результатов
    }

    @PostMapping("/searchLastTen")
    public String searchLastTen(Model model) {
        List<String> matchingItems = new ArrayList<>();
        List<String> items = stockAnalize(getStockDataFromJson(getRsi_day_all()));
        matchingItems = items.stream().skip(Math.max(0, items.size() - 10)).limit(10).collect(Collectors.toList());

        model.addAttribute("matchingItems", matchingItems);
        return "searchResults"; // Вернуть имя представления для отображения результатов
    }


    @PostMapping("/getInfoMonth")
    @ResponseBody
    public List<String> getInfoMonth() {

        return stockAnalize(getStockDataFromJson(getRsi_month_all()));
//        return info();
    }

    @PostMapping("/getInfoWeek")
    @ResponseBody
    public List<String> getInfoWeek() {

        return stockAnalize(getStockDataFromJson(getRsi_week_all()));
    }

    @PostMapping("/getInfoDay")
    @ResponseBody
    public List<String> getInfoDay() {
        List<String> result = new ArrayList<>();
        result = info();
        return result;//stockAnalize(getStockDataFromJson(getRsi_day_all()));
    }
}
