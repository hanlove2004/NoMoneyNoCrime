package kr.co.moojun.model.DTO;

import java.sql.Date;

public class WorkboardDTO {
	private int num;
	private String id;
	private String title;
	private String compensate;
	private String needpeople;
	private String content;
	private Date regdate;
	private String state;
	private String regpeople;
	private String addr;
	private Date expiredate;

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

	public Date getExpiredate() {
		return expiredate;
	}

	public void setExpiredate(Date expiredate) {
		this.expiredate = expiredate;
	}

}
