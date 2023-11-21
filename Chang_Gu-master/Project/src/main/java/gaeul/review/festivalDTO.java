package gaeul.review;


import java.util.Date;

public class festivalDTO {

	private int reviewnumber;
	private String review;
	private String review_title;
	private Date reviewdate;
	private String deletereview;
	private int event_number;
	private String event_name;

	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public int getEvent_number() {
		return event_number;
	}
	public void setEvent_number(int event_number) {
		this.event_number = event_number;
	}
	public String getDeletereview() {
		return deletereview;
	}
	public void setDeletereview(String deletereview) {
		this.deletereview = deletereview;
	}
	public int getReviewnumber() {
		return reviewnumber;
	}
	public void setReviewnumber(int reviewnumber) {
		this.reviewnumber = reviewnumber;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public Date getReviewdate() {
		return reviewdate;
	}
	public void setReviewdate(Date reviewdate) {
		this.reviewdate = reviewdate;
	}
	
	
}
