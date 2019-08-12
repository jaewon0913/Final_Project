package com.khfinal.mvc;

import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	public EchoHandler() {
		System.out.println("웹 소켓(서버) 생성");
	}
	
	// 웹소켓 서버에 클라이언트가 접속하면 호출되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {		
		sessionList.add(session);
		logger.info("{} 연결됨", session.getId());
		
		if(session.getPrincipal() == null) {
			System.out.println(session.getId());
		} else {
			System.out.println("채팅방 입장자: " + session.getPrincipal().getName());
		}
	}

	// 클라이언트가 접속을 종료하면 호출되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} 연결 끊김",session.getId());

	}
	
	// 여기가 메시지 오는 곳???
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		logger.info("{}로 부터 {} 메시지 받음", session.getId(), message.getPayload());
		
		for(WebSocketSession sess : sessionList) {
			if(session.getPrincipal() == null ) {
				//	로그인이 안된 상대가 보냈을 경우
				sess.sendMessage(new TextMessage(session.getId()+"|"+ session.getId() +"|"+ message.getPayload()));
			} else {
				//	로그인이 된 상대가 보냈을 경우
				if(session.getPrincipal().getName().equals("admin")) {
					//	만약 보낸 사람이 admin인 경우
					String[] splitMsg = message.getPayload().split("//");
					if(splitMsg[0].equals(sess.getId())) {
						sess.sendMessage(new TextMessage(session.getPrincipal().getName() + "|admin|" + splitMsg[1]));
					} else if(sess.getPrincipal().getName().equals("admin")){
						System.out.println("admin이 보낸게 admin에게로");
						sess.sendMessage(new TextMessage(session.getPrincipal().getName() + "|admin|" + message.getPayload()));
					}
				} else {
					//	만약 보낸 사람이 admin이 아닌 경우
					sess.sendMessage(new TextMessage(session.getPrincipal().getName() + "|" + session.getId() + "|" + message.getPayload()));
				}
			}
		}
	}

	// 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		super.handleTransportError(session, exception);
		System.out.println("전송오류 발생");
	}
}
