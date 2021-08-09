package com.sgy.domain;

import java.util.List;

public class PageBean<E> {
	private List<E> list;		//数据
	private Integer currPage;	//当前页码
	private Integer pageSize;	//一页显示多少件商品
	private Integer totalPage;	//总页数
	private Integer totalCount;	//总条数
	public List<E> getList() {
		return list;
	}
	public void setList(List<E> list) {
		this.list = list;
	}
	public Integer getCurrPage() {
		return currPage;
	}
	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalPage() {
		return (int)Math.ceil(totalCount*1.0/pageSize);
	}
	
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public PageBean() {	}
	public PageBean(List<E> list, Integer currPage, Integer pageSize, Integer totalCount) {
		super();
		this.list = list;
		this.currPage = currPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
	}
	
	
	
}
