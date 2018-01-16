package lmx.service.impl;

import java.util.Date;
import java.util.List;

import lmx.dao.impl.DatabaseOpe;
import lmx.dao.impl.PageHibernateCallback;
import lmx.entities.BorrowCertificate;
import lmx.entities.Certificate;
import lmx.entities.Page;
import lmx.service.BorrowCertificateService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class BorrowCertificateServiceImpl implements BorrowCertificateService {
	@Autowired
	private DatabaseOpe<BorrowCertificate> databaseOpeBC;
	@Autowired
	private Page<BorrowCertificate> page;
	@Autowired
	private PageHibernateCallback<BorrowCertificate> pageHibernateCallback;
	@Autowired
	private DatabaseOpe<Certificate> databaseOpeCer;
	
	@Override
	public void save(BorrowCertificate borrowCertificate){
		Certificate certificate = databaseOpeCer.getById("from Certificate where cerid = :cerid", borrowCertificate.getCerid(), "cerid");
		certificate.setWhetherrestitution("是");
		databaseOpeCer.update(certificate);
		databaseOpeBC.save(borrowCertificate);
	}
	
	@Override
	public BorrowCertificate getBorrowCertificateById(long borrowingID){
		return databaseOpeBC.getById("from BorrowCertificate where borrowingID = :borrowingID", borrowingID,"borrowingID");
	}

	@Override
	public void update(BorrowCertificate borrowCertificate) {
		databaseOpeBC.update(borrowCertificate);
	}

	@Override
	public void back(int borrowingID) {
		BorrowCertificate borrowCertificate = databaseOpeBC.getById("from BorrowCertificate where borrowingID = :borrowingID", borrowingID,"borrowingID");
		Certificate certificate = databaseOpeCer.getById("from Certificate where cerid = :cerid", borrowCertificate.getCerid(), "cerid");
		certificate.setWhetherrestitution("否");
		databaseOpeCer.update(certificate);
		Date date = new Date();
		borrowCertificate.setClosingdatecard(date);
		borrowCertificate.setWhetherrestitution("是");
		databaseOpeBC.update(borrowCertificate);
	}
	
	@Override
	public Page<BorrowCertificate> getBorrowCertificateList(int requestpage,String[] columns,String[] params,String[] order){
		pageHibernateCallback.set("from BorrowCertificate", columns, params, order, (requestpage - 1) * page.getLimit(), page.getLimit(),BorrowCertificate.class);
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
		pageHibernateCallback.set("from BorrowCertificate", columns, params, order, (requestpage - 1) * page.getLimit(), page.getLimit(),BorrowCertificate.class);
		page.setList(pageHibernateCallback.getList());
		return (Page<BorrowCertificate>) page;
	}
	
	public List<BorrowCertificate> getLimintTime(Date beginTime,Date endTime){
		pageHibernateCallback.set(null , null, null, null, 0, 0,BorrowCertificate.class);
		List<BorrowCertificate> list = pageHibernateCallback.getAllLimintList("borrowingDate",beginTime, endTime);
		return list;
	}
}
