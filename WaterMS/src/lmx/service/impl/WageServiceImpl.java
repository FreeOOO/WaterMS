package lmx.service.impl;

import java.util.Date;
import java.util.List;

import lmx.dao.impl.DatabaseOpe;
import lmx.dao.impl.PageHibernateCallback;
import lmx.entities.Wage;
import lmx.entities.Page;
import lmx.entities.WageStandard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class WageServiceImpl {
	@Autowired
	private DatabaseOpe<Wage> databaseOpeWage;
	@Autowired
	private Page<Wage> page;
	@Autowired
	private PageHibernateCallback<Wage> pageHibernateCallback;
	
	private double medicalinsurancer;
	private double unemploymentinsurancer;
	private double pensionr;
	private double housingfundr;
	
	public Wage getWageById(long id){
		return databaseOpeWage.getById("from Wage where nowage = :nowage", id,"nowage");
	}

	public Page<Wage> getWageList(int requestpage,String[] columns,String[] params,String[] order){
		pageHibernateCallback.set(null, columns, params, order, 0, 0, Wage.class);
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
		pageHibernateCallback.set(null, columns, params, order,(requestpage - 1) * page.getLimit(), page.getLimit(), Wage.class);
		page.setList(pageHibernateCallback.getList());
		return page;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void fillWage(){			//每月自动生成工资
		pageHibernateCallback.set(null, null, null, null, 0, 0, WageStandard.class);
		List<WageStandard> listws = (List)pageHibernateCallback.getAllLimintList("", null, null);
		for(WageStandard standard : listws){
			Wage wage = new Wage();
			wage.setUserid(standard.getUserid());
			wage.setName(standard.getName());
			Date date = new Date();
			wage.setPayrollTime(date);
			wage.setBasicwage(standard.getBasicwage());
			wage.setSenioritywage(standard.getSenioritywage());
			wage.setSkillwage(standard.getSkillwage());
			double postsalary = 0;
			wage.setPostsalary(postsalary);
			wage.setPerformancepay(standard.getPerformancepay());
			wage.setAllowance(standard.getAllowance());
			wage.setOther(standard.getOther());
			double totalsent = standard.getBasicwage()+standard.getSenioritywage()+standard.getSkillwage()+postsalary+standard.getPerformancepay()+standard.getAllowance()+standard.getOther();
			wage.setTotalsent(totalsent);
			wage.setMedicalinsurance(totalsent * medicalinsurancer);
			wage.setUnemploymentinsurance(totalsent * unemploymentinsurancer);
			wage.setPension(totalsent * pensionr);
			wage.setHousingfund(totalsent * housingfundr);
			double tmp = totalsent - (wage.getMedicalinsurance() + wage.getUnemploymentinsurance() + wage.getPension() + wage.getHousingfund());
			double incometax = 0;
			if(tmp < 1500){
				incometax = tmp * 0.03;
			}else if(tmp < 4500){
				incometax = tmp * 0.1 - 105;
			}else if(tmp < 9000){
				incometax = tmp * 0.2 - 555;
			}else if(tmp < 35000){
				incometax = tmp * 0.25 - 1005;
			}else if(tmp < 55000){
				incometax = tmp * 0.3 - 2755;
			}
			wage.setIncometax(incometax);
			wage.setOtherdeductions(standard.getOtherdeductions());
			double totalcharge = wage.getMedicalinsurance() + wage.getUnemploymentinsurance() + wage.getPension() + wage.getHousingfund() + wage.getIncometax();
			wage.setTotalcharge(totalcharge);
			wage.setRealwages(totalsent - totalcharge);
			databaseOpeWage.save(wage);
		}
	}
	
	public List<Wage> getLimintTime(Date beginTime,Date endTime){
		pageHibernateCallback.set(null , null, null, null, 0, 0,Wage.class);
		List<Wage> list = pageHibernateCallback.getAllLimintList("payrollTime",beginTime, endTime);
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

	public void setHousingfundr(double housingfundr) {
		this.housingfundr = housingfundr;
	}
}
