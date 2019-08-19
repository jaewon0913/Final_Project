package com.khfinal.mvc;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.khfinal.mvc.etc.biz.UploadBiz;
import com.khfinal.mvc.etc.util.FileValidator;
import com.khfinal.mvc.etc.util.UploadFile;
import com.khfinal.mvc.member.biz.MemberBiz;
import com.khfinal.mvc.member.dto.MemberDto;

@Controller
public class UploadController implements ServletContextAware {
	
	private ServletContext servletContext;
	
	@Autowired
	private UploadBiz biz;
	
	@Autowired
	private FileValidator fileValidator;
	
	@RequestMapping("/uploadtest.do")
	   public String cloudUpload(MultipartHttpServletRequest mtfRequest,UploadFile uploaddto) {
	      mtfRequest.getContextPath();
	      System.out.println("아예안오니");
	      List<MultipartFile> fileList = mtfRequest.getFiles("file");
	      String path = "./testFolder";
	      File dir = new File(path); 
	      if (!dir.isDirectory()) { 
	         dir.mkdirs(); 
	         }      
	      for (MultipartFile mf : fileList) {
	         String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	         long fileSize = mf.getSize(); // 파일 사이즈
	         String content=path+originFileName;
	        // dto.setContent(content);
	         System.out.println(content);
	         System.out.println("originFileName : " + originFileName);
	         System.out.println("fileSize : " + fileSize);
	         String safeFile = path + System.currentTimeMillis() + originFileName;
	         System.out.println(safeFile);
	         int res=0;
	         try {
	            mf.transferTo(new File(safeFile));
	            if(mf==fileList.get(0)) {
	              // res=cloudBiz.insert(dto);
	            }else {
	               //res=cloudBiz.nextInsert(dto);
	            }
	            
	            if(res>0) {
	               System.out.println("성공");
	            }else {
	               System.out.println("실패");
	            }   
	         } catch (IllegalStateException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	      }

	      return "redirect:home.do";
	   }
	
	
	
	

	//	2. form을 받아서 uploadForm.jsp 로 페이지 이동하라
	@RequestMapping("/dishinsert_form.do")
	public String dishinsert_form() {
				
		//	3. uploadForm.jsp 이동
		return "custom/DishInsertForm";
	}

	@RequestMapping("/changeDish.do")
	@ResponseBody
	public Map<String, Object> changedish(String dishname, Model model) {
		String name = null;
		
		if(dishname.equals("meal")) {
			name = "고기류";
		} else if(dishname.equals("rice")){
			name = "쌀밥류";
		} else if(dishname.equals("salad")) {
			name = "샐러드류";
		} else if(dishname.equals("sidedish")) {
			name = "반찬류";
		}
		
		List<UploadFile> list = new ArrayList<UploadFile>();
		
		list = biz.selectList(name);
		
		model.addAttribute("list",list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
	
		return map;
	}
	
	//	6. uploadForm.jsp 에서 submit을 눌렀을 경우 실행
	@RequestMapping(value="/upload.do")
	public String fileUpload(HttpServletRequest request, Model model, UploadFile uploadFile, BindingResult result) {
		//	BindingResult : uploadForm.jsp 에서 modelAttribute 를 이용해 매개변수를 Bean에 binding 할 때 발생한 오류 정보를 받는다.
		
		//	7.	업로드 파일 데이터 저장 (FileValidator.java 로 이동)
		//	발생하는 errors의 정보를 받기 위해 사용
		fileValidator.validate(uploadFile, result);
		
		//	7-4. validate method 실행 후 errors에 메시지가 존재 할 경우 다시 uploadForm.jsp로 이동 후 에러 메시지 출력
		if(result.hasErrors()) {
			return "error.do";
		}
		
		//	8. dto에서 각 데이터들 불러와서 저장
		MultipartFile file = uploadFile.getFile();
		String filename = file.getOriginalFilename();
		
		//	9. 새로운 UploadFile.class 생성 후 위에서 저장시킨 데이터 다시 저장
		
		System.out.println("dish_tan : " + uploadFile.getDish_tan());
		
		UploadFile fileobj = new UploadFile();
		fileobj.setFile_name(filename);
		fileobj.setDish_name(uploadFile.getDish_name());
		fileobj.setDish_tan(uploadFile.getDish_tan());
		fileobj.setDish_dan(uploadFile.getDish_dan());
		fileobj.setDish_zi(uploadFile.getDish_zi());
		fileobj.setDish_amount(uploadFile.getDish_amount());
		fileobj.setDish_cal(uploadFile.getDish_cal());
		fileobj.setDish_kind(uploadFile.getDish_kind());
		
		
		//	10. input / output 호출
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		
		try {
			//	11. request.getSession().getServletContext()에서 /storage 폴더 까지 경로 저장
			inputStream = file.getInputStream();
//			String path = servletContext.getRealPath("/resources");
//			fileobj.setFile_path(path + "/" + filename);
//			System.out.println("업로드 될 실제 경로 : " + path);
//			System.out.println("업로드 될 경로 + 이름 :" + fileobj.getFile_path());
			
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/etc/upload");
			
			System.out.println("업로드 될 실제 경로 : " + path);
			System.out.println("servletcontext : " + servletContext.getRealPath("resources/etc/upload"));
			fileobj.setFile_path(path + "/" + filename);
			
			// 업로드 경로 테스트중
//			String testPath = request.getSession().getServletContext().getRealPath("/resources/etc/uploadImage");
//			fileobj.setFile_path(testPath + "/" + filename);
//			System.out.println(servletContext.getRealPath("/"));
//			System.out.println("이게 경로 ? : " + request.getSession().getServletContext().getResourcePaths("/resources/etc/uploadImage"));
//			System.out.println("경로 테스트 : " + request.getSession().getServletContext().getRealPath("/resources"));
//			System.out.println("업로드 될 실제 경로 : " + testPath);
//			System.out.println("업로드 될 경로 + 이름 :" + fileobj.getFile_path());
			
			// /mvc/resources...
//			System.out.println(request.getSession().getServletContext());
//			System.out.println(request.getSession());
//			System.out.println("테스트~ : " + testPath.substring(1, testPath.indexOf(".metadata")));
//			String realPath = testPath.substring(1, testPath.indexOf(".metadata")) + "Final_Project/src/main/webapp/resources/etc/uploadImage";
//			System.out.println("저장되어야 할 곳 : " + realPath);
			
			//	12. 위의 path의 경로를 가진 파일 저장소 생성
			//File storage = new File(testPath);
			File storage = new File(path);
			
			//	12-1. 만약 저장소가 존재 하지 않으면 저장소를 만든다.
			if(!storage.exists()) {
				storage.mkdirs();
			}
			
			//	13. 위의 path의 경로에 새로운 파일 생성
			//File newfile = new File(testPath + "/" + filename);
			File newfile = new File(path +"/"+ filename);
			
			//	13-1. 경로에 파일이 없으면 파일을 만든다.
			if(!newfile.exists()) {
				newfile.createNewFile();
			}
			
			//	14. 파일 출력
			outputStream = new FileOutputStream(newfile);
			
			int read = 0;
			//	14-1. 파일의 크기를 byte 형식으로 저장
			byte[] b = new byte[(int)file.getSize()];
			
			//	14-2. byte가 다음이 없으면 -1 / 있으면 0 / 다음이 있으면 1 (즉, 파일이 끝나면)
			while((read=inputStream.read(b)) != -1) {
				//	14-3. 그 크기만큼 읽어서 출력
				outputStream.write(b, 0, read);
			}
			
			if(biz.insert(fileobj) > 0) {
				System.out.println("DB에 저장 성공");
			}
			
		} catch (IOException e) {

			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//	15. model에 fileobj로 저장
//		model.addAttribute("fileobj", fileobj);
		
		model.addAttribute("list",biz.selectList("쌀밥류"));
		
		//	16. uploadFile.jsp로 이동
		return "custom/CustomPage";
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}