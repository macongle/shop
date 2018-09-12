package com.shop.model;

import org.springframework.stereotype.Component;

@Component
public class User {

	private int id;
	private String username;
	private String password;
	private String email;
	private int totals;
	
	public User() {
		super();
	}

	public User(int id, String username, String password, String email,
			int totals) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.totals = totals;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getTotals() {
		return totals;
	}

	public void setTotals(int totals) {
		this.totals = totals;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", email=" + email + ", totals=" + totals + "]";
	}

	
}
