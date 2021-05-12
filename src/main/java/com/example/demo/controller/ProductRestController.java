package com.example.demo.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Product;
import com.example.demo.service.ProductServiceImpl;

@RestController
public class ProductRestController {
	
	@Autowired
	private ProductServiceImpl productService;
	
	
	@GetMapping(value = { "/get_users" })
	public List<Product> getAllProducts() {
		List<Product> list = productService.getAllProducts();
		return list;
	}
	
	@DeleteMapping( value = "/delete_user/{id}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public List<Product> deleteProduct(@PathVariable Integer id) {
		productService.deleteProduct(id);
		List<Product> list = productService.getAllProducts();
		return list;
	}
	
	@PostMapping(value = "/sendRecord")
	public void addProduct(@RequestBody Product product) {
		if (product.getId()==null) {
			productService.addProduct(product);
		}else {
			productService.updateProduct(product);
		}
		
	}
	
}
