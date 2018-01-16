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
@Table(name = "employee")
public class Employee {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "userid")
	private long userid;
	@Column(name = "idnumber", length = 18)
	private String idnumber;
	@Column(name = "name", length = 16)
	private String name;
	@Column(name = "jobtitle", length = 4)
	private String jobtitle;
	@Column(name = "evaluationtime")
	@DateTimeFormat(iso = ISO.DATE)
	/*@DateTimeFormat(pattern="yyyy-MM-dd")*/
	private Date evaluationtime;
	@Column(name = "sex", length = 2)
	private String sex;
	@Column(name = "post", length = 30)
	private String post;
	@Column(name = "job", length = 30)
	private String job;
	@Column(name = "firstdegree", length = 30)
	private String firstdegree;
	@Column(name = "graduatedschool", length = 30)
	private String graduatedschool;
	@Column(name = "highesteducation", length = 30)
	private String highesteducation;
	@Column(name = "highestEducationSchools", length = 30)
	private String highestEducationSchools;
	@Column(name = "bachelorofScience", length = 30)
	private String bachelorofScience;
	@Column(name = "dateofbirth")
	@DateTimeFormat(iso = ISO.DATE)
	private Date dateofbirth;
	@Column(name = "workDate")
	@DateTimeFormat(iso = ISO.DATE)
	private Date workDate;
	@Column(name = "datecompany")
	@DateTimeFormat(iso = ISO.DATE)
	private Date datecompany;
	@Column(name = "dateofseparation")
	@DateTimeFormat(iso = ISO.DATE)
	private Date dateofseparation;
	@Column(name = "reasonforleaving", length = 300)
	private String reasonforleaving;
	@Column(name = "birthplace", length = 100)
	private String birthplace;
	@Column(name = "politicalstatus", length = 10)
	private String politicalstatus;
	@Column(name = "officePhone", length = 15)
	private String officePhone;
	@Column(name = "homephone", length = 15)
	private String homephone;
	@Column(name = "homeaddress", length = 100)
	private String homeaddress;
	@Column(name = "phone", length = 11)
	private String phone;
	@Column(name = "email", length = 50)
	private String email;
	@Column(name = "photo", length = 50)
	private String photo;

	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}

	public String getIdnumber() {
		return idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJobtitle() {
		return jobtitle;
	}

	public void setJobtitle(String jobtitle) {
		this.jobtitle = jobtitle;
	}
	
	/*public String getEvaluationtime() {
		if (evaluationtime != null) {
			DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			return fmt.format(evaluationtime);
		} else {
			return "";
		}
	}

	public void setEvaluationtime(String evaluationtime) {
		Date date = null;
		if (!evaluationtime.equals("")) {
			DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			try {
				date = fmt.parse(evaluationtime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		this.evaluationtime = date;
	}*/

	public Date getEvaluationtime() {
		return evaluationtime;
	}

	public void setEvaluationtime(Date evaluationtime) {
		this.evaluationtime = evaluationtime;
	}

	public String getSex() {
		/*if (sex == null)
			sex = "空";*/
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getFirstdegree() {
		return firstdegree;
	}

	public void setFirstdegree(String firstdegree) {
		this.firstdegree = firstdegree;
	}

	public String getGraduatedschool() {
		return graduatedschool;
	}

	public void setGraduatedschool(String graduatedschool) {
		this.graduatedschool = graduatedschool;
	}

	public String getHighesteducation() {
		return highesteducation;
	}

	public void setHighesteducation(String highesteducation) {
		this.highesteducation = highesteducation;
	}

	public String getHighestEducationSchools() {
		return highestEducationSchools;
	}

	public void setHighestEducationSchools(String highestEducationSchools) {
		this.highestEducationSchools = highestEducationSchools;
	}

	public String getBachelorofScience() {
		return bachelorofScience;
	}

	public void setBachelorofScience(String bachelorofScience) {
		this.bachelorofScience = bachelorofScience;
	}
	
	public Date getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(Date dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public Date getWorkDate() {
		return workDate;
	}

	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}

	public Date getDatecompany() {
		return datecompany;
	}

	public void setDatecompany(Date datecompany) {
		this.datecompany = datecompany;
	}

	public Date getDateofseparation() {
		return dateofseparation;
	}

	public void setDateofseparation(Date dateofseparation) {
		this.dateofseparation = dateofseparation;
	}

	public String getReasonforleaving() {
		return reasonforleaving;
	}

	public void setReasonforleaving(String reasonforleaving) {
		this.reasonforleaving = reasonforleaving;
	}

	public String getBirthplace() {
		return birthplace;
	}

	public void setBirthplace(String birthplace) {
		this.birthplace = birthplace;
	}

	public String getPoliticalstatus() {
		return politicalstatus;
	}

	public void setPoliticalstatus(String politicalstatus) {
		this.politicalstatus = politicalstatus;
	}

	public String getOfficePhone() {
		return officePhone;
	}

	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}

	public String getHomephone() {
		return homephone;
	}

	public void setHomephone(String homephone) {
		this.homephone = homephone;
	}

	public String getHomeaddress() {
		return homeaddress;
	}

	public void setHomeaddress(String homeaddress) {
		this.homeaddress = homeaddress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

}
