package com.eugene.hotelproj.dal;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import com.eugene.hotelproj.models.Reservation;
import com.eugene.hotelproj.models.Reserved;
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
		
		
		TypedQuery<Long> q = Reserved.entityManager().createQuery("SELECT rv.room.id  FROM Reserved rv "
															+ "WHERE (rv.dateIn > :dateIn AND rv.dateIn < :dateOut ) "
															+ "   OR (rv.dateOut < :dateOut AND rv.dateOut > :dateIn) ", Long.class);
		q.setParameter("dateIn", reservationModel.getDateInD());
		q.setParameter("dateOut", reservationModel.getDateOutD());
		
		if(q.getResultList().size()>0){
			TypedQuery<Room> q1 = Room.entityManager().createQuery("SELECT r "
																+ "WHERE r.roomType.Beds=:Beds "
																+ "AND r.roomType.Rooms=:Rooms "
																+ "AND r.id not in (:listId) ",
																Room.class);
			q1.setParameter("Beds", reservationModel.getBeds());
			q1.setParameter("Rooms", reservationModel.getRooms());
			q1.setParameter("listId", q1.getResultList());
			l=q1.getResultList();
		}else{
			l=Room.findAllRooms();
		}
		
		return l;
	}
	
}
