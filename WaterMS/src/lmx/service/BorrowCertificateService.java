package lmx.service;

import java.util.Date;
import java.util.List;

import lmx.entities.BorrowCertificate;
import lmx.entities.Page;

public interface BorrowCertificateService {

	/* (non-Javadoc)
	 * @see lmx.service.impl.BorrowCertificateService#save(lmx.entities.BorrowCertificate)
	 */
	public abstract void save(BorrowCertificate borrowCertificate);

	public abstract BorrowCertificate getBorrowCertificateById(long borrowingID);

	public abstract void update(BorrowCertificate borrowCertificate);

	public abstract void back(int borrowingID);

	public abstract Page<BorrowCertificate> getBorrowCertificateList(
			int requestpage,String[] columns,String[] params,String[] order);
	
	public abstract List<BorrowCertificate> getLimintTime(Date beginTime,Date endTime);
}