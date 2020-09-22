package com.hs.myapp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hs.myapp.MemberDao.MemberBeanMapper;

@Repository
public class MemberDao {

	@Autowired
	private JdbcTemplate jdbcTmp;

	@Value("#{sql['member.insert']}")
	private String insert;

	@Value("#{sql['member.getList']}")
	private String getList;

	public int insert(MemberBean memberBean) {
		return jdbcTmp.update(insert, memberBean.getId(), memberBean.getPw(), memberBean.getName());
	}

	public ArrayList<MemberBean> getList() {
		ArrayList<MemberBean> memberBean = (ArrayList<MemberBean>) jdbcTmp.query(getList, new MemberBeanMapper());
		return memberBean;
	}

	class MemberBeanMapper implements RowMapper<MemberBean> {

		@Override
		public MemberBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			MemberBean memberBean = new MemberBean(rs.getInt(1), rs.getString(2), rs.getString(3));
			return memberBean;
		}
	}
}
