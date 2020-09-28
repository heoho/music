package com.hs.myapp;

public class MemberBean {
	int idx;
	String id;
	String pw;
	String name;
	int day;
	String calendar;
	String gen;
	String email1;
	String email2;
	int tel;
	int lv;

	public MemberBean() {
	}

	// insert
	public MemberBean(String id, String pw, String name, int day, String calendar, String gen, String email1, String email2, int tel) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.day = day;
		this.calendar = calendar;
		this.gen = gen;
		this.email1 = email1;
		this.email2 = email2;
		this.tel = tel;
	}

	// select
	public MemberBean(int idx, String id, String pw, String name, int day, String calendar, String gen, String email1,
			int tel, int lv) {
		this.idx = idx;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.day = day;
		this.calendar = calendar;
		this.gen = gen;
		this.email1 = email1;
		this.tel = tel;
		this.lv = lv;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getCalendar() {
		return calendar;
	}

	public void setCalendar(String calendar) {
		this.calendar = calendar;
	}

	public String getGen() {
		return gen;
	}

	public void setGen(String gen) {
		this.gen = gen;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public int getTel() {
		return tel;
	}

	public void setTel(int tel) {
		this.tel = tel;
	}

	public int getLv() {
		return lv;
	}

	public void setLv(int lv) {
		this.lv = lv;
	}

}
