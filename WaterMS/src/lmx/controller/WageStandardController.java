package lmx.controller;

import lmx.entities.WageStandard;
import lmx.entities.Page;
import lmx.service.impl.WageStandardServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/lmx")
public class WageStandardController {
	@Autowired
	private WageStandardServiceImpl wageStandardServiceImpl;
	@Autowired
	private Page<WageStandard> page;
	
	@RequestMapping("/saveWageStandard")		//添加工资标准信息
	public String saveWageStandard(WageStandard wageStandard){
		wageStandardServiceImpl.save(wageStandard);
		return "redirect:/lmx/showWageStandardlist.spring?requestpage=1";
	}
	
	@RequestMapping("/showWageStandardlist")		//显示所有工资标准的大概信息
	public String showWageStandard(@RequestParam("requestpage") int requestpage,Model model){
		page = wageStandardServiceImpl.getWageStandardList(requestpage,null,null,null);
		model.addAttribute("page", page);
		return "wagestandardlist.jsp";
	}
	
	@RequestMapping("/changeWageStandardinfo")			//将指定id工资标准信息显示到修改页面
	public String changeInfo(@RequestParam("userid") int userid,Model model){
		WageStandard wageStandard = wageStandardServiceImpl.getWageStandardById(userid);
		model.addAttribute("wageStandard", wageStandard);
		return "wagestandardchange.jsp";
	}
	
	@RequestMapping("/changeWageStandard")		//获取指定id工资标准需要修改的信息并修改
	public String changeWageStandard(WageStandard wageStandard){
		wageStandardServiceImpl.update(wageStandard);
		return "redirect:/lmx/showWageStandardlist.spring?requestpage=1";
	}
	
	@RequestMapping("/deleteWageStandard")		//删除指定id信息
	public String deleteWageStandard(@RequestParam("userid") int []userid){
		for(int i = 0;i < userid.length;i++){
			wageStandardServiceImpl.delete(userid[i]);
		}
		return "redirect:/lmx/showWageStandardlist.spring?requestpage=1";
	}
	
	@RequestMapping(value = "/findwagestandard")
	public String findwagestandard(@RequestParam("userid") String userid,Model model){
		String []columns = {"userid"};
		String []arr = {userid};
		page = wageStandardServiceImpl.getWageStandardList(1,columns,arr,null);
		model.addAttribute("page", page);
		return "wagestandardlist.jsp";
	}
}
