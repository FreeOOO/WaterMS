package lmx.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lmx.entities.BorrowCertificate;
import lmx.entities.Page;
import lmx.extend.GetDateYM;
import lmx.service.BorrowCertificateService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/lmx")
public class BorrowCertificateController {
	@Autowired
	private BorrowCertificateService borrowCertificateServiceImpl;
	@Autowired
	private Page<BorrowCertificate> page;
	@Autowired
	private GetDateYM getDateYM;
	
	@RequestMapping("/saveBorrowCertificate")		//添加借证书信息
	public String saveBorrowCertificate(BorrowCertificate borrowCertificate){
		Date date = new Date();
		borrowCertificate.setBorrowingDate(date);
		borrowCertificate.setWhetherrestitution("否");
		borrowCertificateServiceImpl.save(borrowCertificate);
		return "redirect:/lmx/showBorrowCertificatelist.spring?requestpage=1";
	}
	
	@RequestMapping("/showBorrowCertificatelist")		//显示所有借证书的大概信息
	public String showBorrowCertificate(@RequestParam("requestpage") int requestpage,Model model){
		page = borrowCertificateServiceImpl.getBorrowCertificateList(requestpage,null,null,null);
		model.addAttribute("page", page);
		return "borrowClist.jsp";
	}
	
	@RequestMapping("/getBorrowCertificate")			//显示指定id的用户详细信息
	public String getBorrowCertificate(@RequestParam("borrowingid") int borrowingid,Model model){
		BorrowCertificate borrowCertificate = borrowCertificateServiceImpl.getBorrowCertificateById(borrowingid);
		model.addAttribute("borrowCertificate", borrowCertificate);
		return "borrowCdetail.jsp";
	}
	
	@RequestMapping("/changeBorrowCertificateinfo")			//将指定id用户信息显示到修改页面
	public String changeInfo(@RequestParam("borrowingid") int borrowingid,Model model){
		BorrowCertificate borrowCertificate = borrowCertificateServiceImpl.getBorrowCertificateById(borrowingid);
		model.addAttribute("borrowCertificate", borrowCertificate);
		return "borrowCinfochange.jsp";
	}
	
	@RequestMapping("/changeBorrowCertificate")		//获取指定id用户需要修改的信息并修改
	public String changeBorrowCertificate(BorrowCertificate borrowCertificate){
		borrowCertificateServiceImpl.update(borrowCertificate);
		return "redirect:/lmx/showBorrowCertificatelist.spring?requestpage=1";
	}
	
	@RequestMapping("/backBorrowCertificate")		//归还指定id信息
	public String backBorrowCertificate(@RequestParam("borrowingid") int []borrowingID){
		for(int i = 0;i < borrowingID.length;i++){
			borrowCertificateServiceImpl.back(borrowingID[i]);
		}
		return "redirect:/lmx/showBorrowCertificatelist.spring?requestpage=1";
	}
	
	@RequestMapping("/downloadPDFBorrowCer")
	public ModelAndView downloadPDFBorrowCer(@RequestParam("borrowingid") int borrowingid){
		BorrowCertificate borrowCertificate = borrowCertificateServiceImpl.getBorrowCertificateById(borrowingid);
		List<BorrowCertificate> listBorCer = new ArrayList<BorrowCertificate>();
		listBorCer.add(borrowCertificate);
		return new ModelAndView("pdfBC", "listBorCer", listBorCer);
	}
	
	@RequestMapping("/downloadPDFBorrowCerbymonth")
	public ModelAndView downloadPDFBorrowCerbymonth(@RequestParam("time") String time){
		getDateYM.getDate(time);
		Date beginTime = getDateYM.getDateBegin();
		Date endTime = getDateYM.getDateEnd();
		List<BorrowCertificate> listBorCer = borrowCertificateServiceImpl.getLimintTime(beginTime, endTime);
		return new ModelAndView("pdfBC", "listBorCer", listBorCer);
	}
	
	@RequestMapping(value = "/findemborrowC")
	public String findemborrowC(@RequestParam("userid") String userid,Model model){
		String []columns = {"userid"};
		String []arr = {userid};
		page = borrowCertificateServiceImpl.getBorrowCertificateList(1,columns,arr,null);
		model.addAttribute("page", page);
		return "borrowClist.jsp";
	}
}
