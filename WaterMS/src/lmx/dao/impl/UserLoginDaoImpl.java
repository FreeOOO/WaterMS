package lmx.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import lmx.dao.UserLoginDao;
import lmx.entities.UserLogin;

@Transactional
@Repository
public class UserLoginDaoImpl implements UserLoginDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	/* (non-Javadoc)
	 * @see lmx.dao.impl.UserDao#listUser(java.lang.String, java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<UserLogin> listUser(String phone,String password){
		Query query = sessionFactory.getCurrentSession().createQuery("from UserLogin where phone = :pk_phone and password = :pk_password");
		query.setString("pk_phone", phone);
		query.setString("pk_password", password);
		List<UserLogin> list = query.list();
		return list;
	}
}
