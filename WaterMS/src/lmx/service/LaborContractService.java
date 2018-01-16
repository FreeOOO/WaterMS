package lmx.service;

import java.util.Date;
import java.util.List;

import lmx.entities.LaborContract;
import lmx.entities.Page;

public interface LaborContractService {

	/* (non-Javadoc)
	 * @see lmx.service.impl.LaborContractService#save(lmx.entities.LaborContract)
	 */
	public abstract void save(LaborContract laborContract);

	public abstract LaborContract getLaborContractById(long id);

	public abstract void update(LaborContract laborContract);

	public abstract void delete(int userid);

	public abstract Page<LaborContract> getLaborContractList(int requestpage,String[] columns,String[] params,String[] order);
	
	public abstract List<LaborContract> getLimintTime(Date beginTime,Date endTime);

}