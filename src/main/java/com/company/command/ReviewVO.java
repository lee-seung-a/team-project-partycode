package com.company.command;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
   private int rpno;
   private int revno;
   private String revwriter;
   private int rating;
   private String revcontent;
}