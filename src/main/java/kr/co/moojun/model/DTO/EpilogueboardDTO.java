package kr.co.moojun.model.DTO;

import java.sql.Date;

public class EpilogueboardDTO {
	
	private int num;
	private String id;
	private String title;
	private String content;
	private Date regdate;
	private String photoname1;
	private String photoname2;
	private String photoname3;

	
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
	public String getPhotoname1() {
		return photoname1;
	}
	public void setPhotoname1(String photoname1) {
		this.photoname1 = photoname1;
	}
	public String getPhotoname2() {
		return photoname2;
	}
	public void setPhotoname2(String photoname2) {
		this.photoname2 = photoname2;
	}
	public String getPhotoname3() {
		return photoname3;
	}
	public void setPhotoname3(String photoname3) {
		this.photoname3 = photoname3;
	}
	
	
}
