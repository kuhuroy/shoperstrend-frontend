package com.niit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloWorldController {
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String sayHello(ModelMap model) {
		model.addAttribute("message","Welcome to controller");
		return "welcome";
	}
	
	@RequestMapping(value="/hello", method=RequestMethod.GET)
	public String sayHelloAgain(ModelMap model) {
		model.addAttribute("message1","Welcome again to controller");
		return "welcome";
	}
}
