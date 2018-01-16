package lmx.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lmx.entities.Page;
import lmx.entities.Wage;
import lmx.extend.GetDateYM;
import lmx.service.impl.WageServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/lmx")
public class WageController {
	@Autowired
	private WageServiceImpl wageServiceImpl;
	@Autowired
	private Page<Wage> page;
	@Autowired
	private GetDateYM getDateYM;
	
	@RequestMapping("/showWagelist")		//显示所有社保的大概信息
	public String showWage(@RequestParam("requestpage") int requestpage,Model model){
		page = wageServiceImpl.getWageList(requestpage,null,null,null);
		model.addAttribute("page", page);
		return "wagelist.jsp";
	}
	
	@RequestMapping("/getWage")			//显示指定id的社保详细信息
	public String getWage(@RequestParam("nowage") int nowage,Model model){
		Wage wage = wageServiceImpl.getWageById(nowage);
		model.addAttribute("wage", wage);
		return "wagedetail.jsp";
	}
	
	@RequestMapping("/downloadPDFWage")
	public ModelAndView downloadPDFWage(@RequestParam("nowage") int nowage){
		Wage wage = wageServiceImpl.getWageById(nowage);
		List<Wage> listWage = new ArrayList<Wage>();
		listWage.add(wage);
		return new ModelAndView("pdfWage", "listWage", listWage);
	}
	
	@RequestMapping("/downloadPDFWagebymonth")
	public ModelAndView downloadPDFWagebymonth(@RequestParam("time") String time){
		getDateYM.getDate(time);
		Date beginTime = getDateYM.getDateBegin();
		Date endTime = getDateYM.getDateEnd();
		List<Wage> listWage = wageServiceImpl.getLimintTime(beginTime, endTime);
		return new ModelAndView("pdfWage", "listWage", listWage);
	}
	
	@RequestMapping(value = "/findwage")
	public String findwage(@RequestParam("userid") String userid,Model model){
		String []columns = {"userid"};
		String []arr = {userid};
		page = wageServiceImpl.getWageList(1,columns,arr,null);
		model.addAttribute("page", page);
		return "wagelist.jsp";
	}
}
