// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.models;

import com.eugene.hotelproj.models.RoomType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Version;

privileged aspect RoomType_Roo_Jpa_Entity {
    
    declare @type: RoomType: @Entity;
    
    @Version
    @Column(name = "version")
    private Integer RoomType.version;
    
    public RoomType.new() {
        super();
    }

    public Integer RoomType.getVersion() {
        return this.version;
    }
    
    public void RoomType.setVersion(Integer version) {
        this.version = version;
    }
    
}
