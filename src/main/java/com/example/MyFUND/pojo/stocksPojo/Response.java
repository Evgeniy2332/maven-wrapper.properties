package com.example.MyFUND.pojo.stocksPojo;

import com.example.MyFUND.pojo.stocksPojo.DataItem;
import com.example.MyFUND.pojo.stocksPojo.Params;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Response {

    @JsonProperty("data")
    private List<DataItem> data;

    @JsonProperty("totalCount")
    private int totalCount;

    @JsonIgnoreProperties("params")
    private Params params;
}
