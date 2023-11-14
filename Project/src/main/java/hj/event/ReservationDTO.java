package hj.event;
public class ReservationDTO {
	private int id;
	private String email;
	private String phonenumber;
	private int person;
	private String event_name;
	private String event_day;
	private String event_location;
	private String total;
	
	public ReservationDTO(int id, String email, String phonenumber, int person, String event_name, String event_day, String event_location, String total) {
		this.id = id;
		this.email=email;
		this.phonenumber=phonenumber;
		this.person=person;
		this.event_name=event_name;
		this.event_day=event_day;
		this.event_location=event_location;
		this.total = total;
	}
		
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public int getPerson() {
		return person;
	}

	public void setPerson(int person) {
		this.person = person;
	}

	public String getEvent_name() {
		return event_name;
	}

	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}

	public String getEvent_day() {
		return event_day;
	}

	public void setEvent_day(String event_day) {
		this.event_day = event_day;
	}

	public String getEvent_location() {
		return event_location;
	}

	public void setEvent_location(String event_location) {
		this.event_location = event_location;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}


			


}
