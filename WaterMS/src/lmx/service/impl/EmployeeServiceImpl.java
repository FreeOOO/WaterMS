package lmx.service.impl;

import java.util.List;

import lmx.dao.impl.DatabaseOpe;
import lmx.dao.impl.PageHibernateCallback;
import lmx.entities.Employee;
import lmx.entities.LaborContract;
import lmx.entities.Page;
import lmx.service.EmployeeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private DatabaseOpe<Employee> databaseOpe;
	@Autowired
	private Page<Employee> page;
	@Autowired
	private PageHibernateCallback<Employee> pageHibernateCallback;
	@Autowired
	private DatabaseOpe<LaborContract> databaseOpelab;
	
	@Override
	public void save(Employee employee){
		databaseOpe.save(employee);
	}
	
	public Employee getEmployeeById(long id){
		return databaseOpe.getById("from Employee where userid = :userid", id ,"userid");
	}

	public void update(Employee employee) {
		databaseOpe.update(employee);
	}

	public void delete(int userid) {
		databaseOpe.delete(databaseOpe.getById("from Employee where userid = :userid", userid,"userid"));
	}
	
	public Page<Employee> getEmployeeList(int requestpage,String[] columns,String[] params,String[] order){
		pageHibernateCallback.set(null, columns, params, order, 0, 0, Employee.class);
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
		pageHibernateCallback.set(null, columns, params, order,(requestpage - 1) * page.getLimit(), page.getLimit(), Employee.class);
		page.setList(pageHibernateCallback.getList());
		return page;
	}
	
	public Employee find(long id){
		List<LaborContract> listlab = databaseOpelab.getList(LaborContract.class, "userid", id);
		List<Employee> list = databaseOpe.getList(Employee.class,"userid",id);
		if(list.size() < 1){
			return null;
		}else{
			if(listlab.size() > 0){
				Employee employee = new Employee();
				employee.setUserid(-1);
				return employee;
			}else
				return list.get(0);
		}
	}
	
}
