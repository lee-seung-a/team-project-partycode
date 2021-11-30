package com.company.command;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UsersVO {
   
   private int uno;
   private String id;
   private String pw;
   private String uname;
   private String tellnum;
   private String email1;
   private String email2;
   private String addrZipNum;
   private String addrBasic;
   private String addrDetail;
   private Timestamp regdate;
   private char authStatus;
   private char gender;
   private int point;
   private String introduce;
   
   private MultipartFile file;
   private String uploadpath;
   private String fileloca;
   private String filename;
   private String filerealname;
   private ArrayList<PartyBoardVO> list;
   private ArrayList<IboughtthisVO> list2;
   private List<FollowVO> list3;
   
   private String recentReserv;
  
}