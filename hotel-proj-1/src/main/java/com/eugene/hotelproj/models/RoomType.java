package com.eugene.hotelproj.models;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class RoomType {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long id;
	
	@NotEmpty
	public String name;
	
	@Column(name="description", columnDefinition="TEXT")
	public String description;
	
	public boolean airConditioning;
	
	public boolean fringe; 
	
	@Range(min=1, max=1000)
	public int Rooms;
	
	@Range(min=1, max=4)
	public int Beds;
	
	@Range(min=1, max=3)
	public int Baths;
	
	public String image; 
	
	@Range(min=0)
	public double price;

	
	private RoomType(RoomTypeBuilder roomTypeBuilder){

		this.name = roomTypeBuilder.name ;
		this.description = roomTypeBuilder.description ;
		this.airConditioning = roomTypeBuilder.airConditioning;
		this.fringe = roomTypeBuilder.fringe; 
		this.Rooms = roomTypeBuilder.Rooms;
		this.Beds = roomTypeBuilder.Beds;
		this.Baths = roomTypeBuilder.Baths;
		this.image = roomTypeBuilder.image; 
		this.price = roomTypeBuilder.price;
	}
	
	public static class RoomTypeBuilder{
		
		@NotEmpty
		private String name;
		
		private String description;
		
		private boolean airConditioning;
		
		private boolean fringe; 
		
		@Range(min=1, max=1000)
		private int Rooms;
		
		@Range(min=1, max=4)
		private int Beds;
		
		@Range(min=1, max=3)
		private int Baths;
		
		private String image; 
		
		@Range(min=0)
		private double price;
		
		
		public RoomTypeBuilder(String name, double price) {
			this.name = name;
			this.price = price;
		}
		public RoomTypeBuilder description(String description){
			this.description = description;
			return this;
		}
		public RoomTypeBuilder airConditioning(boolean airConditioning){
			this.airConditioning = airConditioning;
			return this;
		}
		public RoomTypeBuilder fringe(boolean fringe){
			this.fringe = fringe;
			return this;
		}
		public RoomTypeBuilder rooms(int Rooms){
			this.Rooms = Rooms;
			return this;
		}
		public RoomTypeBuilder beds(int Beds){
			this.Beds = Beds;
			return this;
		}
		public RoomTypeBuilder baths(int Baths){
			this.Baths = Baths;
			return this;
		}
		public RoomTypeBuilder image(String image){
			this.image = image;
			return this;
		}
		public RoomTypeBuilder price(double price){
			this.price = price;
			return this;
		}

		public RoomType build(){
			return new RoomType(this);
		}
		
	}
}
