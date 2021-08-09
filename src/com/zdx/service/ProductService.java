package com.sgy.service;

import java.util.List;

import com.sgy.domain.PageBean;
import com.sgy.domain.Product;

public interface ProductService {


	Product getBypid(String pid)throws Exception;

	PageBean<Product> findBypage(int currPage, int pageSize)throws Exception;

	Product searchByName(String pname)throws Exception;

}
