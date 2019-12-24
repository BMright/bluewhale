package com.bluewhale.pojo;

public class User {
	
	private Integer id;
	private String	username;
	private String	password;
	private String  email;
	private String	sex;
	private String  selfintroduce;
	private Integer root;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSelfintroduce() {
		return selfintroduce;
	}
	public void setSelfintroduce(String selfintroduce) {
		this.selfintroduce = selfintroduce;
	}
	public Integer getRoot() {
		return root;
	}
	public void setRoot(Integer root) {
		this.root = root;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", email=" + email + ", sex="
				+ sex + ", selfintroduce=" + selfintroduce + ", root=" + root + "]";
	}
}
