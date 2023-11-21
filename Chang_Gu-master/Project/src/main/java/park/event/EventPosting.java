package park.event;

public class EventPosting {
	private int event_number;
	private String event_name;
	private String event_day;
	private String event_time;
	private String event_location;
	private double event_price;
	private int event_age;
	private String event_explain;
	private String event_img;
	

	public EventPosting() {}
	

	public EventPosting(int event_number) {
		this.event_number = event_number;
	}

	public static void main(String[] args) {
		EventPostingDAO eventPostingDAO = new EventPostingDAO();

		
		eventPostingDAO.updateEvent(0, null, null, null, null, 0, 0, null);
	}
	public EventPosting(int event_number, String event_name, String event_day, String event_time, String event_location, double event_price,
			int event_age , String event_explain) {
		this.event_number = event_number;
		this.event_name = event_name;
		this.event_day = event_day;
		this.event_time = event_time;
		this.event_location = event_location;
		this.event_price = event_price;
		this.event_age = event_age;
		this.event_explain = event_explain;
	}
	public String getEvent_img() {
		return event_img;
	}
	public void setEvent_img(String event_img) {
		this.event_img = event_img;
	}

	public String getEvent_location() {
		return event_location;
	}
	public void setEvent_location(String event_location) {
		this.event_location = event_location;
	}
	public void setEvent_price(double event_price) {
		this.event_price = event_price;
	}
	public int getEvent_number() {
		return event_number;
	}

	public void setEvent_number(int event_number) {
		this.event_number = event_number;
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

	public String getEvent_time() {
		return event_time;
	}

	public void setEvent_time(String event_time) {
		this.event_time = event_time;
	}

	public double getEvent_price() {
		return event_price;
	}


	public int getEvent_age() {
		return event_age;
	}

	public void setEvent_age(int event_age) {
		this.event_age = event_age;
	}

	public String getEvent_explain() {
		return event_explain;
	}

	public void setEvent_explain(String event_explain) {
		this.event_explain = event_explain;
	}
}

