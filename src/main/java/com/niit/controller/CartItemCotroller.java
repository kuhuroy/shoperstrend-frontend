package com.niit.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.model.CartItem;
import com.niit.model.Product;
import com.niit.model.ShippingAddress;
import com.niit.model.User;
import com.niit.services.CartItemService;
import com.niit.services.ProductServices;

@Controller
public class CartItemCotroller {
	@Autowired
	private CartItemService cartItemService;
	@Autowired
	private ProductServices productServices;
	@RequestMapping(value="/cart/addtocart/{id}")
	public String addToCart(@PathVariable int id,@AuthenticationPrincipal Principal principal,@RequestParam int requestQuantity) {
		String email=principal.getName();
		User user=cartItemService.getUser(email);
		Product product=productServices.getProduct(id);
		List<CartItem> cartItems=user.getCartItems();
		for(CartItem cartItem:cartItems) {
			if(cartItem.getProduct().getId()==id) {
				cartItem.setQuantity(requestQuantity);
				cartItem.setTotalprice(requestQuantity*product.getPrice());
				cartItemService.saveOrUpdateCartItem(cartItem);
				return "redirect:/cart/purchaseDetails";
			}
		}
		CartItem cartItem=new CartItem();
		cartItem.setQuantity(requestQuantity);
		cartItem.setTotalprice(requestQuantity*product.getPrice());
		cartItem.setUser(user);
		cartItemService.saveOrUpdateCartItem(cartItem);
		return "redirect:/cart/purchaseDetails";
	}
	
	@RequestMapping(value="/cart/purchasedetails")
	public String getPurchaseDetails(@AuthenticationPrincipal Principal principal,Model model){
		String email=principal.getName();
		User user=cartItemService.getUser(email);
		List<CartItem> cartItems=user.getCartItems();//list of cartitems/products
		model.addAttribute("cartItems",cartItems);
		return "cart";
	}
	
	@RequestMapping(value="/cart/deletecartitem/{cartItemId}")
	public String removeCartItem(@PathVariable int cartItemId) {
		cartItemService.removeCartItem(cartItemId);
		return "redirect:/cart/purchaseDetails";
	}
	
	@RequestMapping(value="/cart/clearcart")
	public String clearCart(@AuthenticationPrincipal Principal principal) {
		return "redirect:/cart/purchaseDetails";
	}
	
	@RequestMapping(value="/cart/checkout")
	public String checkout(@AuthenticationPrincipal Principal principal,Model model){
	
		return "shippingaddress";
	}
	
	@RequestMapping(value="/cart/createorder")
	public String createOrder(@AuthenticationPrincipal Principal principal ,
            @ModelAttribute ShippingAddress shippingaddress,
            Model model){
		return "orderdetails";
	}
}
