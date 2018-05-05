package com.niit.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	public HomeController() {
		System.out.println("home controller beans is create");
	}
	
	@RequestMapping("/home")
	public String getHomePage() {
		return "home";
	}
	
	@RequestMapping("/login")
	public String loginPage(@RequestParam(required=false) String error,@RequestParam(required=false) 
	String logout,Model model){
		if(error!=null)
		model.addAttribute("error","Invalid Username/Password");
		if(logout!=null)
			model.addAttribute("msg","Loggedout successfully");
		return "login";
	}
}
