package com.hs.myapp;

public class FBBean {
	int idx;
	String title;
	String contents;
	String userId;
	String rDate;
	int hit;

	public FBBean() {
	}

	public FBBean(String userId, String title, String contents) {
		this.userId = userId;
		this.title = title;
		this.contents = contents;
	}
	
	public FBBean(int idx, String title, String userId, String rDate, int hit) {
		this.idx = idx;
		this.title = title;
		this.userId = userId;
		this.rDate = rDate;
		this.hit = hit;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
}
