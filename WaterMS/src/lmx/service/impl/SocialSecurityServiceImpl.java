package lmx.service.impl;

import java.util.Date;
import java.util.List;

import lmx.dao.impl.DatabaseOpe;
import lmx.dao.impl.PageHibernateCallback;
import lmx.entities.SocialSecurity;
import lmx.entities.Page;
import lmx.entities.WageStandard;
import lmx.service.SocialSecurityService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class SocialSecurityServiceImpl implements SocialSecurityService {
	@Autowired
	private DatabaseOpe<SocialSecurity> databaseOpe;
	@Autowired
	private Page<SocialSecurity> page;
	@Autowired
	private PageHibernateCallback<SocialSecurity> pageHibernateCallback;
	
	private double medicalinsurancer;
	private double unemploymentinsurancer;
	private double pensionr;
	//private double housingfundr;
	private double medicalInsuranceUnitr;
	private double unemploymentInsuranceUnitr;
	private double endowmentinsurancer;
	private double unitmaternityinsurancer;
	private double injuryinsuranceunitr;
	
	@Override
	public SocialSecurity getSocialSecurityById(long socialSecurityNo){
		return databaseOpe.getById("from SocialSecurity where socialSecurityNo = :socialSecurityNo", socialSecurityNo,"socialSecurityNo");
	}

	@Override
	public Page<SocialSecurity> getSocialSecurityList(int requestpage,String[] columns,String[] params,String[] order){
		pageHibernateCallback.set("from SocialSecurity", columns, params, order, (requestpage - 1) * page.getLimit(), page.getLimit(),SocialSecurity.class);
		page.setCounts(pageHibernateCallback.getCount());
		if(page.getCounts() % page.getLimit() != 0){
			page.setTatalPage((int)(page.getCounts() / page.getLimit()) + 1);
		}else{
			page.setTatalPage((int)(page.getCounts() / page.getLimit()));
		}
		if(requestpage < 1)
			requestpage = 1;
		else if(requestpage > page.getTatalPage())
			requestpage = page.getTatalPage();
		page.setPage(requestpage);
		pageHibernateCallback.set("from SocialSecurity",columns, params, order, (requestpage - 1) * page.getLimit(), page.getLimit(),SocialSecurity.class);
		page.setList(pageHibernateCallback.getList());
		return (Page<SocialSecurity>) page;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void fillSocialSecurity(){			//每月自动生成工资
		pageHibernateCallback.set(null, null, null, null, 0, 0, WageStandard.class);
		List<WageStandard> listws = (List)pageHibernateCallback.getAllLimintList("", null, null);
		for(WageStandard standard : listws){
			int postsalary = 0;
			int totalsent = standard.getBasicwage()+standard.getSenioritywage()+standard.getSkillwage()+postsalary+standard.getPerformancepay()+standard.getAllowance()+standard.getOther();
			SocialSecurity socialSecurity = new SocialSecurity();
			Date date = new Date();
			socialSecurity.setTime(date);
			socialSecurity.setUserid(standard.getUserid());		//员工ID
			socialSecurity.setPersonalNumber("");				//个人编号
			socialSecurity.setName(standard.getName());			//姓名
			socialSecurity.setMedicarebase(1973);					//医保基数
			socialSecurity.setPensionbase(1140);					//养老基数
			socialSecurity.setIndividualhealthinsurance(totalsent * medicalinsurancer);	//个人医疗保险
			socialSecurity.setPersonalUnemploymentInsurance(totalsent * unemploymentinsurancer);//个人失业保险
			socialSecurity.setPrivatepensioninsurance(totalsent * pensionr);		//个人养老保险
			socialSecurity.setMedicalInsuranceUnit(totalsent * medicalInsuranceUnitr);			//单位医疗保险
			socialSecurity.setUnemploymentInsuranceUnit(totalsent * unemploymentInsuranceUnitr);	//单位失业保险
			socialSecurity.setEndowmentinsurance(totalsent * endowmentinsurancer);;			//单位养老保险
			socialSecurity.setUnitillnessinsurance(0);			//单位医保大病
			socialSecurity.setUnitmaternityinsurance(totalsent * unitmaternityinsurancer);		//单位生育保险
			socialSecurity.setInjuryinsuranceunit(totalsent * injuryinsuranceunitr);			//单位工伤保险
			databaseOpe.save(socialSecurity);
		}
	}
	
	public List<SocialSecurity> getLimintTime(Date beginTime,Date endTime){
		pageHibernateCallback.set(null , null, null, null, 0, 0,SocialSecurity.class);
		List<SocialSecurity> list = pageHibernateCallback.getAllLimintList("time",beginTime, endTime);
		return list;
	}

	public void setMedicalinsurancer(double medicalinsurancer) {
		this.medicalinsurancer = medicalinsurancer;
	}

	public void setUnemploymentinsurancer(double unemploymentinsurancer) {
		this.unemploymentinsurancer = unemploymentinsurancer;
	}

	public void setPensionr(double pensionr) {
		this.pensionr = pensionr;
	}

	public void setMedicalInsuranceUnitr(double medicalInsuranceUnitr) {
		this.medicalInsuranceUnitr = medicalInsuranceUnitr;
	}

	public void setUnemploymentInsuranceUnitr(double unemploymentInsuranceUnitr) {
		this.unemploymentInsuranceUnitr = unemploymentInsuranceUnitr;
	}

	public void setEndowmentinsurancer(double endowmentinsurancer) {
		this.endowmentinsurancer = endowmentinsurancer;
	}

	public void setUnitmaternityinsurancer(double unitmaternityinsurancer) {
		this.unitmaternityinsurancer = unitmaternityinsurancer;
	}

	public void setInjuryinsuranceunitr(double injuryinsuranceunitr) {
		this.injuryinsuranceunitr = injuryinsuranceunitr;
	}
	
}
