package com.bluewhale.pojo;

import java.util.List;

public class QueryVo<T> {
	private int currentPage;
	private int pageSize;
	private int total;
	private int totalPage;
	private int beginIndex;
	private List<T> queryList;
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int setTotalPage() {
		if (this.total % this.pageSize == 0) {
			this.totalPage = this.total / this.pageSize;
		}else {
			this.totalPage = this.total / this.pageSize + 1;
		}
		return this.totalPage;
	}
	public int setBeginIndex() {
		this.beginIndex = (this.currentPage-1)*this.pageSize;
		return this.beginIndex;
	}
	public List<T> getQueryList() {
		return queryList;
	}
	public void setQueryList(List<T> queryList) {
		this.queryList = queryList;
	}
}
