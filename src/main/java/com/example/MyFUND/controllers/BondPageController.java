package com.example.MyFUND.controllers;

import com.example.MyFUND.pojo.bondsPojo.NewBondResponseItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;

import static com.example.MyFUND.servises.BondService.*;
import static com.example.MyFUND.servises.MainPageStockServise.*;

@Controller
public class BondPageController {

    @GetMapping("/getStataRussianBonds")
    public String getStataRussianBonds(){
        return "getStataRussianBonds";
    }

    @GetMapping("/resultBonds")
    public String showResultsBonds(Model model,
                                   @RequestParam(value = "columnIndex", required = false) Integer columnIndex,
                                   @RequestParam(value = "filterValue", required = false) String filterValue) throws IOException {
        // Передаем параметры columnIndex и filterValue в getInfoBonds()
        model.addAttribute("infoBonds", getInfoBonds(columnIndex, filterValue));

        return "resultBonds";
    }


//    @PostMapping("/resultBond")
//    @ResponseBody
//    public List<NewBondResponseItem> getInfoBonds() throws IOException {
//
//        return getBondsList(getStringJson());
//    }

    @PostMapping("/resultBond")
    @ResponseBody
    public List<NewBondResponseItem> getInfoBonds(@RequestParam(value = "columnIndex", required = false) Integer columnIndex,
                                                  @RequestParam(value = "filterValue", required = false) String filterValue) throws IOException {
        List<NewBondResponseItem> bondsList = getBondsList(getStringJson());

        if (columnIndex != null && filterValue != null && !filterValue.isEmpty()) {
            // Проверяем, что переданы индекс столбца и значение фильтра
            bondsList = filterBondsByColumn(bondsList, columnIndex, filterValue);
        }

        return bondsList;
    }
}
