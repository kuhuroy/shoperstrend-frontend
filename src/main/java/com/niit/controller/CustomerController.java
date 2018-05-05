package com.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.model.Customer;
import com.niit.services.CustomerService;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	@RequestMapping(value="all/registratonform")
	public ModelAndView getRegistrationform() {
		return new ModelAndView("registrationForm","customer",new Customer());
	}
	@RequestMapping(value="all/registercustomer")
	public String registerCustomer(Customer customer) {
		customerService.registerCustomer(customer);
		return "login";
	}
	
}
