package com.playerDB;

public class TransferObject {

	int id;
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	int fee;
	boolean loan;
	int playerid;
	String fromCountry;
	String toCountry;
	String fromClub;
	String toClub;
	
	
	
	public int getFee() {
		return fee;
	}



	public void setFee(int fee) {
		this.fee = fee;
		
	}



	public boolean isLoan() {
		if(this.fee == 0) {
			return true;
		}
		return false;
	}



	public void setLoan(boolean loan) {
		this.loan = loan;
	}



	public int getPlayerid() {
		return playerid;
	}



	public void setPlayerid(int playerid) {
		this.playerid = playerid;
	}



	public String getFromCountry() {
		return fromCountry;
	}



	public void setFromCountry(String fromCountry) {
		this.fromCountry = fromCountry;
	}



	public String getToCountry() {
		return toCountry;
	}



	public void setToCountry(String toCountry) {
		this.toCountry = toCountry;
	}



	public String getFromClub() {
		return fromClub;
	}



	public void setFromClub(String fromClub) {
		this.fromClub = fromClub;
	}



	public String getToClub() {
		return toClub;
	}



	public void setToClub(String toClub) {
		this.toClub = toClub;
	}



	public TransferObject() {
		// TODO Auto-generated constructor stub
	}

}
