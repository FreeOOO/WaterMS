package lmx.service;

import java.util.Date;
import java.util.List;

import lmx.entities.Certificate;
import lmx.entities.Page;

public interface CertificateService {

	public abstract void save(Certificate certificate);

	public abstract Certificate getCertificateById(long id);

	public abstract void update(Certificate certificate);

	public abstract void delete(int userid);

	public abstract Page<Certificate> getCertificateList(int requestpage,String[] columns,String[] params,String[] order);
	
	public abstract void setPageJetLag(Page<Certificate> page);
	
	public abstract List<Certificate> getLimintTime(Date beginTime,Date endTime);

	//public abstract Certificate find(long id);
}