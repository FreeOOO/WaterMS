package lmx.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lmx.entities.BorrowlaborContract;
import lmx.entities.Page;
import lmx.service.BorrowlaborContractService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/lmx")
public class BorrowlaborContractController {
	@Autowired
	private BorrowlaborContractService borrowlaborContractServiceImpl;
	@Autowired
	private Page<BorrowlaborContract> page;
	
	@RequestMapping("/saveBorrowlaborContract")		//添加合同借还信息
	public String saveBorrowlaborContract(BorrowlaborContract borrowlaborContract){
		Date date = new Date();
		borrowlaborContract.setBorrowingDate(date);
		borrowlaborContract.setWhetherrestitution("否");
		borrowlaborContractServiceImpl.save(borrowlaborContract);
		return "redirect:/lmx/showBorrowlaborContractlist.spring?requestpage=1";
	}
	
	@RequestMapping("/showBorrowlaborContractlist")		//显示所有合同借还的大概信息
	public String showBorrowlaborContract(@RequestParam("requestpage") int requestpage,Model model){
		page = borrowlaborContractServiceImpl.getBorrowlaborContractList(requestpage,null,null,null);
		model.addAttribute("page", page);
		return "borrowlabConlist.jsp";
	}
	
	@RequestMapping("/getBorrowlaborContract")			//显示指定id的合同借还详细信息
	public String getBorrowlaborContract(@RequestParam("borrowingID") int borrowingID,Model model){
		BorrowlaborContract borrowlaborContract = borrowlaborContractServiceImpl.getBorrowlaborContractById(borrowingID);
		model.addAttribute("borrowlaborContract", borrowlaborContract);
		return "borrowlabCondetail.jsp";
	}
	
	@RequestMapping("/changeBorrowlaborContractinfo")			//将指定id合同借还信息显示到修改页面
	public String changeInfo(@RequestParam("borrowingID") int borrowingID,Model model){
		BorrowlaborContract borrowlaborContract = borrowlaborContractServiceImpl.getBorrowlaborContractById(borrowingID);
		model.addAttribute("borrowlaborContract", borrowlaborContract);
		return "borrowlabConinfochange.jsp";
	}
	
	@RequestMapping("/changeBorrowlaborContract")		//获取指定id合同借还需要修改的信息并修改
	public String changeBorrowlaborContract(BorrowlaborContract borrowlaborContract){
		borrowlaborContractServiceImpl.update(borrowlaborContract);
		return "redirect:/lmx/showBorrowlaborContractlist.spring?requestpage=1";
	}
	
	@RequestMapping("/backBorrowlaborContract")		//归还指定id信息
	public String backBorrowlaborContract(@RequestParam("borrowingID") int []borrowingID){
		for(int i = 0;i < borrowingID.length;i++){
			borrowlaborContractServiceImpl.back(borrowingID[i]);
		}
		return "redirect:/lmx/showBorrowlaborContractlist.spring?requestpage=1";
	}
	
	@RequestMapping("/downloadPDFBorrowLabCon")
	public ModelAndView downloadPDFBorrowLabCon(@RequestParam("borrowingid") int borrowingid){
		BorrowlaborContract borrowlaborContract = borrowlaborContractServiceImpl.getBorrowlaborContractById(borrowingid);
		List<BorrowlaborContract> listBorLabCon = new ArrayList<BorrowlaborContract>();
		listBorLabCon.add(borrowlaborContract);
		return new ModelAndView("pdfBLC", "listBorLabCon", listBorLabCon);
	}
	
	@RequestMapping(value = "/findBorrowLab")
	public String findBorrowLab(@RequestParam("userid") String userid,Model model){
		String []columns = {"userid"};
		String []arr = {userid};
		page = borrowlaborContractServiceImpl.getBorrowlaborContractList(1,columns,arr,null);
		model.addAttribute("page", page);
		return "borrowlabConlist.jsp";
	}
}
