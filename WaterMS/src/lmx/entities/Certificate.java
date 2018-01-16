package lmx.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name = "certificate")
public class Certificate {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "cerid")
	private long cerid;
	@Column(name = "userid")
	private long userid;
	@Column(name = "certificateType", length = 20)
	private String certificateType;
	@Column(name = "certificatename", length = 20)
	private String certificatename;
	@Column(name = "name", length = 16)
	private String name;
	@Column(name = "sex", length = 2)
	private String sex;
	@Column(name = "birth")
	@DateTimeFormat(iso = ISO.DATE)
	private Date birth;
	@Column(name = "idnumber", length = 18)
	private String idnumber;
	@Column(name = "hirecompanies", length = 30)
	private String hirecompanies;
	@Column(name = "job", length = 16)
	private String job;
	@Column(name = "technicaltitles", length = 16)
	private String technicaltitles;
	@Column(name = "certificateNumber", length = 50)
	private String certificateNumber;
	@Column(name = "registrationNumber", length = 50)
	private String registrationNumber;
	@Column(name = "certificateNo", length = 50)
	private String certificateNo;
	@Column(name = "issuingauthority", length = 50)
	private String issuingauthority;
	@Column(name = "dateofissue")
	@DateTimeFormat(iso = ISO.DATE)
	private Date dateofissue;
	@Column(name = "validitydeadline")
	@DateTimeFormat(iso = ISO.DATE)
	private Date validitydeadline;
	@Column(name = "approvalNumber", length = 50)
	private String approvalNumber;
	@Column(name = "additionalitemsregistrationrecord", length = 50)
	private String additionalitemsregistrationrecord;
	@Column(name = "accessorymaterial", length = 50)
	private String accessorymaterial;
	@Column(name = "whetherrestitution", length = 2)
	private String whetherrestitution;
	@Transient			//不映射到数据库
	private long jetlag;
	@Transient
	private String email;
	
	public long getCerid() {
		return cerid;
	}

	public void setCerid(long cerid) {
		this.cerid = cerid;
	}

	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}

	public String getCertificateType() {
		return certificateType;
	}

	public void setCertificateType(String certificateType) {
		this.certificateType = certificateType;
	}

	public String getCertificatename() {
		return certificatename;
	}

	public void setCertificatename(String certificatename) {
		this.certificatename = certificatename;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getIdnumber() {
		return idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	public String getHirecompanies() {
		return hirecompanies;
	}

	public void setHirecompanies(String hirecompanies) {
		this.hirecompanies = hirecompanies;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getTechnicaltitles() {
		return technicaltitles;
	}

	public void setTechnicaltitles(String technicaltitles) {
		this.technicaltitles = technicaltitles;
	}

	public String getCertificateNumber() {
		return certificateNumber;
	}

	public void setCertificateNumber(String certificateNumber) {
		this.certificateNumber = certificateNumber;
	}

	public String getRegistrationNumber() {
		return registrationNumber;
	}

	public void setRegistrationNumber(String registrationNumber) {
		this.registrationNumber = registrationNumber;
	}

	public String getCertificateNo() {
		return certificateNo;
	}

	public void setCertificateNo(String certificateNo) {
		this.certificateNo = certificateNo;
	}

	public String getIssuingauthority() {
		return issuingauthority;
	}

	public void setIssuingauthority(String issuingauthority) {
		this.issuingauthority = issuingauthority;
	}

	public Date getDateofissue() {
		return dateofissue;
	}

	public void setDateofissue(Date dateofissue) {
		this.dateofissue = dateofissue;
	}

	public Date getValiditydeadline() {
		return validitydeadline;
	}

	public void setValiditydeadline(Date validitydeadline) {
		this.validitydeadline = validitydeadline;
	}

	public String getApprovalNumber() {
		return approvalNumber;
	}

	public void setApprovalNumber(String approvalNumber) {
		this.approvalNumber = approvalNumber;
	}

	public String getAdditionalitemsregistrationrecord() {
		return additionalitemsregistrationrecord;
	}

	public void setAdditionalitemsregistrationrecord(
			String additionalitemsregistrationrecord) {
		this.additionalitemsregistrationrecord = additionalitemsregistrationrecord;
	}

	public String getAccessorymaterial() {
		return accessorymaterial;
	}

	public void setAccessorymaterial(String accessorymaterial) {
		this.accessorymaterial = accessorymaterial;
	}
	
	public String getWhetherrestitution() {
		return whetherrestitution;
	}

	public void setWhetherrestitution(String whetherrestitution) {
		this.whetherrestitution = whetherrestitution;
	}

	public long getJetlag() {
		return jetlag;
	}

	public void setJetlag(long jetlag) {
		this.jetlag = jetlag;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
