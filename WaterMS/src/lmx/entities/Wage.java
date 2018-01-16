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
@Table(name = "wage")
public class Wage {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "nowage")
	private long nowage;
	@Column(name = "userid")
	private long userid;
	@Column(name = "name")
	private String name;
	@Column(name = "payrollTime")
	@DateTimeFormat(iso = ISO.DATE)
	private Date payrollTime;
	@Column(name = "basicwage")
	private double basicwage;
	@Column(name = "senioritywage")
	private double senioritywage;
	@Column(name = "skillwage")
	private double skillwage;
	@Column(name = "postsalary")
	private double postsalary;
	@Column(name = "performancepay")
	private double performancepay;
	@Column(name = "allowance")
	private double allowance;
	@Column(name = "other")
	private double other;
	@Column(name = "totalsent")
	private double totalsent;
	@Column(name = "medicalinsurance")
	private double medicalinsurance;
	@Column(name = "unemploymentinsurance")
	private double unemploymentinsurance;
	@Column(name = "pension")
	private double pension;
	@Column(name = "housingfund")
	private double housingfund;
	@Column(name = "incometax")
	private double incometax;
	@Column(name = "otherdeductions")
	private double otherdeductions;
	@Column(name = "totalcharge")
	private double totalcharge;
	@Column(name = "realwages")
	private double realwages;

	public long getNowage() {
		return nowage;
	}

	public void setNowage(long nowage) {
		this.nowage = nowage;
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

	public Date getPayrollTime() {
		return payrollTime;
	}

	public void setPayrollTime(Date payrollTime) {
		this.payrollTime = payrollTime;
	}

	public double getBasicwage() {
		return basicwage;
	}

	public void setBasicwage(double basicwage) {
		this.basicwage = basicwage;
	}

	public double getSenioritywage() {
		return senioritywage;
	}

	public void setSenioritywage(double senioritywage) {
		this.senioritywage = senioritywage;
	}

	public double getSkillwage() {
		return skillwage;
	}

	public void setSkillwage(double skillwage) {
		this.skillwage = skillwage;
	}

	public double getPostsalary() {
		return postsalary;
	}

	public void setPostsalary(double postsalary) {
		this.postsalary = postsalary;
	}

	public double getPerformancepay() {
		return performancepay;
	}

	public void setPerformancepay(double performancepay) {
		this.performancepay = performancepay;
	}

	public double getAllowance() {
		return allowance;
	}

	public void setAllowance(double allowance) {
		this.allowance = allowance;
	}

	public double getOther() {
		return other;
	}

	public void setOther(double other) {
		this.other = other;
	}

	public double getTotalsent() {
		return totalsent;
	}

	public void setTotalsent(double totalsent) {
		this.totalsent = totalsent;
	}

	public double getMedicalinsurance() {
		return medicalinsurance;
	}

	public void setMedicalinsurance(double medicalinsurance) {
		this.medicalinsurance = medicalinsurance;
	}

	public double getUnemploymentinsurance() {
		return unemploymentinsurance;
	}

	public void setUnemploymentinsurance(double unemploymentinsurance) {
		this.unemploymentinsurance = unemploymentinsurance;
	}

	public double getPension() {
		return pension;
	}

	public void setPension(double pension) {
		this.pension = pension;
	}

	public double getHousingfund() {
		return housingfund;
	}

	public void setHousingfund(double housingfund) {
		this.housingfund = housingfund;
	}

	public double getIncometax() {
		return incometax;
	}

	public void setIncometax(double incometax) {
		this.incometax = incometax;
	}

	public double getOtherdeductions() {
		return otherdeductions;
	}

	public void setOtherdeductions(double otherdeductions) {
		this.otherdeductions = otherdeductions;
	}

	public double getTotalcharge() {
		return totalcharge;
	}

	public void setTotalcharge(double totalcharge) {
		this.totalcharge = totalcharge;
	}

	public double getRealwages() {
		return realwages;
	}

	public void setRealwages(double realwages) {
		this.realwages = realwages;
	}

}
