package kr.co.moojun.model.DTO;

import java.sql.Date;

public class MemberDTO {
	
	private String id;       /* 아이디(PK)  ID(PK)    VARCHAR2(100) NOT NULL */
	private int num;         /* 번호        NUM       NUMBER        NOT NULL */
	private String name;     /* 이름        NAME      VARCHAR2(100) NOT NULL */
	private String pwd;      /* 패스워드    PWD       VARCHAR2(200) NOT NULL */
	private String birth;    /* 생년월일    BIRTH     VARCHAR2(200) NOT NULL */
	private String sex;      /* 성별        SEX       VARCHAR2(100) NOT NULL */
	private String phone;    /* 전화번호    PHONE     VARCHAR2(100) NOT NULL */
	private String email;    /* 이메일      EMAIL     VARCHAR2(200) NOT NULL */
	private String panalty;  /* 벌점        PANALTY   VARCHAR2(100) NOT NULL */
	private Date joindate;   /* 가입날짜    JOINDATE  DATE          NOT NULL */
	private String enabled;  /* 사용여부    ENABLED   VARCHAR2(50)  NOT NULL */
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPanalty() {
		return panalty;
	}
	public void setPanalty(String panalty) {
		this.panalty = panalty;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", num=" + num + ", name=" + name + ", pwd=" + pwd + ", birth=" + birth
				+ ", sex=" + sex + ", phone=" + phone + ", email=" + email + ", panalty=" + panalty + ", joindate="
				+ joindate + "]";
	}
	
	
}
