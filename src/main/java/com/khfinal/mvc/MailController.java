package com.khfinal.mvc;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khfinal.mvc.member.biz.MemberBiz;

@Controller
public class MailController {
	
	@Autowired
	private MemberBiz memberbiz;
	
	private static final Logger logger = LoggerFactory.getLogger(MailController.class);
 

	@RequestMapping("/mailSend.do")
    @ResponseBody
    public Map<String, Boolean> sendMail(String member_email,HttpServletRequest request, HttpServletResponse response) {
    	Boolean emailnotused = false;
    	Map<String, Boolean> map = new HashMap<String, Boolean>();
    	emailnotused = memberbiz.emailChk(member_email);
    	if(emailnotused == false) {
    		map.put("emailnotused", emailnotused);
    		
    	}else if(emailnotused == true) {
    	
	    	//mail server 설정
	        String host = "smtp.naver.com";
	        String user = "asdaldh"; //자신의 네이버 계정
	        String password = "gmltn0911";//자신의 네이버 패스워드
	        
	        //메일 받을 주소
	        String to_email = member_email;
	        
	        //SMTP 서버 정보를 설정한다.
	        Properties props = new Properties();
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.port", 465);
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.ssl.enable", "true");
	        
	        //인증 번호 생성기
	        StringBuffer temp =new StringBuffer();
	        Random rnd = new Random();
	        for(int i=0;i<10;i++)
	        {
	            int rIndex = rnd.nextInt(3);
	            switch (rIndex) {
	            case 0:
	                // a-z
	                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
	                break;
	            case 1:
	                // A-Z
	                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
	                break;
	            case 2:
	                // 0-9
	                temp.append((rnd.nextInt(10)));
	                break;
	            }
	        }
	        String AuthenticationKey = temp.toString();
	        System.out.println(AuthenticationKey);
	        
	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user,password);
	            }
	        });
	        
	        //email 전송
	        try {
	            MimeMessage msg = new MimeMessage(session);
	            msg.setFrom(new InternetAddress(user, "너도나도"));
	            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
	            
	            //메일 제목
	            msg.setSubject("희수의 mail TEST (title)");
	            //메일 내용
	            msg.setText("인증 번호는 :"+temp);
	            
	            Transport.send(msg);
	            System.out.println("이메일 전송");
	            
	        }catch (Exception e) {
	            e.printStackTrace();// TODO: handle exception
	        }
	        HttpSession saveKey = request.getSession();
	        saveKey.setAttribute("AuthenticationKey", AuthenticationKey);//세션에 인증번호 저장
	        
	    	map.put("emailnotused", emailnotused);
    	}
    	return map;
    }
    
    @RequestMapping("/mailChk.do")
    @ResponseBody
    public Map<String, Boolean> chkMail(String emailtext,HttpSession saveKey){
    	Boolean emailchk_res = false;
    	Map<String, Boolean> map = new HashMap<String, Boolean>();
    	String AuthenticationKey = (String)saveKey.getAttribute("AuthenticationKey");
    	
    	if(AuthenticationKey.equals(emailtext)) {
    		emailchk_res = true;
    		map.put("emailchk_res", emailchk_res);
    	}else {
    		map.put("emailchk_res", emailchk_res);
    	}
    	return map;
    }
	 
}
