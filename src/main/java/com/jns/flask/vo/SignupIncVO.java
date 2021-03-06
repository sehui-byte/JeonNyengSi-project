package com.jns.flask.vo;

import org.json.simple.JSONObject;

public class SignupIncVO 
{
	private String year;// 년
	private String mon;// 월
	private String inc;// 증가 수
	private String start_yyyymm;// 시작 yyyymm
	private String end_yyyymm;// 끝 yyyymm
	public SignupIncVO() 
	{

	}//Default Constructor
	
	
	
	public SignupIncVO(String year, String mon, String inc, String start_yyyymm, String end_yyyymm) {
		this.year = year;
		this.mon = mon;
		this.inc = inc;
		this.start_yyyymm = start_yyyymm;
		this.end_yyyymm = end_yyyymm;
	}


	
	public String getYear() {
		return year;
	}



	public String getMon() {
		return mon;
	}



	public String getInc() {
		return inc;
	}



	public String getStart_yyyymm() {
		return start_yyyymm;
	}



	public String getEnd_yyyymm() {
		return end_yyyymm;
	}



	public void setYear(String year) {
		this.year = year;
	}



	public void setMon(String mon) {
		this.mon = mon;
	}



	public void setInc(String inc) {
		this.inc = inc;
	}



	public void setStart_yyyymm(String start_yyyymm) {
		this.start_yyyymm = start_yyyymm;
	}



	public void setEnd_yyyymm(String end_yyyymm) {
		this.end_yyyymm = end_yyyymm;
	}



	@Override
	public String toString() {
		return "SignupIncVO [year=" + year + ", mon=" + mon + ", inc=" + inc + ", start_yyyymm=" + start_yyyymm
				+ ", end_yyyymm=" + end_yyyymm + "]";
	}



	@SuppressWarnings("unchecked")
	public JSONObject toJSONObject()
	{
		JSONObject json = new JSONObject();
		json.put("year", Integer.parseInt(year));
		json.put("mon", Integer.parseInt(mon));
		json.put("inc", Integer.parseInt(inc));
		
		return json;
	}
}
