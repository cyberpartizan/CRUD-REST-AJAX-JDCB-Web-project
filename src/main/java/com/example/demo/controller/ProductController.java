package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Product;
import com.example.demo.service.ProductServiceImpl;

@Controller
@RequestMapping("/")
public class ProductController {

	@Autowired
	private ProductServiceImpl productService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getAllProducts() {
		//productService.createTable();
		ModelAndView model = new ModelAndView();
		List<Product> list = productService.getAllProducts();
		model.addObject("product_list", list);
		model.setViewName("product_list");
		return model;
	}
}