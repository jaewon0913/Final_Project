<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#chat_box {
	   width: 800px;
	   min-width: 800px;
	   height: 500px;
	   min-height: 500px;
	   border: 1px solid black;
	}
	
	#msg {
	   width: 700px;
	}
	
	#msg_process {
	   width: 90px;
	}
</style>
</head>
  
<body>
   <div id="chat_box" style="overflow: auto; text-align: center;"></div>
   <input type="text" id="msg">
   <button id="msg_process" style="background-color: pink; color: black;">전송</button>

   <script src="http://192.168.110.14:8880/socket.io/socket.io.js"></script>
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script>
      
      $(document).ready(function() {
         $("#chat_box").scrollTop($("#chat_box")[0].scrollHeight);
         var socket = io("http://192.168.110.62:8880");	// your comput ip
         let id = "123";//${login.member_id};
         //msg에서 키를 누를떄
         $("#msg").keydown(function(key) {
            //해당하는 키가 엔터키(13) 일떄
            if (key.keyCode == 13) {
               //msg_process를 클릭해준다.
               msg_process.click();
            }
         });

         //msg_process를 클릭할 때
         $("#msg_process").click(function() {
            //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
            socket.emit("send_msg", $("#msg").val());
            //#msg에 벨류값을 비워준다.
            $("#msg").val("");
         });
         //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
         socket.on('send_msg', function(msg) {
            //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
            $('<div></div>').text(id+":"+msg).appendTo("#chat_box");
         });

      });
   </script>
</body>
</html>
