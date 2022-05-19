package com.douglashdezt.library.models.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

@Entity(name = "book_loan")
public class BookLoan {
	@Id
	@Column(name = "id")
	@SequenceGenerator(name = "book_loan_id_gen", sequenceName = "book_loan_id_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "book_loan_id_gen")
	private Long id;
	
	@Column(name = "loan_date")
	private Date loanDate;
	
	@Column(name = "return_date")
	private Date returnDate;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_book", nullable = true)
	private Book book;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_user", nullable = true)
	private User user;

	public BookLoan(Date loanDate, Date returnDate, Book book, User user) {
		super();
		this.loanDate = loanDate;
		this.returnDate = returnDate;
		this.book = book;
		this.user = user;
	}

	public BookLoan() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getLoanDate() {
		return loanDate;
	}

	public void setLoanDate(Date loanDate) {
		this.loanDate = loanDate;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
