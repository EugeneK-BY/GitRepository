// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.models;

import com.eugene.hotelproj.models.HotelUser;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Version;

privileged aspect HotelUser_Roo_Jpa_Entity {
    
    declare @type: HotelUser: @Entity;
    
    @Version
    @Column(name = "version")
    private Integer HotelUser.version;
    
    public Integer HotelUser.getVersion() {
        return this.version;
    }
    
    public void HotelUser.setVersion(Integer version) {
        this.version = version;
    }
    
}
