package com.example.demo.dao;

import java.util.List;

import com.example.demo.model.Product;

public interface ProductDao {
 
 public List<Product> getAllProducts();
 
 public Product findeProductById(int id);
 
 public void addProduct(Product product);
 
 public void updateProduct(Product product);
 
 public void deleteProduct(int id);
}