package com.sgy.factory;

import com.sgy.service.NoticeService;
import com.sgy.service.ProductService;
import com.sgy.service.Impl.NoticeServicelmpl;

public class ServiceFactory {
	public static NoticeService getNoticesServiceInstance() {
		return new NoticeServicelmpl();
	}
	
}
