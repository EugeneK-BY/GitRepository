package com.eugene.hotelproj.viewModels;

import java.util.Date;

import javax.validation.constraints.Future;

import org.hibernate.validator.constraints.Range;

public class ReservationVM {
	
	private String dateIn;
	private String dateOut;
	private int Beds;
	private int Rooms;
	
	
	public String getDateIn() {
		return dateIn;
	}
	@Future
	public void setDateIn(String dateIn) {
		this.dateIn = dateIn;
	}
	public String getDateOut() {
		return dateOut;
	}
	@Future
	public void setDateOut(String dateOut) {
		this.dateOut = dateOut;
	}
	@Range(min=1, max=4)
	public int getBeds() {
		return Beds;
	}
	public void setBeds(int beds) {
		Beds = beds;
	}
	@Range(min=1, max=4)
	public int getRooms() {
		return Rooms;
	}
	@Range(min=1, max=4)
	public void setRooms(int rooms) {
		Rooms = rooms;
	}
	public Date getDateInD() {
		// TODO Auto-generated method stub
		return new Date();
	}
	public Date getDateOutD() {
		// TODO Auto-generated method stub
		return new Date();
	}
	

}
