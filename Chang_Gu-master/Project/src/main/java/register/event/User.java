package register.event;
public class User {
	private String email;
	private String name;
	private String phonenumber;
	private String password;
	
	public User(String email, String name, String phonenumber, String password) {
		super();
		this.email = email;
		this.name = name;
		this.phonenumber = phonenumber;
		this.password = password;
	}

	
	public User() {
		
	}
	

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
