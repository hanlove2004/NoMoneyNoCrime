package kr.co.moojun.model.DTO;

import java.sql.Date;

public class Reply_FreeDTO {
   private int    num;     		 /* 번호(PK)       NUM(PK)   NUMBER        NOT NULL */
   private String    id;      	 /* 아이디         ID        VARCHAR2(100) NOT NULL */
   private String    content; 	 /* 내용           CONTENT   VARCHAR2(500) NOT NULL */
   private Date    regdate; 	 /* 날짜           REGDATE   DATE          NOT NULL */
   private int    idx;			 /* 인덱스(FK)     IDX(FK)   NUMBER        NOT NULL */

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

   public int getIdx() {
      return idx;
   }

   public void setIdx(int idx) {
      this.idx = idx;
   }

   @Override
   public String toString() {
      return "Reply_FreeDTO [num=" + num + ", id=" + id + ", content=" + content + ", regdate=" + regdate + ", idx="
            + idx + "]";
   }
}