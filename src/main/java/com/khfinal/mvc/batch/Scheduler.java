package com.khfinal.mvc.batch;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {

	@Scheduled(cron="0 31 13 * * *")
	public void cronTest1() {
		System.out.println("스케쥴러 실행!!!!");
	}
}
