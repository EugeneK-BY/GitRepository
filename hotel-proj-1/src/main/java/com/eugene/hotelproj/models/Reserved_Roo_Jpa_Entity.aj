// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.models;

import com.eugene.hotelproj.models.Reserved;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Version;

privileged aspect Reserved_Roo_Jpa_Entity {
    
    declare @type: Reserved: @Entity;
    
    @Version
    @Column(name = "version")
    private Integer Reserved.version;
    
    public Integer Reserved.getVersion() {
        return this.version;
    }
    
    public void Reserved.setVersion(Integer version) {
        this.version = version;
    }
    
}
