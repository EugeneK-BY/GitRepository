// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.models;

import com.eugene.hotelproj.models.Reserved;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Reserved_Roo_Jpa_Entity {
    
    declare @type: Reserved: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Reserved.id;
    
    @Version
    @Column(name = "version")
    private Integer Reserved.version;
    
    public Long Reserved.getId() {
        return this.id;
    }
    
    public void Reserved.setId(Long id) {
        this.id = id;
    }
    
    public Integer Reserved.getVersion() {
        return this.version;
    }
    
    public void Reserved.setVersion(Integer version) {
        this.version = version;
    }
    
}
