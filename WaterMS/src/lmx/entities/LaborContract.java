package lmx.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name = "laborcontract")
public class LaborContract {
	@Id
	@Column(name = "userid")
	private long userid;
	@Column(name = "name", length = 16)
	private String name;
	@Column(name = "idnumber", length = 18)
	private String idnumber;
	@Column(name = "contractNo", length = 50)
	private String contractNo;
	@Column(name = "contracttype", length = 50)
	private String contracttype;
	@Column(name = "startDate")
	@DateTimeFormat(iso = ISO.DATE)
	private Date startDate;
	@Column(name = "deadline")
	@DateTimeFormat(iso = ISO.DATE)
	private Date deadline;
	@Column(name = "dateofsigning")
	@DateTimeFormat(iso = ISO.DATE)
	private Date dateofsigning;
	@Column(name = "signedobjects", length = 16)
	private String signedobjects;
	@Column(name = "whetherrestitution", length = 2)
	private String whetherrestitution;
	@Transient			
	private String email;

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

	public String getIdnumber() {
		return idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}

	public String getContracttype() {
		return contracttype;
	}

	public void setContracttype(String contracttype) {
		this.contracttype = contracttype;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public Date getDateofsigning() {
		return dateofsigning;
	}

	public void setDateofsigning(Date dateofsigning) {
		this.dateofsigning = dateofsigning;
	}

	public String getSignedobjects() {
		return signedobjects;
	}

	public void setSignedobjects(String signedobjects) {
		this.signedobjects = signedobjects;
	}

	public String getWhetherrestitution() {
		return whetherrestitution;
	}

	public void setWhetherrestitution(String whetherrestitution) {
		this.whetherrestitution = whetherrestitution;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
