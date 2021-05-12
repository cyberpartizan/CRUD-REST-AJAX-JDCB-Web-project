package com.example.demo.model;

import java.sql.Date;

public class Product {
	private Integer id;
	private String name;
	private String description;
	private Date createdDate;
	private Integer placeStorage;
	private Boolean reserved;

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", description=" + description + ", createdDate=" + createdDate
				+ ", placeStorage=" + placeStorage + ", reserved=" + reserved + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Integer getPlaceStorage() {
		return placeStorage;
	}

	public void setPlaceStorage(Integer placeStorage) {
		this.placeStorage = placeStorage;
	}

	public Boolean getReserved() {
		return reserved;
	}

	public void setReserved(Boolean reserved) {
		this.reserved = reserved;
	}

}