package com.shelmark.demo.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="user_review_pro")
public class User_Review_Pro {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="USER_REVIEW_PRO_ID")
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="USER_USERNAME", nullable=false)
	private User user;
	
	@ManyToOne
	@JoinColumn(name="PRO_ID", nullable=false)
	private Product product;
	
	@Column(name="USER_REVIEW_PRO_REVIEW")
	private String review;
	
	@Column(name="USER_REVIEW_PRO_IMAGE")
	private String image;
	
	@Column(name="USER_REVIEW_PRO_DATE")
	private Long date;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Long getDate() {
		return date;
	}

	public void setDate(Long date) {
		this.date = date;
	}
	
}
