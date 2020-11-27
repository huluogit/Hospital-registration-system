package com.starry.web;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.starry.entity.User;
import com.starry.service.IDoctorService;
import com.starry.service.IUserService;

@Controller
@RequestMapping("/")
public class UserController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IDoctorService doctorService;
//	private IRegisterService registerService;

//	public IRegisterService getRegisterService() {
//		return registerService;
//	}
//
//	@Resource
//	public void setRegisterService(IRegisterService registerService) {
//		this.registerService = registerService;
//	}

	public IUserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "findAllUser", method = RequestMethod.GET)
	public String home(Model model) {
		List<User> users = userService.selectAll();
		model.addAttribute("users", users);
		System.out.println("Controller" + users);
		return "home";
	}

	@RequestMapping(value = "json1", produces = "application/json")
	public @ResponseBody
	List<User> getJson() {
		List<User> list = userService.selectAll();
		System.out.println(list);
		return list;
	}
	@RequestMapping(value="delete" ,method=RequestMethod.POST)
	public String delete(@RequestParam("id") int id){
		userService.deleteById(id);
		System.out.println(id);
		return "success";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@RequestParam("name") String name,
			@RequestParam("pwd") String pwd,
			@RequestParam("tel") String tel,
			@RequestParam("info") String info, Model model) {
		 User user = new User(name, pwd, tel, info);
		 System.out.println(info);
		int a = userService.register(user);
		System.out.println(""+a);
		if(a==1){
			return "success";
		}
		return  "register";
	}
	
	@RequestMapping(value = "login.action", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username,
			@RequestParam("pwd") String pwd, Model model,HttpSession session) {
		List<User> list = userService.checkLogin(username,pwd);
		try {
			list.get(0);
			model.addAttribute("name", username);
			model.addAttribute("pwd", pwd);
			session.setAttribute("user", list);
			return "uindex";
			
		} catch (Exception e) {
			return "second";
		}
	}
	
	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
	public void updateUser(@RequestParam("username") String username,
			@RequestParam("password") String pwd, 
			@RequestParam("tel") String tel, 
			@RequestParam("info") String info, 
			@RequestParam("id") Integer id, 
			Model model,HttpSession session,HttpServletResponse response,HttpServletRequest request) {
		
		User user = new User(username, pwd, id, tel, info);
		
		try {
			userService.updateUser(user);
			List<User> list = userService.checkLogin(user.getUname(),user.getPwd());
			model.addAttribute("name", username);
			model.addAttribute("pwd", pwd);
			session.setAttribute("user", list);
			response.sendRedirect(request.getContextPath() + "/changeruser.jsp");
			
		} catch (Exception e) {
			try {
				response.sendRedirect(request.getContextPath() + "/second.jsp");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
