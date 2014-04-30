package com.eugene.hotelproj.models;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class UserRole {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long userRoleId;
	@NotEmpty
	public String roleName;
	@NotEmpty
	public String roleCode;
}
