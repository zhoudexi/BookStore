package com.sgy.dao.Impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.sgy.dao.NoticeDao;
import com.sgy.domain.Notice;
import com.sgy.utils.DataSourceUtils;

public class NoticeDaolmpl implements NoticeDao {
	private QueryRunner runner = new  QueryRunner(DataSourceUtils.getDataSource() );
	@Override
	public List<Notice> selectAllNotices() throws SQLException {
		String sql = "select * from notice";
		List<Notice> notices = new ArrayList<Notice>();
		try {
			notices = (List<Notice>) runner.query(sql, new BeanListHandler<Notice>(Notice.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return notices;
	}

	@Override
	public boolean insertNotice(Notice notice) throws SQLException {
		String sql = "INSERT INTO notice (title,details) "
				+ "VALUES (?,?)";
		Object params[]={notice.getTitle(),notice.getDetails()};
		int result = 0 ;
		try {
			result=runner.update(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result==0?false:true;
	}

	@Override
	public boolean updataByIdNotice(int id, Notice notice) throws SQLException {
		String sql = "UPDATE notice SET title=?, details=? WHERE n_id=?";
		Object params[]={notice.getTitle(),notice.getDetails(),id};
		int result = 0 ;
		try {
			result=runner.update(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result==0?false:true;
	}

	@Override
	public Notice selectByIdNotice(int id) throws SQLException {
		String sql = "select * from notice where n_id="+id;
		Notice notice = new Notice();
		try {
			notice=runner.query(sql,new BeanHandler<Notice>(Notice.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return notice;
	}

	@Override
	public boolean DeleteByIdNotice(int id) throws SQLException {
		String sql = "delete from notice where n_id=?";
		int result = 0;
		try {
			result=runner.update(sql,id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result==0?false:true;
	}
	
}
