package com.sgy.dao;

import java.sql.SQLException;
import java.util.List;

import com.sgy.domain.Notice;

public interface NoticeDao {
	public List<Notice> selectAllNotices() throws SQLException;
	public boolean insertNotice(Notice notice) throws SQLException;
	public boolean updataByIdNotice(int id,Notice notice) throws SQLException;
	public Notice selectByIdNotice(int id) throws SQLException;
	public boolean DeleteByIdNotice(int id) throws SQLException;
}
