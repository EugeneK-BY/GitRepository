// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.models;

import com.eugene.hotelproj.models.RoomType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect RoomType_Roo_Jpa_Entity {
    
    declare @type: RoomType: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long RoomType.id;
    
    @Version
    @Column(name = "version")
    private Integer RoomType.version;
    
    public Long RoomType.getId() {
        return this.id;
    }
    
    public void RoomType.setId(Long id) {
        this.id = id;
    }
    
    public Integer RoomType.getVersion() {
        return this.version;
    }
    
    public void RoomType.setVersion(Integer version) {
        this.version = version;
    }
    
}