package gaeul.review;

import java.util.Date;

public class commentDTO {

	
	private int comment_number;
	private String comment_content;
	private Date comment_date;
	private int review_number;
	private int comment_password;
	
	
	public int getComment_password() {
		return comment_password;
	}
	public void setComment_password(int comment_password) {
		this.comment_password = comment_password;
	}
	public int getComment_number() {
		return comment_number;
	}
	public void setComment_number(int comment_number) {
		this.comment_number = comment_number;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public int getReview_number() {
		return review_number;
	}
	public void setReview_number(int review_number) {
		this.review_number = review_number;
	}

}