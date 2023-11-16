package register.event;

public class registerDTO {
	private String email;
	private String name;
	private String phonenumber;
	private String password;

	public registerDTO() {}
	
	public registerDTO(String email) {
		this.email = email;
	}
	
	public registerDTO(String phonenumber, String email) {
		this.phonenumber = phonenumber;
		this.email = email;
	}
	
	public registerDTO(String email, String name, String phonenumber, String password) {
		this.email = email;
		this.name = name;
		this.phonenumber = phonenumber;
		this.password = password;
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
