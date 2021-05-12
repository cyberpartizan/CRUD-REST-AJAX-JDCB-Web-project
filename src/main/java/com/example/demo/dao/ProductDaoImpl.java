package com.example.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.Product;
import com.example.demo.model.ProductRowMapper;

@Transactional
@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Product> getAllProducts() {
		String query = "SELECT * from products";
		RowMapper<Product> rowMapper = new ProductRowMapper();
		List<Product> list = jdbcTemplate.query(query, rowMapper);
		return list;
	}

	@Override
	public Product findeProductById(int id) {
		String query = "SELECT * FROM products WHERE id = ?";
		RowMapper<Product> rowMapper = new BeanPropertyRowMapper<Product>(Product.class);
		Product product = jdbcTemplate.queryForObject(query, rowMapper, id);
		return product;
	}

	@Override
	public void addProduct(Product product) {
		String query = "INSERT INTO products(id, name, description, created_date, place_storage, reserved) VALUES(?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(query, product.getId(), product.getName(), product.getDescription(),
				product.getCreatedDate(), product.getPlaceStorage(), product.getReserved());

	}

	@Override
	public void updateProduct(Product product) {
		String query = "UPDATE products SET name=?, description=?, created_date=?, place_storage=?, reserved=? WHERE id=?";
		jdbcTemplate.update(query, product.getName(), product.getDescription(), product.getCreatedDate(),
				product.getPlaceStorage(), product.getReserved(), product.getId());

	}

	@Override
	public void deleteProduct(int id) {
		String query = "DELETE FROM products WHERE id=?";
		jdbcTemplate.update(query, id);
	}

	public void createTable() {
		jdbcTemplate.execute("Drop table if exists products");
		String query = "CREATE TABLE IF NOT EXISTS products (id INT IDENTITY," + "name VARCHAR(512),"
				+ "description VARCHAR(1024)," + "created_date date," + "place_storage int,"
				+ "reserved BOOLEAN," + "PRIMARY KEY (id))";
		jdbcTemplate.execute(query);
	}

}