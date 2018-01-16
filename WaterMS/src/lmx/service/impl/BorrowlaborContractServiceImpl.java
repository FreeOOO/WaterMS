package lmx.service.impl;

import java.util.Date;

import lmx.dao.impl.DatabaseOpe;
import lmx.dao.impl.PageHibernateCallback;
import lmx.entities.BorrowlaborContract;
import lmx.entities.LaborContract;
import lmx.entities.Page;
import lmx.service.BorrowlaborContractService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class BorrowlaborContractServiceImpl implements BorrowlaborContractService {
	@Autowired
	private DatabaseOpe<BorrowlaborContract> databaseOpeBorLab;
	@Autowired
	private Page<BorrowlaborContract> page;
	@Autowired
	private PageHibernateCallback<BorrowlaborContract> pageHibernateCallback;
	@Autowired
	private DatabaseOpe<LaborContract> databaseOpeLab;
	
	@Override
	public void save(BorrowlaborContract borrowlaborContract){
		LaborContract laborContract = databaseOpeLab.getById("from LaborContract where userid = :userid", borrowlaborContract.getUserid(), "userid");
		laborContract.setWhetherrestitution("是");
		databaseOpeLab.update(laborContract);
		databaseOpeBorLab.save(borrowlaborContract);
	}
	
	@Override
	public BorrowlaborContract getBorrowlaborContractById(long borrowingID){
		return databaseOpeBorLab.getById("from BorrowlaborContract where borrowingID = :borrowingID", borrowingID,"borrowingID");
	}

	@Override
	public void update(BorrowlaborContract borrowlaborContract) {
		databaseOpeBorLab.update(borrowlaborContract);
	}

	@Override
	public void back(int borrowingID) {
		BorrowlaborContract borrowlaborContract = databaseOpeBorLab.getById("from BorrowlaborContract where borrowingID = :borrowingID", borrowingID, "borrowingID");
		LaborContract laborContract = databaseOpeLab.getById("from LaborContract where userid = :userid", borrowlaborContract.getUserid(), "userid");
		laborContract.setWhetherrestitution("否");
		databaseOpeLab.update(laborContract);
		Date date = new Date();
		borrowlaborContract.setDateofrecovery(date);
		borrowlaborContract.setWhetherrestitution("是");
		databaseOpeBorLab.update(borrowlaborContract);
	}
	
	@Override
	public Page<BorrowlaborContract> getBorrowlaborContractList(int requestpage,String[] columns,String[] params,String[] order){
		pageHibernateCallback.set("from BorrowlaborContract", columns, params, order, (requestpage - 1) * page.getLimit(), page.getLimit(),BorrowlaborContract.class);
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
		pageHibernateCallback.set("from BorrowlaborContract", columns, params, order, (requestpage - 1) * page.getLimit(), page.getLimit(),BorrowlaborContract.class);
		page.setList(pageHibernateCallback.getList());
		return (Page<BorrowlaborContract>) page;
	}
}
