package lmx.service.impl;

import lmx.dao.impl.DatabaseOpe;
import lmx.dao.impl.PageHibernateCallback;
import lmx.entities.Employee;
import lmx.entities.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class PageServiceImpl<T> {
	@Autowired
	private PageHibernateCallback<T> pageHibernateCallback;
	@Autowired
	private DatabaseOpe<Employee> databaseOpe;
	@Autowired
	private Page<T> page;
	
	/*@SuppressWarnings("unchecked")
	public Page<Employee> getEmployeeList(int requestpage){
		page.setCounts(employeeDaoImpl.count());
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
		pageHibernateCallback.set("from Employee", null, null, null, (requestpage - 1) * page.getLimit(), page.getLimit(),Employee.class);
		page.setList(pageHibernateCallback.getList());
		return (Page<Employee>) page;
	}*/
}
