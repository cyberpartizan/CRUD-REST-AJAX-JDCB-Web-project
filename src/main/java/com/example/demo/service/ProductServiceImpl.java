package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ProductDaoImpl;
import com.example.demo.model.Product;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDaoImpl productDao;

    @Override
    public List<Product> getAllProducts() {
        return productDao.getAllProducts();
    }

    public void createTable() {
        productDao.createTable();
    }

    @Override
    public Product findProductById(int id) {
        return productDao.findeProductById(id);
    }

    @Override
    public void addProduct(Product product) {
        productDao.addProduct(product);
    }


    @Override
    public void updateProduct(Product product) {
        productDao.updateProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        productDao.deleteProduct(id);
    }

}