package lmx.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name = "borrowlaborcontract")
public class BorrowlaborContract {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "borrowingID")
	private long borrowingID;
	@Column(name = "userid")
	private long userid;
	@Column(name = "name", length = 16)
	private String name;
	@Column(name = "subjecttoborrow", length = 100)
	private String subjecttoborrow;
	@Column(name = "borrowingDate")
	@DateTimeFormat(iso = ISO.DATE)
	private Date borrowingDate;
	@Column(name = "datereturn")
	@DateTimeFormat(iso = ISO.DATE)
	private Date datereturn;
	@Column(name = "borrower", length = 16)
	private String borrower;
	@Column(name = "handpaintedPeople", length = 16)
	private String handpaintedPeople;
	@Column(name = "dateofrecovery")
	@DateTimeFormat(iso = ISO.DATE)
	private Date dateofrecovery;
	@Column(name = "remark", length = 200)
	private String remark;
	@Column(name = "whetherrestitution", length = 2)
	private String whetherrestitution;

	public long getBorrowingID() {
		return borrowingID;
	}

	public void setBorrowingID(long borrowingID) {
		this.borrowingID = borrowingID;
	}

	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubjecttoborrow() {
		return subjecttoborrow;
	}

	public void setSubjecttoborrow(String subjecttoborrow) {
		this.subjecttoborrow = subjecttoborrow;
	}

	public Date getBorrowingDate() {
		return borrowingDate;
	}

	public void setBorrowingDate(Date borrowingDate) {
		this.borrowingDate = borrowingDate;
	}

	public Date getDatereturn() {
		return datereturn;
	}

	public void setDatereturn(Date datereturn) {
		this.datereturn = datereturn;
	}

	public String getBorrower() {
		return borrower;
	}

	public void setBorrower(String borrower) {
		this.borrower = borrower;
	}

	public String getHandpaintedPeople() {
		return handpaintedPeople;
	}

	public void setHandpaintedPeople(String handpaintedPeople) {
		this.handpaintedPeople = handpaintedPeople;
	}

	public Date getDateofrecovery() {
		return dateofrecovery;
	}

	public void setDateofrecovery(Date dateofrecovery) {
		this.dateofrecovery = dateofrecovery;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getWhetherrestitution() {
		return whetherrestitution;
	}

	public void setWhetherrestitution(String whetherrestitution) {
		this.whetherrestitution = whetherrestitution;
	}

}
