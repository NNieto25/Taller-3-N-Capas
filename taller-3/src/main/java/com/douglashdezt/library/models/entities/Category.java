package com.douglashdezt.library.models.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity(name = "category")
public class Category {

	@Id
	@Column(name = "id")
	private String id;
	
	@Column(name  = "name")
	private String name;
	
	@OneToMany(mappedBy = "category", fetch = FetchType.LAZY, cascade = { CascadeType.MERGE })
	private List<Book> books;

	public Category(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Category() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}
}
