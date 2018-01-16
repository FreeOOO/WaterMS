package lmx.service.impl;

import java.util.List;

import lmx.dao.UserLoginDao;
import lmx.entities.UserLogin;
import lmx.service.UserLoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class UserLoginServiceImpl implements UserLoginService {
	@Autowired
	private UserLoginDao userLoginDaoImpl;
	
	/* (non-Javadoc)
	 * @see lmx.service.impl.UserService#find(java.lang.String, java.lang.String)
	 */
	@Override
	public String find(String phone,String password){
		List<UserLogin> list = userLoginDaoImpl.listUser(phone, password);
		if(list.size() < 1){
			return "null";
		}else{
			return list.get(0).getCompetence();
		}
	}
}
