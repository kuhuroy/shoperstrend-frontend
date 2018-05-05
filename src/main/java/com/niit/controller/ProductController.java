package com.niit.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
//import java.util.Locale.Category;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.ProductDao;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.services.ProductServices;

@Controller
public class ProductController {
	@Autowired(required=true)
	 ProductServices productService;
	@RequestMapping(value="/all/getproducts")
	public ModelAndView getAllProducts() {
		List<Product> products=productService.getAllProducts();
		return new ModelAndView("productList", "productAttr",products); 
	}
	@RequestMapping(value="/all/getproduct/{id}")  //id is pathvariable  id=1, id=2, id=3
	//  all/getproduct/1  , all/getproduct/2 , all/getproduct/3...
	public ModelAndView getProduct(@PathVariable int id){//id =1, 2, 3 
		//Pass this id to Service -> Service has to pass the id to Dao -> select * from product where id=1
		System.out.println("Product Id is " + id);
		Product product=productService.getProduct(id);
		System.out.println("Product is " + product );
		return new ModelAndView("productDetails","product",product);
		// 1st parameter productdetails - view name - jsp filename
		//2nd parameter product  - model attribute - in jsp page to display the data
		//3rd parameter product - model -data [1 1000.0 Product Description for toy car Toy Car 12]
		//product = [1 1000.0 Product Description for toy car Toy Car 12]
	}
	@RequestMapping(value="/admin/deleteproduct/{id}")
	public String deleteProduct(@PathVariable int id) {
		productService.deleteProduct(id);
		return "redirect:/all/getproducts";
	}
	@RequestMapping(value="/admin/getproductform")
	public String getProductForm(Model model){
		List<Category> categories=productService.getAllCategories();
		model.addAttribute("product",new Product());
		model.addAttribute("categories",categories);
		System.out.println("Size of category list " + categories.size());
		return "productForm";
	}
	@RequestMapping(value="/admin/updateproductform/{id}")
	public ModelAndView getUpdateProductForm(@PathVariable int id){
		Product product=productService.getProduct(id);
		return new ModelAndView("updateProductform","product",product);
	}
	@RequestMapping(value="/admin/saveproduct")
	public String saveProduct(@Valid@ModelAttribute(value="product") Product product, BindingResult result, Model model, HttpServletRequest request){
		if(result.hasErrors()){//hasErrors return true if product details in not valid
			model.addAttribute("categories",productService.getAllCategories());
			return "productForm";
		}
		System.out.println("New Product Details " + product);
		productService.saveProduct(product);
		MultipartFile prodImage=product.getImage();
		if((prodImage!=null)&&(!prodImage.isEmpty())) {
			String rootDirectory=request.getSession().getServletContext().getRealPath("/");
			System.out.println("root directory "+rootDirectory);
			Path paths=Paths.get(rootDirectory+"/WEB-INF/resources/images"+product.getId()+".png");
			try {
				prodImage.transferTo(new File(paths.toString()));
			} catch (IllegalStateException e) {
					// TODO: handle exception
				e.printStackTrace();
			}catch (IOException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return "redirect:/all/getproducts";
	}
	@RequestMapping(value="/admin/updateproduct")
	public String updateProduct(@Valid@ModelAttribute(value="product") Product product, BindingResult result, Model model, HttpServletRequest request){
		if(result.hasErrors()){
			model.addAttribute("categories",productService.getAllCategories());
			return "updateProductform";
		}
		System.out.println("New Product Details " + product);
		productService.updateProduct(product);
		MultipartFile prodImage=product.getImage();
		if((prodImage!=null)&&(!prodImage.isEmpty())) {
			ServletContext sc=request.getSession().getServletContext();
			String rootDirectory=sc.getRealPath("/");
			System.out.println("root directory "+rootDirectory);
			Path paths=Paths.get(rootDirectory+"/WEB-INF/resources/images"+product.getId()+".png");
			try {
				prodImage.transferTo(new File(paths.toString()));
			} catch (IllegalStateException e) {
					// TODO: handle exception
				e.printStackTrace();
			}catch (IOException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return "redirect:/all/getproducts";
	}
	@RequestMapping(value="/all/searchbycategory")
	public String searchByCategory(@RequestParam String searchCondition,Model model){
		if(searchCondition.equals("All")){
			model.addAttribute("searchCondition","");
		}
		else
		model.addAttribute("searchCondition",searchCondition);
		List<Product> products=productService.getAllProducts();
		model.addAttribute("productsAttr",products);
		return "productlist";
	}
}
