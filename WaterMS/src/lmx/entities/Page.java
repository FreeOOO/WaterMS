package lmx.entities;

import java.util.List;

public class Page<T> {
	private int page;// 当前页
	private int tatalPage;// 总页数
	private long counts;// 总记录数
	private int limit;// 每页记录数
	private List<T> list;// 要分页的集合

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTatalPage() {
		return tatalPage;
	}

	public void setTatalPage(int tatalPage) {
		this.tatalPage = tatalPage;
	}

	public long getCounts() {
		return counts;
	}

	public void setCounts(long counts) {
		this.counts = counts;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

}
