package lmx.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class DatabaseOpe<T> {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public void save(T objectt){
		this.getSession().save(objectt);
	}
	
	@SuppressWarnings("unchecked")
	public T getById(String hql,long id,String column){
		Query query = this.getSession().createQuery(hql);
		query.setParameter(column, id);
		return (T) query.uniqueResult();
	}
	
	public void delete(T objectt) {
		this.getSession().delete(objectt);
	}
	
	public void update(T object) {
		this.getSession().update(object);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<T> getList(Class object,String column,long id){
		Criteria criteria = this.getSession().createCriteria(object);
		criteria.add(Restrictions.eq(column,id));
		return criteria.list();
	}
}
