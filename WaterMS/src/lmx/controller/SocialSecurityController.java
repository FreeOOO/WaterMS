package lmx.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lmx.entities.Page;
import lmx.entities.SocialSecurity;
import lmx.extend.GetDateYM;
import lmx.service.SocialSecurityService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/lmx")
public class SocialSecurityController {
	@Autowired
	private SocialSecurityService socialSecurityServiceImpl;
	@Autowired
	private Page<SocialSecurity> page;
	@Autowired
	private GetDateYM getDateYM;
	
	@RequestMapping("/showSocialSecuritylist")		//显示所有社保的大概信息
	public String showSocialSecurity(@RequestParam("requestpage") int requestpage,Model model){
		page = socialSecurityServiceImpl.getSocialSecurityList(requestpage,null,null,null);
		model.addAttribute("page", page);
		return "socSeclist.jsp";
	}
	
	@RequestMapping("/getSocialSecurity")			//显示指定id的社保详细信息
	public String getSocialSecurity(@RequestParam("socialSecurityNo") int socialSecurityNo,Model model){
		SocialSecurity socialSecurity = socialSecurityServiceImpl.getSocialSecurityById(socialSecurityNo);
		model.addAttribute("socialSecurity", socialSecurity);
		return "socSecdetail.jsp";
	}
	
	@RequestMapping("/downloadPDFSocSec")
	public ModelAndView downloadPDFSocSec(@RequestParam("socialSecurityNo") int socialSecurityNo){
		SocialSecurity socialSecurity = socialSecurityServiceImpl.getSocialSecurityById(socialSecurityNo);
		List<SocialSecurity> listSocSec = new ArrayList<SocialSecurity>();
		listSocSec.add(socialSecurity);
		return new ModelAndView("pdfSocSec", "listSocSec", listSocSec);
	}
	
	@RequestMapping("/downloadPDFSSbymonth")
	public ModelAndView downloadPDFSSbymonth(@RequestParam("time") String time){
		getDateYM.getDate(time);
		Date beginTime = getDateYM.getDateBegin();
		Date endTime = getDateYM.getDateEnd();
		List<SocialSecurity> listSocSec = socialSecurityServiceImpl.getLimintTime(beginTime, endTime);
		return new ModelAndView("pdfSocSec", "listSocSec", listSocSec);
	}
	
	@RequestMapping(value = "/findsocsec")
	public String findsocsec(@RequestParam("userid") String userid,Model model){
		String []columns = {"userid"};
		String []arr = {userid};
		page = socialSecurityServiceImpl.getSocialSecurityList(1,columns,arr,null);
		model.addAttribute("page", page);
		return "socSeclist.jsp";
	}
}
