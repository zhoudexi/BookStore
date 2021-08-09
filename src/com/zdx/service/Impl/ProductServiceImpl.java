package com.sgy.service.Impl;

import java.util.List;

import com.sgy.dao.ProductDao;
import com.sgy.dao.Impl.ProductDaoImpl;
import com.sgy.domain.PageBean;
import com.sgy.domain.Product;
import com.sgy.service.ProductService;

public class ProductServiceImpl implements ProductService {



	//商品详情
	@Override
	public Product getBypid(String pid) throws Exception {
		ProductDao dao=new ProductDaoImpl();
		return dao.getBypid(pid);
	}

	/**
	 * 所有商品
	 */
	@Override
	public PageBean<Product> findBypage(int currPage, int pageSize) throws Exception {
		ProductDao dao=new ProductDaoImpl();
		//当前页数据
		List<Product> list=dao.findByPage(currPage, pageSize);
		
		//总条数
		int totalCount=dao.getTotalCount();
		return new PageBean<>(list, currPage, pageSize, totalCount);
	}

	/**
	 * 搜索商品
	 */
	@Override
	public Product searchByName(String name) throws Exception {
		ProductDao dao=new ProductDaoImpl();
		return dao.searchByName(name);
	}

}
