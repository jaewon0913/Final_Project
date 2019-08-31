package com.khfinal.mvc.batch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.khfinal.mvc.MailController;
import com.khfinal.mvc.member.biz.MemberBiz;
import com.khfinal.mvc.member.dto.MemberDto;

@Component
public class Scheduler {
	
	@Autowired
	private MemberBiz memberbiz;

	@Scheduled(cron="0 30 10 * * *")
	public void cronTest1() {
		MailController mail = new MailController();
		
		System.out.println("스케쥴러 실행!!!!");
		List<MemberDto> list = memberbiz.pwChangedate();
		//list for문 돌리기
		for(int i = 0; i<list.size(); i++) {
			System.out.println(list.get(i).getMember_email());
			//list에서 해당 이메일에 메일보내기
			mail.pwChangedate(list.get(i).getMember_email());
		}
	}
	
	
}
