package kr.co.moojun.model.DTO;

import java.sql.Date;

public class MessageDTO {
	private int num;
	private String sender;
	private String receiver;
	private String content;
	private Date regdate;
	private int sddelete;
	private int rvdelete;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
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

	public int getSddelete() {
		return sddelete;
	}

	public void setSddelete(int sddelete) {
		this.sddelete = sddelete;
	}

	public int getRvdelete() {
		return rvdelete;
	}

	public void setRvdelete(int rvdelete) {
		this.rvdelete = rvdelete;
	}

}
