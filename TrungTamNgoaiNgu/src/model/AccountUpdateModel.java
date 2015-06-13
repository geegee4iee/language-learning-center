package model;

public class AccountUpdateModel {
	private String id;
	private String password;
	private String passwordNew;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasswordNew() {
		return passwordNew;
	}
	public void setPasswordNew(String passwordNew) {
		this.passwordNew = passwordNew;
	}
}
