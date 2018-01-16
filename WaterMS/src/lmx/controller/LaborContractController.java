package lmx.controller;

import lmx.entities.LaborContract;
import lmx.entities.Page;
import lmx.service.LaborContractService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/lmx")
public class LaborContractController {
	@Autowired
	private LaborContractService laborContractServiceImpl;
	@Autowired
	private Page<LaborContract> page;
	
	@RequestMapping("/saveLaborContract")		//添加劳动合同信息
	public String saveLaborContract(LaborContract laborContract){
		laborContractServiceImpl.save(laborContract);
		return "redirect:/lmx/showLaborContractlist.spring?requestpage=1";
	}
	
	@RequestMapping("/showLaborContractlist")		//显示所有劳动合同的大概信息
	public String showLaborContract(@RequestParam("requestpage") int requestpage,Model model){
		page = laborContractServiceImpl.getLaborContractList(requestpage,null,null,null);
		model.addAttribute("page", page);
		return "labConlist.jsp";
	}
	
	@RequestMapping("/getLaborContract")			//显示指定id的劳动合同详细信息
	public String getLaborContract(@RequestParam("userid") int userid,Model model){
		LaborContract laborContract = laborContractServiceImpl.getLaborContractById(userid);
		model.addAttribute("laborContract", laborContract);
		return "labCondetail.jsp";
	}
	
	@RequestMapping("/changeLaborContractinfo")			//将指定id劳动合同信息显示到修改页面
	public String changeInfo(@RequestParam("userid") int userid,Model model){
		LaborContract laborContract = laborContractServiceImpl.getLaborContractById(userid);
		model.addAttribute("laborContract", laborContract);
		return "labConinfochange.jsp";
	}
	
	@RequestMapping("/changeLaborContract")		//获取指定id劳动合同需要修改的信息并修改
	public String changeLaborContract(LaborContract laborContract){
		laborContractServiceImpl.update(laborContract);
		return "redirect:/lmx/showLaborContractlist.spring?requestpage=1";
	}
	
	@RequestMapping("/deleteLaborContract")		//删除指定id信息
	public String deleteLaborContract(@RequestParam("userid") int []userid){
		for(int i = 0;i < userid.length;i++){
			laborContractServiceImpl.delete(userid[i]);
		}
		return "redirect:/lmx/showLaborContractlist.spring?requestpage=1";
	}
	
	@RequestMapping(value = "/findlabcon")
	public String findlabcon(@RequestParam("userid") String userid,Model model){
		String []columns = {"userid"};
		String []arr = {userid};
		page = laborContractServiceImpl.getLaborContractList(1,columns,arr,null);
		model.addAttribute("page", page);
		return "labConlist.jsp";
	}
}
