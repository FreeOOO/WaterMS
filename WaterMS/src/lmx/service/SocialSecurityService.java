package lmx.service;

import java.util.Date;
import java.util.List;

import lmx.entities.Page;
import lmx.entities.SocialSecurity;

public interface SocialSecurityService {

	public abstract SocialSecurity getSocialSecurityById(long id);

	public abstract Page<SocialSecurity> getSocialSecurityList(int requestpage,String[] columns,String[] params,String[] order);
	
	public abstract void fillSocialSecurity();
	
	public abstract List<SocialSecurity> getLimintTime(Date beginTime,Date endTime);
}