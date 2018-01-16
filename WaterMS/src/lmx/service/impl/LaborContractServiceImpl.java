package lmx.service.impl;

import java.util.Date;
import java.util.List;

import lmx.dao.impl.DatabaseOpe;
import lmx.dao.impl.PageHibernateCallback;
import lmx.entities.Employee;
import lmx.entities.LaborContract;
import lmx.entities.Page;
import lmx.service.LaborContractService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class LaborContractServiceImpl implements LaborContractService {
	@Autowired
	private DatabaseOpe<LaborContract> databaseOpeLab;
	@Autowired
	private Page<LaborContract> page;
	@Autowired
	private PageHibernateCallback<LaborContract> pageHibernateCallback;
	@Autowired
	private DatabaseOpe<Employee> databaseOpeEmp;
	
	@Override
	public void save(LaborContract laborContract){
		databaseOpeLab.save(laborContract);
	}
	
	@Override
	public LaborContract getLaborContractById(long id){
		return databaseOpeLab.getById("from LaborContract where userid = :userid", id,"userid");
	}

	/* (non-Javadoc)
	 * @see lmx.service.impl.LaborContractService#update(lmx.entities.LaborContract)
	 */
	@Override
	public void update(LaborContract laborContract) {
		databaseOpeLab.update(laborContract);
	}

	/* (non-Javadoc)
	 * @see lmx.service.impl.LaborContractService#delete(int)
	 */
	@Override
	public void delete(int userid) {
		databaseOpeLab.delete(databaseOpeLab.getById("from LaborContract where userid = :userid", userid,"userid"));
	}
	
	/* (non-Javadoc)
	 * @see lmx.service.impl.LaborContractService#getLaborContractList(int)
	 */
	@Override
	public Page<LaborContract> getLaborContractList(int requestpage,String[] columns,String[] params,String[] order){
		pageHibernateCallback.set("from LaborContract", columns, params, order, (requestpage - 1) * page.getLimit(), page.getLimit(),LaborContract.class);
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
		pageHibernateCallback.set("from LaborContract", columns, params, order, (requestpage - 1) * page.getLimit(), page.getLimit(),LaborContract.class);
		page.setList(pageHibernateCallback.getList());
		return (Page<LaborContract>) page;
	}
	
	public void fillEmail(List<LaborContract> list){
		for(int i = 0;i < list.size();i++){
			list.get(i).setEmail(databaseOpeEmp.getById("from Employee where userid = :userid", list.get(i).getUserid(),"userid").getEmail());
		}
	}
	
	public List<LaborContract> getLimintTime(Date beginTime,Date endTime){
		pageHibernateCallback.set(null , null, null, null, 0, 0,LaborContract.class);
		List<LaborContract> list = pageHibernateCallback.getAllLimintList("deadline",beginTime, endTime);
		fillEmail(list);
		return list;
	}
}
