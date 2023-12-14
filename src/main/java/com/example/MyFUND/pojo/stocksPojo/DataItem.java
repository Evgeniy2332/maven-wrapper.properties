package com.example.MyFUND.pojo.stocksPojo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DataItem {
    @JsonProperty("s")
    private String S;

    @JsonProperty("d")
    private List<Object> D;
}
