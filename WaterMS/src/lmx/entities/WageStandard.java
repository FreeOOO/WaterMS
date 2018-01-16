package lmx.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "wagestandard")
public class WageStandard {
	@Id
	@Column(name = "userid")
	private long userid;
	@Column(name = "name")
	private String name;
	@Column(name = "basicwage")
	private int basicwage;
	@Column(name = "senioritywage")
	private int senioritywage;
	@Column(name = "skillwage")
	private int skillwage;
	@Column(name = "performancepay")
	private int performancepay;
	@Column(name = "allowance")
	private int allowance;
	@Column(name = "other")
	private int other;
	@Column(name = "otherdeductions")
	private int otherdeductions;
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
	public int getBasicwage() {
		return basicwage;
	}
	public void setBasicwage(int basicwage) {
		this.basicwage = basicwage;
	}
	public int getSenioritywage() {
		return senioritywage;
	}
	public void setSenioritywage(int senioritywage) {
		this.senioritywage = senioritywage;
	}
	public int getSkillwage() {
		return skillwage;
	}
	public void setSkillwage(int skillwage) {
		this.skillwage = skillwage;
	}
	public int getPerformancepay() {
		return performancepay;
	}
	public void setPerformancepay(int performancepay) {
		this.performancepay = performancepay;
	}
	public int getAllowance() {
		return allowance;
	}
	public void setAllowance(int allowance) {
		this.allowance = allowance;
	}
	public int getOther() {
		return other;
	}
	public void setOther(int other) {
		this.other = other;
	}
	public int getOtherdeductions() {
		return otherdeductions;
	}
	public void setOtherdeductions(int otherdeductions) {
		this.otherdeductions = otherdeductions;
	}
	
}
