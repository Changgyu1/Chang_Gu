package sa_event;

import java.sql.Date;

public class Qna {
	private int qna_number;
	private int event_number;
	private String qna_title;
	private String qna_content;
	private int qna_password;
	private String qna_name;
	private Date qna_date;

	private String qna_email;
	
	public Qna() {}
	
	public Qna(int qna_number, int event_number, String qna_title, String qna_content, int qna_password,
			String qna_name, Date qna_date, String qna_email) {
		super();
		this.qna_number = qna_number;
		this.event_number = event_number;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_password = qna_password;
		this.qna_name = qna_name;
		this.qna_date = qna_date;

		this.qna_email = qna_email;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public int getQna_password() {
		return qna_password;
	}

	public void setQna_password(int qna_password) {
		this.qna_password = qna_password;
	}


	
	

	public int getQna_number() {
		return qna_number;
	}

	public void setQna_number(int qna_number) {
		this.qna_number = qna_number;
	}

	public int getEvent_number() {
		return event_number;
	}

	public void setEvent_number(int event_number) {
		this.event_number = event_number;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_name() {
		return qna_name;
	}

	public void setQna_name(String qna_name) {
		this.qna_name = qna_name;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public String getQna_email() {
		return qna_email;
	}

	public void setQna_email(String qna_email) {
		this.qna_email = qna_email;
	}
}


