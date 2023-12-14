package com.example.MyFUND.pojo.stocksPojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class FilterItem {
    @JsonProperty("left")
    private String left;

    @JsonProperty("right")
    private String right;

    @JsonProperty("operation")
    private String operation;
}
