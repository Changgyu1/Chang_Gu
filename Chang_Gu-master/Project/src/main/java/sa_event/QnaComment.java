package sa_event;

import java.util.Date;

public class QnaComment {
	private int qna_comment_number;
	private int qna_number;
	private String qna_comment_content;
	private Date qna_comment_date;
	private int qna_comment_password;

	
	public QnaComment(int qna_comment_number, int qna_number, String qna_comment_content, Date qna_comment_date,
			int qna_comment_password) {
		this.qna_comment_number = qna_comment_number;
		this.qna_number = qna_number;
		this.qna_comment_content = qna_comment_content;
		this.qna_comment_date = qna_comment_date;
		this.qna_comment_password = qna_comment_password;
	}
	
	public int getQna_comment_number() {
		return qna_comment_number;
	}
	public void setQna_comment_number(int qna_comment_number) {
		this.qna_comment_number = qna_comment_number;
	}
	public int getQna_number() {
		return qna_number;
	}
	public void setQna_number(int qna_number) {
		this.qna_number = qna_number;
	}
	public String getQna_comment_content() {
		return qna_comment_content;
	}
	public void setQna_comment_content(String qna_comment_content) {
		this.qna_comment_content = qna_comment_content;
	}
	public Date getQna_comment_date() {
		return qna_comment_date;
	}
	public void setQna_comment_date(Date qna_comment_date) {
		this.qna_comment_date = qna_comment_date;
	}
	public int getQna_comment_password() {
		return qna_comment_password;
	}
	public void setQna_comment_password(int qna_comment_password) {
		this.qna_comment_password = qna_comment_password;
	}
}


