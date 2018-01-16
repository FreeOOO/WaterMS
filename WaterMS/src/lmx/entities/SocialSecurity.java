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
@Table(name = "socialsecurity")
public class SocialSecurity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "socialSecurityNo")
	private long socialSecurityNo;
	@Column(name = "time")
	@DateTimeFormat(iso = ISO.DATE)
	private Date time;
	@Column(name = "userid")
	private long userid;
	@Column(name = "personalNumber", length = 50)
	private String personalNumber;
	@Column(name = "name", length = 16)
	private String name;
	@Column(name = "medicarebase")
	private int medicarebase;
	@Column(name = "pensionbase")
	private int pensionbase;
	@Column(name = "individualhealthinsurance")
	private double individualhealthinsurance;
	@Column(name = "personalUnemploymentInsurance")
	private double personalUnemploymentInsurance;
	@Column(name = "privatepensioninsurance")
	private double privatepensioninsurance;
	@Column(name = "medicalInsuranceUnit")
	private double medicalInsuranceUnit;
	@Column(name = "unemploymentInsuranceUnit")
	private double unemploymentInsuranceUnit;
	@Column(name = "endowmentinsurance")
	private double endowmentinsurance;
	@Column(name = "unitillnessinsurance")
	private double unitillnessinsurance;
	@Column(name = "unitmaternityinsurance")
	private double unitmaternityinsurance;
	@Column(name = "injuryinsuranceunit")
	private double injuryinsuranceunit;

	public long getSocialSecurityNo() {
		return socialSecurityNo;
	}

	public void setSocialSecurityNo(long socialSecurityNo) {
		this.socialSecurityNo = socialSecurityNo;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}

	public String getPersonalNumber() {
		return personalNumber;
	}

	public void setPersonalNumber(String personalNumber) {
		this.personalNumber = personalNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMedicarebase() {
		return medicarebase;
	}

	public void setMedicarebase(int medicarebase) {
		this.medicarebase = medicarebase;
	}

	public int getPensionbase() {
		return pensionbase;
	}

	public void setPensionbase(int pensionbase) {
		this.pensionbase = pensionbase;
	}

	public double getIndividualhealthinsurance() {
		return individualhealthinsurance;
	}

	public void setIndividualhealthinsurance(double individualhealthinsurance) {
		this.individualhealthinsurance = individualhealthinsurance;
	}

	public double getPersonalUnemploymentInsurance() {
		return personalUnemploymentInsurance;
	}

	public void setPersonalUnemploymentInsurance(
			double personalUnemploymentInsurance) {
		this.personalUnemploymentInsurance = personalUnemploymentInsurance;
	}

	public double getPrivatepensioninsurance() {
		return privatepensioninsurance;
	}

	public void setPrivatepensioninsurance(double privatepensioninsurance) {
		this.privatepensioninsurance = privatepensioninsurance;
	}

	public double getMedicalInsuranceUnit() {
		return medicalInsuranceUnit;
	}

	public void setMedicalInsuranceUnit(double medicalInsuranceUnit) {
		this.medicalInsuranceUnit = medicalInsuranceUnit;
	}

	public double getUnemploymentInsuranceUnit() {
		return unemploymentInsuranceUnit;
	}

	public void setUnemploymentInsuranceUnit(double unemploymentInsuranceUnit) {
		this.unemploymentInsuranceUnit = unemploymentInsuranceUnit;
	}

	public double getEndowmentinsurance() {
		return endowmentinsurance;
	}

	public void setEndowmentinsurance(double endowmentinsurance) {
		this.endowmentinsurance = endowmentinsurance;
	}

	public double getUnitillnessinsurance() {
		return unitillnessinsurance;
	}

	public void setUnitillnessinsurance(double unitillnessinsurance) {
		this.unitillnessinsurance = unitillnessinsurance;
	}

	public double getUnitmaternityinsurance() {
		return unitmaternityinsurance;
	}

	public void setUnitmaternityinsurance(double unitmaternityinsurance) {
		this.unitmaternityinsurance = unitmaternityinsurance;
	}

	public double getInjuryinsuranceunit() {
		return injuryinsuranceunit;
	}

	public void setInjuryinsuranceunit(double injuryinsuranceunit) {
		this.injuryinsuranceunit = injuryinsuranceunit;
	}

}
