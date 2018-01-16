package lmx.service;

import lmx.entities.BorrowlaborContract;
import lmx.entities.Page;

public interface BorrowlaborContractService {

	/* (non-Javadoc)
	 * @see lmx.service.impl.BorrowlaborContractService#save(lmx.entities.BorrowlaborContract)
	 */
	public abstract void save(BorrowlaborContract borrowlaborContract);

	public abstract BorrowlaborContract getBorrowlaborContractById(
			long borrowingID);

	public abstract void update(BorrowlaborContract borrowlaborContract);

	public abstract void back(int borrowingID);

	public abstract Page<BorrowlaborContract> getBorrowlaborContractList(
			int requestpage,String[] columns,String[] params,String[] order);
	
}