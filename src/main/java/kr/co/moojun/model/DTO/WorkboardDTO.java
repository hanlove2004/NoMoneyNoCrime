package kr.co.moojun.model.DTO;

import java.sql.Date;

public class WorkboardDTO {
   
   private int num;                /* 번호(PK)    NUM(PK)       NUMBER        NOT NULL */
   private String id;              /* 아이디(FK)  ID(FK)        VARCHAR2(100) NOT NULL */
   private String title;           /* 제목        TITLE         VARCHAR2(200) NOT NULL */
   private String compensate;      /* 보상        COMPENSATE    VARCHAR2(200) NOT NULL */
   private String needpeople;      /* 구인인원    NEEDPEOPLE    VARCHAR2(100) NOT NULL */
   private String phone;           /* 전화번호    PHONE         VARCHAR2(100) NOT NULL */
   private String content;         /* 내용        CONTENT       VARCHAR2(200) NOT NULL */
   private Date regdate;           /* 날짜        REGDATE       DATE          NOT NULL */
   private String state;           /* 진행현황    STATE         VARCHAR2(100) NOT NULL */
   private String regpeople;       /* 신청인원    REGPEOPLE     VARCHAR2(100) NOT NULL */
   private String addr;            /* 주소        ADDR          VARCHAR2(200) NOT NULL */
   private Date startdate;         /* 시작날짜    STARTDATE     DATE          NOT NULL */
   private Date enddate;           /* 완료날짜    ENDDATE       DATE          NOT NULL */
   private String expire;          /* 활성화      EXPIRE        VARCHAR2(20)  NOT NULL */
   
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
   public String getCompensate() {
      return compensate;
   }
   public void setCompensate(String compensate) {
      this.compensate = compensate;
   }
   public String getNeedpeople() {
      return needpeople;
   }
   public void setNeedpeople(String needpeople) {
      this.needpeople = needpeople;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
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
   public String getState() {
      return state;
   }
   public void setState(String state) {
      this.state = state;
   }
   public String getRegpeople() {
      return regpeople;
   }
   public void setRegpeople(String regpeople) {
      this.regpeople = regpeople;
   }
   public String getAddr() {
      return addr;
   }
   public void setAddr(String addr) {
      this.addr = addr;
   }
   public Date getStartdate() {
      return startdate;
   }
   public void setStartdate(Date startdate) {
      this.startdate = startdate;
   }
   public Date getEnddate() {
      return enddate;
   }
   public void setEnddate(Date enddate) {
      this.enddate = enddate;
   }
   public String getExpire() {
      return expire;
   }
   public void setExpire(String expire) {
      this.expire = expire;
   }
   
   @Override
   public String toString() {
      return "WorkboardDTO [num=" + num + ", id=" + id + ", title=" + title + ", compensate=" + compensate
            + ", needpeople=" + needpeople + ", phone=" + phone + ", content=" + content + ", regdate=" + regdate
            + ", state=" + state + ", regpeople=" + regpeople + ", addr=" + addr + ", startdate=" + startdate
            + ", enddate=" + enddate + ", expire=" + expire + "]";
   }
}