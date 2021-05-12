package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Product;

public interface ProductService {
 public List<Product> getAllProducts();
 
 public Product findProductById(int id);
 
 public void addProduct(Product product);
 
 public void updateProduct(Product product);
 
 public void deleteProduct(int id);
}