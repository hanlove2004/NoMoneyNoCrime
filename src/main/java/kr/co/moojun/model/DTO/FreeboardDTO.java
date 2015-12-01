package kr.co.moojun.model.DTO;

import java.sql.Date;

public class FreeboardDTO {
   
   private int     num;      /* 번호(PK)   NUM(PK) NUMBER          NOT NULL */
   private String  id;       /* 아이디(FK) ID(FK)  VARCHAR2(100)    NOT NULL */
   private String  title;    /* 제목       TITLE   VARCHAR2(200)    NOT NULL */
   private String  content;  /* 내용       CONTENT VARCHAR2(2000)   NOT NULL */
   private Date    regdate;  /* 날짜       REGDATE DATE             NOT NULL */
   
   public int getNum() {
      return num;
   }
   public void setNum(int num) {
      this.num = num;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public Date getRegdate() {
      return regdate;
   }
   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }
   
   @Override
   public String toString() {
      return "FreeboardDTO [num=" + num + ", id=" + id + ", title=" + title + ", content=" + content + ", regdate="
            + regdate + "]";
   }
}