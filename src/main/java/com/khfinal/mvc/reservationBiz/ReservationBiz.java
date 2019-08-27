package com.khfinal.mvc.reservationBiz;

import java.util.List;

import com.khfinal.mvc.reservation.dto.ReservationDto;

public interface ReservationBiz {

	public int reservationInsert(ReservationDto dto);
	
	public List<ReservationDto>reservationSelectList();
	
	
}
