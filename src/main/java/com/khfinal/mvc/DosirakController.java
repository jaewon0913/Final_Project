package com.khfinal.mvc;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.khfinal.mvc.dosirak.biz.DosirakBiz;
import com.khfinal.mvc.dosirak.dto.DosirakDto;
import com.khfinal.mvc.etc.util.CustomOrderDto;
import com.khfinal.mvc.member.dto.MemberDto;
import com.khfinal.mvc.paging.Paging;

@Controller
public class DosirakController {
   
   @Autowired
   private DosirakBiz dosirakbiz;
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

   @RequestMapping("/dosiraktest.do")
   public String dosiraktest(Model model) {
      DosirakDto dosirakdto = dosirakbiz.selecttest(1);
      model.addAttribute("dosirakdto", dosirakdto);
      
      return "payment/DosirakTest";
   }
   
   @RequestMapping("/kakaopay.do")
   public String kakaopay(DosirakDto dto, Model model,HttpSession session) {
      System.out.println("kakaopay들어옴");
      MemberDto memberdto = (MemberDto)session.getAttribute("logindto");
      
      model.addAttribute("dto", dto);
      model.addAttribute("memberdto",memberdto);
      return "payment/Kakaopay";
   }
   
   @RequestMapping("/kakaopay_custom.do")
   public String kakaopay_custom(CustomOrderDto custom_dto, Model model,HttpSession session, HttpServletRequest request) {
      MemberDto memberdto = (MemberDto)session.getAttribute("logindto");
      
      System.out.println(custom_dto.getCustom_kal());
      custom_dto.setCustom_kal(request.getParameter("custom_kal"));
      
      if(custom_dto.getCustom_count().equals("4")) {
         custom_dto.setCustom_dish1(request.getParameter("sideDish1"));
         custom_dto.setCustom_dish2(request.getParameter("sideDish2"));
         custom_dto.setCustom_dish3(request.getParameter("sideDish3"));
         custom_dto.setCustom_dish4(request.getParameter("sideDish4"));
         custom_dto.setCustom_dish5(request.getParameter("sideDish5"));
         custom_dto.setCustom_dish6(null);
         custom_dto.setCustom_dish7(null);
      } else if (custom_dto.getCustom_count().equals("5")) {
         custom_dto.setCustom_dish1(request.getParameter("sideDish1"));
         custom_dto.setCustom_dish2(request.getParameter("sideDish2"));
         custom_dto.setCustom_dish3(request.getParameter("sideDish3"));
         custom_dto.setCustom_dish4(request.getParameter("sideDish4"));
         custom_dto.setCustom_dish5(request.getParameter("sideDish5"));
         custom_dto.setCustom_dish6(request.getParameter("sideDish6"));
         custom_dto.setCustom_dish7(null);
      } else {
         custom_dto.setCustom_dish1(request.getParameter("sideDish1"));
         custom_dto.setCustom_dish2(request.getParameter("sideDish2"));
         custom_dto.setCustom_dish3(request.getParameter("sideDish3"));
         custom_dto.setCustom_dish4(request.getParameter("sideDish4"));
         custom_dto.setCustom_dish5(request.getParameter("sideDish5"));
         custom_dto.setCustom_dish6(request.getParameter("sideDish6"));
         custom_dto.setCustom_dish7(request.getParameter("sideDish7"));
      }
            
      model.addAttribute("customdto", custom_dto);
      model.addAttribute("memberdto",memberdto);
      return "payment/KakaopayCustom";
   }
   

   @RequestMapping("/dosirak_list.do")
   public String dosiraklist(Model model) {
      model.addAttribute("list",dosirakbiz.selectList());
      return "dosirak/DosirakList";
   }
   
   @RequestMapping("/dosirak_listpaging.do")
   public String dosiraklistpaging(Model model, String txt_search, String page) {
      
      String txt_s = txt_search;
         
            // 페이징하기
            int totalCount = dosirakbiz.totalcount(txt_s);
            int pag = (page == null) ? 1 : Integer.parseInt(page);

            Paging paging = new Paging();
            
            paging.setPageNo(pag); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
            paging.setPageSize(9); // 한페이지에 불러낼 게시물의 개수 지정
            paging.setTotalCount(totalCount);
            pag = (pag - 1) * paging.getPageSize(); // select해오는 기준을 구한다.

	         List<DosirakDto> list = dosirakbiz.selectListPaging(pag, paging.getPageSize(), txt_s);
	         List<DosirakDto> viewslist = dosirakbiz.viewslist();
	         model.addAttribute("list", list);
	         model.addAttribute("viewslist", viewslist);
	         model.addAttribute("paging", paging);
	         model.addAttribute("txt_search", txt_s);
	         
	         return "dosirak/DosirakList";
	         
	}
	
	@RequestMapping("/dosirak_selectone.do")
	public String dosirakselectOne(Model model, @RequestParam int dosirak_postnum) {
		int res = 0;
		DosirakDto dosirakdto = dosirakbiz.selectOne(dosirak_postnum);
		model.addAttribute("dosirakdto", dosirakdto);
		
		res = dosirakbiz.updateviews(dosirak_postnum);
		if( res > 0) {
			return "dosirak/DosirakSelectone";
		}
		return "dosirak/DosirakSelectone";
	}
	
	@RequestMapping("/dosirak_insertform.do")
	public String dosirak_insertform() {
		return "dosirak/DosirakInsert";
	}
	
	@RequestMapping("/dosirak_insert.do")
	public String dosirak_insert(Model model, DosirakDto dto, MultipartHttpServletRequest mtfRequest) {
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		List<MultipartFile> fileList2 = mtfRequest.getFiles("file2");
		String path = mtfRequest.getSession().getServletContext().getRealPath("resources/etc/multiupload");
		File dir = new File(path);
		if(!dir.isDirectory()) {
			dir.mkdirs();
		}
		for(MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일
			Long fileSize = mf.getSize(); // 파일 사이즈
			String mainimagePath = path + "/" + originFileName; // 경로
			String mainimage = originFileName;
			dto.setmainimage(mainimage);
			System.out.println("경로  : " + mainimage);
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			try {
				mf.transferTo(new File(mainimagePath));
			} catch(IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		for(MultipartFile mf2 : fileList2) {
			String originFileName = mf2.getOriginalFilename(); // 원본 파일
			Long fileSize = mf2.getSize(); // 파일 사이즈
			String thumbnailPath = path + "/" + originFileName; // 경로
			String thumbnail = originFileName;
			dto.setthumbnail(thumbnail);
			System.out.println("경로  : " + thumbnail);
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			try {
				mf2.transferTo(new File(thumbnailPath));
			} catch(IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		int res = dosirakbiz.insert(dto);
		model.addAttribute("list",dosirakbiz.selectList());
		
		if(res > 0) {
			return "redirect:dosirak_listpaging.do";
		} else {
			return "error/ErrorPage";
		}
	}
	
	@RequestMapping("dosirak_delete.do")
	public String dosirakdelete(@RequestParam String dosirak_name) {
		int res = dosirakbiz.delete(dosirak_name);
		if(res > 0) {
			return "redirect:dosirak_listpaging.do";
		} else {
			return "error/ErrorPage";
		}
	}
	
	@RequestMapping("dosirak_updateform.do")
	public String dosirak_updateform(Model model, int dosirak_postnum) {
		DosirakDto dosirakdto = dosirakbiz.selectOne(dosirak_postnum);
		model.addAttribute("dosirakdto", dosirakdto);
		return "dosirak/Dosirakupdate";
	}
	
	@RequestMapping("dosirak_update.do")
	public String dosirak_update(@ModelAttribute DosirakDto dto, Model model, MultipartHttpServletRequest mtfRequest) {
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		List<MultipartFile> fileList2 = mtfRequest.getFiles("file2");
		String path = mtfRequest.getSession().getServletContext().getRealPath("resources/etc/multiupload");
		File dir = new File(path);
		if(!dir.isDirectory()) {
			dir.mkdirs();
		}
		for(MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일
			Long fileSize = mf.getSize(); // 파일 사이즈
			String mainimagePath = path + "/" + originFileName; // 경로
			String mainimage = originFileName;
			dto.setmainimage(mainimage);
			System.out.println("경로  : " + mainimage);
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			try {
				mf.transferTo(new File(mainimagePath));
			} catch(IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		for(MultipartFile mf2 : fileList2) {
			String originFileName = mf2.getOriginalFilename(); // 원본 파일
			Long fileSize = mf2.getSize(); // 파일 사이즈
			String thumbnailPath = path + "/" + originFileName; // 경로
			String thumbnail = originFileName;
			dto.setthumbnail(thumbnail);
			System.out.println("경로  : " + thumbnail);
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			try {
				mf2.transferTo(new File(thumbnailPath));
			} catch(IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		int res = dosirakbiz.update(dto);
		 model.addAttribute("list",dosirakbiz.selectList()); 
		if(res > 0) {
			return "redirect:dosirak_listpaging.do";
		} else {
			return "error/ErrorPage";
		}
	}
	
	@RequestMapping("/dorirak_monthpay.do")
	public String dorirak_monthpay(Model model) {
		model.addAttribute("dosirakdto");
		return "payment/Dorirak_monthpay";
	}
}
