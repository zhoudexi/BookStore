package com.sgy.dao;

import java.util.List;

import com.sgy.domain.Product;

public interface ProductDao {


	Product getBypid(String pid)throws Exception;

	List<Product> findByPage(int currPage, int pageSize)throws Exception;

	int getTotalCount()throws Exception;

	Product searchByName(String pname)throws Exception;

	Product searchById(String product_id);
	
	public List<Product>  searchAll();
	public List<Product> searchByName2(String name);

	boolean deleteProduct(String id);
	
}
