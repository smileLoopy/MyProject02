package member;

import java.util.Date;

public class MembershipDTO {
	
	// 멤버 변수 ( membership Table )
	
	private String idx; 
	private String firstname; 
	private String lastname; 
	private String id; 
	private String pass;
	private Date regidate;
	public MembershipDTO() {
		super();
	}
	
	

	
	
	// getter() / setter()	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	
	
	
}
