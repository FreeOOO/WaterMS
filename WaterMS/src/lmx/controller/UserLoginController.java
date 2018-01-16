package lmx.controller;

import javax.servlet.http.HttpSession;

import lmx.service.UserLoginService;
//import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("userSession")
public class UserLoginController {
	@Autowired
	private UserLoginService userLoginServiceImpl;
	
	@RequestMapping("/checkUser")
	public String check(@RequestParam("user") String username,
			@RequestParam("pwd") String password,HttpSession session,Model model){
		/*System.out.println(session.getAttribute("userSession") + "======");*/
		String tmp = userLoginServiceImpl.find(username,password);
		if(!tmp.equals("null")){
			model.addAttribute("userSession",tmp);
			return "index.jsp";
		}else{
			return "login.html";
		}
	}
	/*@RequestMapping("/checkUserbyJson")
	@ResponseBody
	public String checkUser(@RequestParam("jsonString") String jsonString,Model model,HttpSession session){
		if(session == null)
			System.out.println("空");
		else
			System.out.println(session.getAttribute("userSession") + "------");
		if(session.getAttribute("userSession") == null)
			System.out.println("空");
		JSONObject object = JSONObject.fromObject(jsonString);
		long tmp = userLoginServiceImpl.find(object.getString("username"),object.getString("password"));
		if(tmp != -1){
			model.addAttribute("userSession",tmp);
			return "true";
		}else{
			return "false";
		}
	}*/
}
