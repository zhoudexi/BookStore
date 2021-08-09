package com.sgy.service.Impl;

import java.sql.SQLException;
import java.util.List;

import com.sgy.domain.Notice;
import com.sgy.factory.DaoFactory;
import com.sgy.service.NoticeService;

public class NoticeServicelmpl implements NoticeService {

	@Override
	public List<Notice> findAllNotices() throws SQLException {
		return DaoFactory.getNoticeDaoInstance().selectAllNotices();
	}

	@Override
	public boolean addNotice(Notice notice) throws SQLException {
		return DaoFactory.getNoticeDaoInstance().insertNotice(notice);
	}

	@Override
	public boolean editByIdNotice(int id,Notice notice) throws SQLException {
		// TODO Auto-generated method stub
		return DaoFactory.getNoticeDaoInstance().updataByIdNotice(id, notice);
	}

	@Override
	public Notice findOneNotice(int id) throws SQLException {
		// TODO Auto-generated method stub
		return DaoFactory.getNoticeDaoInstance().selectByIdNotice(id);
	}
	
	public boolean DeleteOneByidNotice(int id) throws SQLException {
		return DaoFactory.getNoticeDaoInstance().DeleteByIdNotice(id);
	}

}
