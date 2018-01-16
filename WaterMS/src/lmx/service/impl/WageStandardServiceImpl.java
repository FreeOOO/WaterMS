package lmx.service.impl;

import lmx.dao.impl.DatabaseOpe;
import lmx.dao.impl.PageHibernateCallback;
import lmx.entities.Page;
import lmx.entities.WageStandard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class WageStandardServiceImpl {
	@Autowired
	private DatabaseOpe<WageStandard> databaseOpe;
	@Autowired
	private Page<WageStandard> page;
	@Autowired
	private PageHibernateCallback<WageStandard> pageHibernateCallback;
	
	public void save(WageStandard wageStandard){
		databaseOpe.save(wageStandard);
	}
	
	public WageStandard getWageStandardById(long id){
		return databaseOpe.getById("from WageStandard where userid = :userid", id,"userid");
	}

	public void update(WageStandard WageStandard) {
		databaseOpe.update(WageStandard);
	}

	public void delete(int userid) {
		databaseOpe.delete(databaseOpe.getById("from WageStandard where userid = :userid", userid,"userid"));
	}
	
	public Page<WageStandard> getWageStandardList(int requestpage,String[] columns,String[] params,String[] order){
		pageHibernateCallback.set(null, columns, params, order, 0, 0, WageStandard.class);
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
		pageHibernateCallback.set(null, columns, params, order,(requestpage - 1) * page.getLimit(), page.getLimit(), WageStandard.class);
		page.setList(pageHibernateCallback.getList());
		return page;
	}
	
	public void firstSave(long id,String name){
		WageStandard wageStandard = new WageStandard();
		wageStandard.setUserid(id);
		wageStandard.setName(name);
		wageStandard.setBasicwage(1500);
		databaseOpe.save(wageStandard);
	}
}
