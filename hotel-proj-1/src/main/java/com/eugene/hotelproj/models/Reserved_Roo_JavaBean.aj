// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.models;

import com.eugene.hotelproj.models.Reserved;
import com.eugene.hotelproj.models.Room;
import java.util.Date;

privileged aspect Reserved_Roo_JavaBean {
    
    public Long Reserved.getId() {
        return this.id;
    }
    
    public void Reserved.setId(Long id) {
        this.id = id;
    }
    
    public Date Reserved.getDateIn() {
        return this.dateIn;
    }
    
    public void Reserved.setDateIn(Date dateIn) {
        this.dateIn = dateIn;
    }
    
    public Date Reserved.getDateOut() {
        return this.dateOut;
    }
    
    public void Reserved.setDateOut(Date dateOut) {
        this.dateOut = dateOut;
    }
    
    public Room Reserved.getRoom() {
        return this.room;
    }
    
    public void Reserved.setRoom(Room room) {
        this.room = room;
    }
    
}