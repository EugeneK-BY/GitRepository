// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.controllers;

import com.eugene.hotelproj.controllers.ApplicationConversionServiceFactoryBean;
import com.eugene.hotelproj.models.HotelUser;
import com.eugene.hotelproj.models.Reservation;
import com.eugene.hotelproj.models.Reserved;
import com.eugene.hotelproj.models.Room;
import com.eugene.hotelproj.models.RoomType;
import com.eugene.hotelproj.models.Testimonials;
import com.eugene.hotelproj.models.UserProfile;
import com.eugene.hotelproj.models.UserRole;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<HotelUser, String> ApplicationConversionServiceFactoryBean.getHotelUserToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.eugene.hotelproj.models.HotelUser, java.lang.String>() {
            public String convert(HotelUser hotelUser) {
                return new StringBuilder().append(hotelUser.getUserName()).append(' ').append(hotelUser.getPassword()).toString();
            }
        };
    }
    
    public Converter<Long, HotelUser> ApplicationConversionServiceFactoryBean.getIdToHotelUserConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.eugene.hotelproj.models.HotelUser>() {
            public com.eugene.hotelproj.models.HotelUser convert(java.lang.Long id) {
                return HotelUser.findHotelUser(id);
            }
        };
    }
    
    public Converter<String, HotelUser> ApplicationConversionServiceFactoryBean.getStringToHotelUserConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.eugene.hotelproj.models.HotelUser>() {
            public com.eugene.hotelproj.models.HotelUser convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), HotelUser.class);
            }
        };
    }
    
    public Converter<Reservation, String> ApplicationConversionServiceFactoryBean.getReservationToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.eugene.hotelproj.models.Reservation, java.lang.String>() {
            public String convert(Reservation reservation) {
                return new StringBuilder().append(reservation.getDateIn()).append(' ').append(reservation.getDateOut()).toString();
            }
        };
    }
    
    public Converter<Long, Reservation> ApplicationConversionServiceFactoryBean.getIdToReservationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.eugene.hotelproj.models.Reservation>() {
            public com.eugene.hotelproj.models.Reservation convert(java.lang.Long id) {
                return Reservation.findReservation(id);
            }
        };
    }
    
    public Converter<String, Reservation> ApplicationConversionServiceFactoryBean.getStringToReservationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.eugene.hotelproj.models.Reservation>() {
            public com.eugene.hotelproj.models.Reservation convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Reservation.class);
            }
        };
    }
    
    public Converter<Reserved, String> ApplicationConversionServiceFactoryBean.getReservedToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.eugene.hotelproj.models.Reserved, java.lang.String>() {
            public String convert(Reserved reserved) {
                return new StringBuilder().append(reserved.getDateIn()).append(' ').append(reserved.getDateOut()).toString();
            }
        };
    }
    
    public Converter<Long, Reserved> ApplicationConversionServiceFactoryBean.getIdToReservedConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.eugene.hotelproj.models.Reserved>() {
            public com.eugene.hotelproj.models.Reserved convert(java.lang.Long id) {
                return Reserved.findReserved(id);
            }
        };
    }
    
    public Converter<String, Reserved> ApplicationConversionServiceFactoryBean.getStringToReservedConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.eugene.hotelproj.models.Reserved>() {
            public com.eugene.hotelproj.models.Reserved convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Reserved.class);
            }
        };
    }
    
    public Converter<Room, String> ApplicationConversionServiceFactoryBean.getRoomToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.eugene.hotelproj.models.Room, java.lang.String>() {
            public String convert(Room room) {
                return new StringBuilder().append(room.getRoomNumber()).append(' ').append(room.getFloor()).toString();
            }
        };
    }
    
    public Converter<Long, Room> ApplicationConversionServiceFactoryBean.getIdToRoomConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.eugene.hotelproj.models.Room>() {
            public com.eugene.hotelproj.models.Room convert(java.lang.Long id) {
                return Room.findRoom(id);
            }
        };
    }
    
    public Converter<String, Room> ApplicationConversionServiceFactoryBean.getStringToRoomConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.eugene.hotelproj.models.Room>() {
            public com.eugene.hotelproj.models.Room convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Room.class);
            }
        };
    }
    
    public Converter<RoomType, String> ApplicationConversionServiceFactoryBean.getRoomTypeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.eugene.hotelproj.models.RoomType, java.lang.String>() {
            public String convert(RoomType roomType) {
                return new StringBuilder().append(roomType.getName()).append(' ').append(roomType.getDescription()).append(' ').append(roomType.getRooms()).append(' ').append(roomType.getBeds()).toString();
            }
        };
    }
    
    public Converter<Long, RoomType> ApplicationConversionServiceFactoryBean.getIdToRoomTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.eugene.hotelproj.models.RoomType>() {
            public com.eugene.hotelproj.models.RoomType convert(java.lang.Long id) {
                return RoomType.findRoomType(id);
            }
        };
    }
    
    public Converter<String, RoomType> ApplicationConversionServiceFactoryBean.getStringToRoomTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.eugene.hotelproj.models.RoomType>() {
            public com.eugene.hotelproj.models.RoomType convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), RoomType.class);
            }
        };
    }
    
    public Converter<Testimonials, String> ApplicationConversionServiceFactoryBean.getTestimonialsToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.eugene.hotelproj.models.Testimonials, java.lang.String>() {
            public String convert(Testimonials testimonials) {
                return new StringBuilder().append(testimonials.getDate()).append(' ').append(testimonials.getTestimonialsText()).toString();
            }
        };
    }
    
    public Converter<Long, Testimonials> ApplicationConversionServiceFactoryBean.getIdToTestimonialsConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.eugene.hotelproj.models.Testimonials>() {
            public com.eugene.hotelproj.models.Testimonials convert(java.lang.Long id) {
                return Testimonials.findTestimonials(id);
            }
        };
    }
    
    public Converter<String, Testimonials> ApplicationConversionServiceFactoryBean.getStringToTestimonialsConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.eugene.hotelproj.models.Testimonials>() {
            public com.eugene.hotelproj.models.Testimonials convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Testimonials.class);
            }
        };
    }
    
    public Converter<UserProfile, String> ApplicationConversionServiceFactoryBean.getUserProfileToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.eugene.hotelproj.models.UserProfile, java.lang.String>() {
            public String convert(UserProfile userProfile) {
                return new StringBuilder().append(userProfile.getFirstName()).append(' ').append(userProfile.getLastName()).append(' ').append(userProfile.getFatherName()).append(' ').append(userProfile.getPhoneNumber()).toString();
            }
        };
    }
    
    public Converter<Long, UserProfile> ApplicationConversionServiceFactoryBean.getIdToUserProfileConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.eugene.hotelproj.models.UserProfile>() {
            public com.eugene.hotelproj.models.UserProfile convert(java.lang.Long id) {
                return UserProfile.findUserProfile(id);
            }
        };
    }
    
    public Converter<String, UserProfile> ApplicationConversionServiceFactoryBean.getStringToUserProfileConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.eugene.hotelproj.models.UserProfile>() {
            public com.eugene.hotelproj.models.UserProfile convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), UserProfile.class);
            }
        };
    }
    
    public Converter<UserRole, String> ApplicationConversionServiceFactoryBean.getUserRoleToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.eugene.hotelproj.models.UserRole, java.lang.String>() {
            public String convert(UserRole userRole) {
                return new StringBuilder().append(userRole.getRoleName()).append(' ').append(userRole.getRoleCode()).toString();
            }
        };
    }
    
    public Converter<Long, UserRole> ApplicationConversionServiceFactoryBean.getIdToUserRoleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.eugene.hotelproj.models.UserRole>() {
            public com.eugene.hotelproj.models.UserRole convert(java.lang.Long id) {
                return UserRole.findUserRole(id);
            }
        };
    }
    
    public Converter<String, UserRole> ApplicationConversionServiceFactoryBean.getStringToUserRoleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.eugene.hotelproj.models.UserRole>() {
            public com.eugene.hotelproj.models.UserRole convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), UserRole.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getHotelUserToStringConverter());
        registry.addConverter(getIdToHotelUserConverter());
        registry.addConverter(getStringToHotelUserConverter());
        registry.addConverter(getReservationToStringConverter());
        registry.addConverter(getIdToReservationConverter());
        registry.addConverter(getStringToReservationConverter());
        registry.addConverter(getReservedToStringConverter());
        registry.addConverter(getIdToReservedConverter());
        registry.addConverter(getStringToReservedConverter());
        registry.addConverter(getRoomToStringConverter());
        registry.addConverter(getIdToRoomConverter());
        registry.addConverter(getStringToRoomConverter());
        registry.addConverter(getRoomTypeToStringConverter());
        registry.addConverter(getIdToRoomTypeConverter());
        registry.addConverter(getStringToRoomTypeConverter());
        registry.addConverter(getTestimonialsToStringConverter());
        registry.addConverter(getIdToTestimonialsConverter());
        registry.addConverter(getStringToTestimonialsConverter());
        registry.addConverter(getUserProfileToStringConverter());
        registry.addConverter(getIdToUserProfileConverter());
        registry.addConverter(getStringToUserProfileConverter());
        registry.addConverter(getUserRoleToStringConverter());
        registry.addConverter(getIdToUserRoleConverter());
        registry.addConverter(getStringToUserRoleConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
