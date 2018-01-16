package lmx.service;

import lmx.entities.Employee;
import lmx.entities.Page;

public interface EmployeeService {

	public abstract void save(Employee employee);

	public abstract Employee getEmployeeById(long id);

	public abstract void update(Employee employee);

	public abstract void delete(int userid);
	
	public abstract Page<Employee> getEmployeeList(int requestpage,String[] columns,String[] params,String[] order);
	
	public abstract Employee find(long id);
}