package com.eugene.hotelproj.dal;

import javax.persistence.TypedQuery;

import com.eugene.hotelproj.models.HotelUser;
import com.eugene.hotelproj.models.UserProfile;
import com.eugene.hotelproj.models.UserRole;
import com.eugene.hotelproj.util.HotelUtil;

public aspect HotelUserAspect {
    

	
	public String HotelUser.toString() {
        return this.userProfile.firstName + " " +  this.userProfile.lastName ;
    }
	
	public static HotelUser HotelUser.getHotelUser(Long id) {
		HotelUser hu = null;
		TypedQuery<HotelUser> q = HotelUser.entityManager().createQuery("SELECT hu FROM HotelUser hu WHERE hu.id = :id", HotelUser.class);
		q.setParameter("id", id);
		if(!q.getResultList().isEmpty()){
			hu = q.getSingleResult();
		}
        return hu ;
    }
	
	public static void UserRole.createBaseRoles(){
		 UserRole.createRole("Пользователь", HotelUtil.USER_ROLE_USER);
		 UserRole.createRole("Администратор", HotelUtil.USER_ROLE_ADMIN);
		 UserRole.createRole("Менеджер", HotelUtil.USER_ROLE_MANAGER);
	}

	
	public static void UserRole.createRole(String name, String code){
		UserRole role = new UserRole();
		role.roleCode = code;
		role.roleName = name;
		role.persist();
	}
	
	
	public static void HotelUser.createDefaultUsers(){
		
		HotelUser user = new HotelUser();
		user.userName = "admin";
		user.password ="admin";
		user.userProfile = new UserProfile();
		user.userProfile.firstName = "Odmin";
		user.userProfile.lastName = "Odmin";
		user.userProfile.fatherName = "Odmin";
		user.userProfile.mail = "Odmin@Odmin.com";
		user.userRole = UserRole.getRoleByCode(HotelUtil.USER_ROLE_ADMIN);
		user.userProfile.persist();
		user.persist();
		user = new HotelUser();
		user.userName = "manager";
		user.password ="manager";
		user.userProfile = new UserProfile();
		user.userProfile.firstName = "Manager";
		user.userProfile.lastName = "Manager";
		user.userProfile.fatherName = "Manager";
		user.userProfile.mail = "Manager@Manager.com";
		user.userRole = UserRole.getRoleByCode(HotelUtil.USER_ROLE_MANAGER);
		user.userProfile.persist();
		user.persist();
		user = new HotelUser();
		user.userName = "user";
		user.password ="user";
		user.userProfile = new UserProfile();
		user.userProfile.firstName = "User";
		user.userProfile.lastName = "User";
		user.userProfile.fatherName = "User";
		user.userProfile.mail = "User@User.com";
		user.userRole = UserRole.getRoleByCode(HotelUtil.USER_ROLE_USER);
		user.userProfile.persist();
		user.persist();
		
	}
	
	
	
	public static UserRole UserRole.getRoleByCode(String code){
		
		UserRole role = null;
		TypedQuery<UserRole> q = UserRole.entityManager().createQuery("SELECT ur FROM UserRole ur WHERE ur.roleCode = :roleCode ", UserRole.class);
		q.setParameter("roleCode", code);
		
		if(!q.getResultList().isEmpty()){
			role = q.getSingleResult();
		}
		
		return role;
	}
	
	
	
	
}
