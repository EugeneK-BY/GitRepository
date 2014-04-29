package com.eugene.hotelproj.dal;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

import com.eugene.hotelproj.models.RoomType;
import com.eugene.hotelproj.viewModels.RoomTypeVM;

public aspect RoomTypeAspect {

	public static List<RoomTypeVM> RoomType.getListOfRoomTypes(){
		
		TypedQuery<RoomTypeVM> q = RoomType.entityManager().createQuery("SELECT new com.eugene.hotelproj.viewModels.RoomTypeVM(rt.id, rt.name , rt.image , rt.description, '1-5', rt.Rooms, rt.Beds, rt.Baths, rt.price )  "
				+ "FROM RoomType rt "
				+ "GROUP BY rt.name ", RoomTypeVM.class);
		
		List<RoomTypeVM> list = null;
		if(!q.getResultList().isEmpty()){
			list = q.getResultList();
		}
		return list;
		
	}
	
	
	public static void RoomType.createBaseRoomTypes(){
		
		if(RoomType.countRoomTypes()<1){
		RoomType rt = new RoomType.RoomTypeBuilder("Бизнес стандарт single", 120.0)
				.description("Мы рады предложить своим гостям однокомнатные номера, оформленные в современном стиле и оснащённые всем необходимым для комфортного проживания. В номере большая кровать, удобный рабочий стол, кондиционер и мини-бар. К Вашим услугам: кондиционер, мини-бар,телевизор, телефон,халаты, душ ,фен, бесплатный Wi-Fi")
				.airConditioning(true)
				.fringe(true)
				.rooms(1)
				.beds(1)
				.baths(1)
				.image("base_single.JPG")
				.build();
		rt.persist();
		
		rt = new RoomType.RoomTypeBuilder("Бизнес стандарт double", 135.0)
			.description("Номера данной категории идеально подойдут для деловых людей и туристов, которым важно соотношение цена-качество. К Вашим услугам: кондиционер, мини-бар, Спутниковое TV, телефон, душ ,фен, бесплатный Wi-Fi")
			.airConditioning(true)
			.fringe(true)
			.rooms(1)
			.beds(1)
			.baths(1)
			.image("base_double.JPG")
			.build();
		rt.persist();
	
	
		rt = new RoomType.RoomTypeBuilder("Бизнес стандарт twin", 125.0)
			.description("В номерах категории «Бизнес стандарт» - одна кровать (при двухместном размещении две), рабочий стол, телевизор с плоским экраном, телефон, мини-бар и кондиционер. Эта категория номеров идеально подходит для людей, ценящих комфорт и удобство, а также предпочитающих всегда иметь под рукой всё самое необходимое. К Вашим услугам: кондиционер (частично), мини-бар (частично), Спутниковое TV, телефон, душ, фен, бесплатный Wi-Fi.")
			.airConditioning(true)
			.fringe(true)
			.rooms(1)
			.beds(1)
			.baths(1)
			.image("base_twin.JPG")
			.build();
		rt.persist();
		
		}
	}

	
}
