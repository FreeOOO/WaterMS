package lmx.dao.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class PageHibernateCallback<T> {
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unused")
	private String hql;// hql语句
	private String[] columns;
	private String[] params;// 根据对象数组参数查询如firstId
	private String[] order;
	private int startIndex;// 开始查询记录处
	private int pageSize;// 每页记录数
	@SuppressWarnings("rawtypes")
	private Class object;
	private Criteria criteria;

	@SuppressWarnings("rawtypes")
	public void set(String hql, String[] columns, String[] params,
			String[] order, int startIndex, int pageSize, Class object) {
		this.hql = hql;
		this.columns = columns;
		this.params = params;
		this.order = order;
		this.startIndex = startIndex;
		this.pageSize = pageSize;
		this.object = object;

		setCriteria();
	}

	private void setCriteria() {
		criteria = sessionFactory.getCurrentSession().createCriteria(object,"o");
		try {
			if (columns != null && params != null) {
				DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
				for (int i = 0; i < columns.length; i++) {
					if (params[i] == "")
						continue;
					else if(columns[i].indexOf("date") != -1 || columns[i].indexOf("Date") != -1){
						criteria.add(Restrictions.eq(columns[i],fmt.parse(params[i])));
					}else if(columns[i].equals("userid"))
						criteria.add(Restrictions.eq(columns[i],Long.parseLong(params[i])));
				}
			}
			if (order != null) {
				for (int i = 0; i < order.length; i++)
					criteria.addOrder(Order.asc(order[i]));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public long getCount() {
		return ((Long) criteria.setProjection(Projections.rowCount())
				.uniqueResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<T> getList() {
		criteria.setFirstResult(startIndex);
		criteria.setMaxResults(pageSize);
		return criteria.list();
	}

	@SuppressWarnings({ "unchecked"})
	public List<T> getAllLimintList(String column,Date beginTime,Date endTime) {
		//Criteria criteria2 = criteria.createAlias("employee", "e");
		//criteria2.add(Restrictions.eqProperty("o.userid", "e.userid"));
		//DetachedCriteria sisCri = DetachedCriteria.forClass(Employee.class, "e");
		//sisCri.add(Property.forName("e.userid").eqProperty("o.userid"));
		if (beginTime != null) // 查询制定时间之后的记录
			criteria.add(Restrictions.ge(column, beginTime));
		if (endTime != null) // 查询指定时间之前的记录
			criteria.add(Restrictions.le(column, endTime));
		//criteria.add(Subqueries.exists(sisCri.setProjection(Projections.property("e.userid"))));
		return criteria.list();
	}
	/**
	 * 分页查询的方法
	 */
	/*
	 * @SuppressWarnings("unchecked") public List<T> doInHibernate(){ Query
	 * query = sessionFactory.getCurrentSession().createQuery(hql); if(params !=
	 * null){ for(int i = 0 ; i < params.length ; i++){ query.setParameter(i,
	 * params[i]); } } query.setFirstResult(startIndex);
	 * query.setMaxResults(pageSize); return query.list(); }
	 */

	/*
	 * @SuppressWarnings({ "unchecked", "rawtypes" }) public List<T>
	 * doInHibernateByCriteria(Class object){ Criteria criteria =
	 * sessionFactory.getCurrentSession().createCriteria(object); DateFormat fmt
	 * = new SimpleDateFormat("yyyy-MM-dd"); try { if(columns != null){ for(int
	 * i = 0;i < columns.length;i++){ if(params[i] == "") continue; else
	 * criteria.add(Restrictions.eq(columns[i], fmt.parse(params[i]))); } }
	 * criteria.add(Restrictions.eq("workDate", fmt.parse(params[0])));
	 * criteria.add(Restrictions.eq("datecompany", fmt.parse(params[1]))); }
	 * catch (ParseException e) { e.printStackTrace(); }
	 * criteria.setFirstResult(startIndex); criteria.setMaxResults(pageSize);
	 * return criteria.list(); }
	 */
}
