package com.eugene.hotelproj.dal;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.eugene.hotelproj.models.HotelUser;

public aspect HotelUserAspect {
    
	public String HotelUser.toString() {
        return this.userProfile.firstName + " " +  this.userProfile.lastName ;
    }

}
