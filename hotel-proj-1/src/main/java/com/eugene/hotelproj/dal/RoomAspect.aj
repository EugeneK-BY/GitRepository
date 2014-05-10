package com.eugene.hotelproj.dal;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import com.eugene.hotelproj.models.Reservation;
import com.eugene.hotelproj.models.Room;
import com.eugene.hotelproj.models.RoomType;
import com.eugene.hotelproj.viewModels.ReservationVM;

public aspect RoomAspect {

	
	public static void Room.createRoom(int floor, int number, RoomType roomType){
		Room room = new Room();
		room.floor = floor;
		room.roomNumber =number;
		room.roomType = roomType;
		room.persist();
	}
	
	
	public static List<Room> Room.getListAvaliableRooms(ReservationVM reservationModel){
		
		List<Room> l =new ArrayList<Room>();
		
		TypedQuery<Room> q = Room.entityManager().createQuery("SELECT r "
															+ "FROM Room r, Reserved rv "
															+ "WHERE r.roomType.Beds=:Beds "
															+ "AND r.roomType.Rooms=:Rooms "
															+ "AND rv.room = r "
															+ "AND rv.dateIn=:dateIn "
															+ "AND rv.dateOut=:dateOut", Room.class);
		q.setParameter("Beds", reservationModel.getBeds());
		q.setParameter("Rooms", reservationModel.getRooms());
		q.setParameter("dateIn", reservationModel.getDateInD());
		q.setParameter("dateOut", reservationModel.getDateOutD());
		
		l=q.getResultList();
		
		return l;
	}
	
}
