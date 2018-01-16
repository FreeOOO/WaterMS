package lmx.controller;

/*import javax.servlet.http.HttpServletRequest;*/

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import lmx.entities.Employee;
import lmx.entities.Page;
import lmx.service.EmployeeService;
import lmx.service.impl.WageStandardServiceImpl;
import net.sf.json.JSONObject;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@SessionAttributes({"columns","arr","ordercolu"})
@RequestMapping("/lmx")
public class EmployeeController {
	@Autowired
	private EmployeeService employeeServiceImpl;
	@Autowired
	private Page<Employee> page;
	@Autowired
	private WageStandardServiceImpl wageStandardServiceImpl;

	@RequestMapping(value = "/saveEmployee", method = RequestMethod.POST)
	// 添加用户信息
	public String saveEmployee(Employee employee,MultipartHttpServletRequest request) {
		try {
			Calendar calendar = Calendar.getInstance();
			MultipartFile file = request.getFile("userphoto");
			String uploadFileName = file.getOriginalFilename();
			if(uploadFileName != ""){
				InputStream isRef = file.getInputStream();
				String targetDir = request.getSession().getServletContext().getRealPath("/lmx/userphotos");
				uploadFileName = calendar.getTimeInMillis() + uploadFileName.substring(uploadFileName.lastIndexOf("."), uploadFileName.length());
				File targetFile = new File(targetDir, uploadFileName);
				FileOutputStream fosRef = new FileOutputStream(targetFile);
				IOUtils.copy(isRef, fosRef);
			}else
				uploadFileName = "defaultuser.jpg";
			employee.setPhoto(uploadFileName);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		employeeServiceImpl.save(employee);
		wageStandardServiceImpl.firstSave(employee.getUserid(), employee.getName());
		return "redirect:/lmx/showEmployeelist.spring?requestpage=1";
	}

	@RequestMapping("/showEmployeelist")
	// 显示所有员工的大概信息
	public String showEmployee(@RequestParam("requestpage") String requestpage,
			Model model,HttpSession session) {
		int reqpage = 1;
		if(requestpage != ""){
			reqpage = Integer.parseInt(requestpage);
		}
		page = employeeServiceImpl.getEmployeeList(reqpage,(String[])session.getAttribute("columns"),(String[])session.getAttribute("arr"),(String[])session.getAttribute("ordercolu"));
		model.addAttribute("page", page);
		if((String[])session.getAttribute("arr") != null){
			model.addAttribute("workDate", ((String[])session.getAttribute("arr"))[0]);
			model.addAttribute("datecompany", ((String[])session.getAttribute("arr"))[1]);
		}
		if((String[])session.getAttribute("ordercolu") != null){
			model.addAttribute("order", ((String[])session.getAttribute("ordercolu"))[0]);
		}
		return "employeelist.jsp";
	}
	
	@RequestMapping("/showEmployeelistfirst")
	// 首次显示所有员工的大概信息
	public String showEmployeefirst(HttpSession session,SessionStatus sessionStatus) {
		session.removeAttribute("columns");
		session.removeAttribute("arr");
		session.removeAttribute("order");
		sessionStatus.setComplete();		//需要加上这一句对session的设置才生效
		return "redirect:/lmx/showEmployeelist.spring?requestpage=1";
	}
	
	@RequestMapping("/getEmployee")
	// 显示指定id的用户详细信息
	public String getEmployee(@RequestParam("userid") int userid, Model model) {
		Employee employee = employeeServiceImpl.getEmployeeById(userid);
		model.addAttribute("employee", employee);
		return "employeedetail.jsp";
	}

	@RequestMapping("/changeEmpinfo")
	// 将指定id用户信息显示到修改页面
	public String changeInfo(@RequestParam("userid") int userid, Model model) {
		Employee employee = employeeServiceImpl.getEmployeeById(userid);
		model.addAttribute("employee", employee);
		return "empinfochange.jsp";
	}

	@RequestMapping(value = "/changeEmployee", method = RequestMethod.POST)
	// 获取指定id用户需要修改的信息并修改
	public String changeEmployee(Employee employee,MultipartHttpServletRequest request) {
		try {
			Calendar calendar = Calendar.getInstance();
			MultipartFile file = request.getFile("userphoto");
			String uploadFileName = file.getOriginalFilename();
			if(uploadFileName != "" && uploadFileName != null){
				InputStream isRef = file.getInputStream();
				String targetDir = request.getSession().getServletContext().getRealPath("/lmx/userphotos");
				uploadFileName = calendar.getTimeInMillis() + uploadFileName.substring(uploadFileName.lastIndexOf("."), uploadFileName.length());
				File targetFile = new File(targetDir, uploadFileName);
				FileOutputStream fosRef = new FileOutputStream(targetFile);
				IOUtils.copy(isRef, fosRef);
				employee.setPhoto(uploadFileName);
			}/*else
				uploadFileName = "defaultuser.jpg";*/
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		employeeServiceImpl.update(employee);
		return "redirect:/lmx/showEmployeelist.spring?requestpage=1";
	}

	@RequestMapping("/deleteEmployee")
	// 删除指定id信息
	public String deleteEmployee(@RequestParam("userid") int[] userid) {
		for (int i = 0; i < userid.length; i++) {
			employeeServiceImpl.delete(userid[i]);
		}
		return "redirect:/lmx/showEmployeelist.spring?requestpage=1";
	}

	@RequestMapping("/searchBydate")
	// 按参加工作日期、到公司日期进行查询
	public String search(@RequestParam("workDate") String workDate,@RequestParam("datecompany") String datecompany,Model model,HttpSession session) {
		String []columns = {"workDate","datecompany"};
		String []arr = {workDate,datecompany};
		page = employeeServiceImpl.getEmployeeList(1,columns, arr, (String[])session.getAttribute("ordercolu"));
		model.addAttribute("columns", columns);
		model.addAttribute("arr", arr);
		model.addAttribute("page", page);
		model.addAttribute("workDate", workDate);
		model.addAttribute("datecompany", datecompany);
		if((String[])session.getAttribute("ordercolu") != null){
			model.addAttribute("order", ((String[])session.getAttribute("ordercolu"))[0]);
		}
		return "employeelist.jsp";
	}
	
	@RequestMapping("/employeeOrder")
	//排序查询
	public String employeeOrder(@RequestParam("order") String order,Model model,HttpSession session){
		String []ordercolu = {order};
		if(order.equals("请选择...")){
			ordercolu = null;
		}else
			model.addAttribute("ordercolu", ordercolu);
		page = employeeServiceImpl.getEmployeeList(1,(String[])session.getAttribute("columns"),(String[])session.getAttribute("arr"),ordercolu);
		model.addAttribute("order", order);
		model.addAttribute("page", page);
		if((String[])session.getAttribute("arr") != null){
			model.addAttribute("workDate", ((String[])session.getAttribute("arr"))[0]);
			model.addAttribute("datecompany", ((String[])session.getAttribute("arr"))[1]);
		}
		return "employeelist.jsp";
	}
	
	@RequestMapping(value = "/isExistEmployee", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String isExistEmployee(@RequestParam("jsonString") String jsonString/*,Model model,HttpSession session*/){
		JSONObject object = JSONObject.fromObject(jsonString);
		Employee employee = employeeServiceImpl.find(Long.parseLong(object.getString("userid")));
		//System.out.println(employee.getUserid() + " " + employee.getIdnumber() + employee.getName() + " " + employee.getDateofbirth());
		if(employee != null){
			if(employee.getUserid() == -1)
				return "isexist";
			else
				return JSONObject.fromObject(employee).toString();
		}
		return "false";
	}
	
	@RequestMapping(value = "/findemployee")
	public String findemployee(@RequestParam("userid") String userid,Model model){
		String []columns = {"userid"};
		String []arr = {userid};
		page = employeeServiceImpl.getEmployeeList(1,columns,arr,null);
		model.addAttribute("page", page);
		return "employeelist.jsp";
	}
}
