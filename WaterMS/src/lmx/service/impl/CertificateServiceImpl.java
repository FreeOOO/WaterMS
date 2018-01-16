package lmx.service.impl;

import java.util.Date;
import java.util.List;

import lmx.dao.impl.DatabaseOpe;
import lmx.dao.impl.PageHibernateCallback;
import lmx.entities.Certificate;
import lmx.entities.Employee;
import lmx.entities.Page;
import lmx.service.CertificateService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class CertificateServiceImpl implements CertificateService {
	@Autowired
	private DatabaseOpe<Certificate> databaseOpeCer;
	@Autowired
	private Page<Certificate> page;
	@Autowired
	private PageHibernateCallback<Certificate> pageHibernateCallback;
	@Autowired
	private DatabaseOpe<Employee> databaseOpeEmp;
	
	/* (non-Javadoc)
	 * @see lmx.service.impl.CertificateService#save(lmx.entities.Certificate)
	 */
	@Override
	public void save(Certificate certificate){
		databaseOpeCer.save(certificate);
	}
	
	/* (non-Javadoc)
	 * @see lmx.service.impl.CertificateService#getCertificateById(long)
	 */
	@Override
	public Certificate getCertificateById(long id){
		return databaseOpeCer.getById("from Certificate where cerid = :cerid", id,"cerid");
	}

	/* (non-Javadoc)
	 * @see lmx.service.impl.CertificateService#update(lmx.entities.Certificate)
	 */
	@Override
	public void update(Certificate certificate) {
		databaseOpeCer.update(certificate);
	}

	/* (non-Javadoc)
	 * @see lmx.service.impl.CertificateService#delete(int)
	 */
	@Override
	public void delete(int id) {
		databaseOpeCer.delete(databaseOpeCer.getById("from Certificate where cerid = :cerid", id,"cerid"));
	}
	
	/* (non-Javadoc)
	 * @see lmx.service.impl.CertificateService#getCertificateList(int)
	 */
	@Override
	public Page<Certificate> getCertificateList(int requestpage,String[] columns,String[] params,String[] order){
		pageHibernateCallback.set("from Certificate", columns, params, order, (requestpage - 1) * page.getLimit(), page.getLimit(),Certificate.class);
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
		pageHibernateCallback.set("from Certificate", columns, params, order, (requestpage - 1) * page.getLimit(), page.getLimit(),Certificate.class);
		page.setList(pageHibernateCallback.getList());
		return (Page<Certificate>) page;
	}
	
	public long getJetlag(Date date){
		Date begin = new Date();
		long between=(date.getTime()-begin.getTime())/1000;//除以1000是为了转换成秒
		long day=between/(24*3600);
		return day;
	}
	
	public void setPageJetLag(Page<Certificate> page){
		List<Certificate> list = page.getList();
		for(int i = 0;i < list.size();i++){
			page.getList().get(i).setJetlag(this.getJetlag(list.get(i).getValiditydeadline()));
		}
		//return page;
	}
	
	public void fillEmail(List<Certificate> list){
		for(int i = 0;i < list.size();i++){
			list.get(i).setEmail(databaseOpeEmp.getById("from Employee where userid = :userid", list.get(i).getUserid(),"userid").getEmail());
		}
	}
	
	public List<Certificate> getLimintTime(Date beginTime,Date endTime){
		pageHibernateCallback.set(null , null, null, null, 0, 0,Certificate.class);
		List<Certificate> list = pageHibernateCallback.getAllLimintList("validitydeadline",beginTime, endTime);
		fillEmail(list);
		return list;
	}
	
	/*public Certificate find(long id){
		List<Certificate> list = certificateDaoImpl.listCertificate(id);
		if(list.size() < 1){
			return null;
		}else{
			return list.get(0);
		}
	}*/
}
