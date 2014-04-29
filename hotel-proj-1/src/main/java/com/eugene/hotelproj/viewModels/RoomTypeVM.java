package com.eugene.hotelproj.viewModels;

public class RoomTypeVM {
	
	 private Long  roomTypeId;
	 private String name;
	private String imageName;
	private String roomTypeName;
	private String roomDescription;
	private String floor;
	private String rooms;
	private String beds;
	private String baths;
	private String price;
	
	public long getRoomTypeId() {
		return roomTypeId;
	}
	public void setRoomTypeId(long roomTypeId) {
		this.roomTypeId = roomTypeId;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getRoomTypeName() {
		return roomTypeName;
	}
	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}
	public String getRoomDescription() {
		return roomDescription;
	}
	public void setRoomDescription(String roomDescription) {
		this.roomDescription = roomDescription;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getRooms() {
		return rooms;
	}
	public void setRooms(String rooms) {
		this.rooms = rooms;
	}
	public String getBeds() {
		return beds;
	}
	public void setBeds(String beds) {
		this.beds = beds;
	}
	public String getBaths() {
		return baths;
	}
	public void setBaths(String bath) {
		this.baths = bath;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}


	public RoomTypeVM( Long  roomTypeId,String roomTypeName, String imageName, 
						String roomDescription, String floor, int rooms, int beds, 
						int baths, double price) {
		this.roomTypeId = roomTypeId;
		this.imageName = imageName;
		this.roomTypeName = roomTypeName;
		this.roomDescription = roomDescription;
		this.floor = floor;
		this.rooms = ""+rooms;
		this.beds = ""+beds;
		this.baths = ""+baths;
		this.price = ""+price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
