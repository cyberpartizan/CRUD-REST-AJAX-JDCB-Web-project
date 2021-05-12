package com.example.demo.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProductRowMapper implements RowMapper<Product> {

 @Override
 public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
  Product product = new Product();
  product.setId(rs.getInt("id"));
  product.setName(rs.getString("name"));
  product.setDescription(rs.getString("description"));
  product.setCreatedDate(rs.getDate("created_date"));
  product.setPlaceStorage(rs.getInt("place_storage"));
  product.setReserved(rs.getBoolean("reserved"));
  return product;
 }

}