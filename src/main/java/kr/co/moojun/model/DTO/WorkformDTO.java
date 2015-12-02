package kr.co.moojun.model.DTO;

public class WorkformDTO {
   private int     num;        /* 번호(FK) NUM(FK)   NUMBER          NOT NULL */
   private String  owner;      /* 구인자      OWNER     VARCHAR2(100)   NOT NULL */
   private String  worker;     /* 구직자      WORKER    VARCHAR2(100)   NOT NULL */
   private String  name;       /* 이름        NAME      VARCHAR2(100)   NOT NULL */
   private String  age;        /* 나이        AGE       VARCHAR2(100)   NOT NULL */
   private String  introduce;  /* 자기소개    INTRODUCE VARCHAR2(500)   NOT NULL */

   public int getNum() {
      return num;
   }

   public void setNum(int num) {
      this.num = num;
   }

   public String getOwner() {
      return owner;
   }

   public void setOwner(String owner) {
      this.owner = owner;
   }

   public String getWorker() {
      return worker;
   }

   public void setWorker(String worker) {
      this.worker = worker;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getAge() {
      return age;
   }

   public void setAge(String age) {
      this.age = age;
   }

   public String getIntroduce() {
      return introduce;
   }

   public void setIntroduce(String introduce) {
      this.introduce = introduce;
   }

   @Override
   public String toString() {
      return "WorkformDTO [num=" + num + ", owner=" + owner + ", worker=" + worker + ", name=" + name + ", age=" + age
            + ", introduce=" + introduce + "]";
   }
}