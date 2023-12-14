package com.example.MyFUND.pojo.stocksPojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Options {
    @JsonProperty("lang")
    private String lang;
}
