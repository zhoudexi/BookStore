package com.sgy.service;

import java.sql.SQLException;
import java.util.List;

import com.sgy.domain.Notice;

public interface NoticeService {
	public List<Notice> findAllNotices() throws SQLException;
	public boolean addNotice(Notice notice) throws SQLException;
	public boolean editByIdNotice(int id,Notice notice) throws SQLException;
	public Notice findOneNotice(int id) throws SQLException;
	public boolean DeleteOneByidNotice(int id) throws SQLException;
}
