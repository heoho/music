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

	@Value("#{sql['member.login']}")
	private String login;

	@Value("#{sql['member.get']}")
	private String get;
	
	@Value("#{sql['member.update']}")
	private String update;
	
	@Value("#{sql['member.delete']}")
	private String delete;
	
	@Value("#{sql['member.getCount']}")
	private String getCount;

	public int insert(MemberBean memberBean) {
		System.out.println(memberBean.getEmail1()+memberBean.getEmail2());
		return jdbcTmp.update(insert, 
				memberBean.getId(), memberBean.getPw(), memberBean.getName(), memberBean.getDay(), 
				memberBean.getCalendar(), memberBean.getGen(), memberBean.getEmail1()+"@"+memberBean.getEmail2(), memberBean.getTel());
	}

	public ArrayList<MemberBean> getList(int start, int end) {
		ArrayList<MemberBean> memberBean = (ArrayList<MemberBean>) jdbcTmp.query(getList, new Integer[] { start, end },
				new MemberBeanMapper());
		return memberBean;
	}

	public MemberBean login(String id, String pw) {
		MemberBean memberBean = jdbcTmp.queryForObject(login, new String[] { id, pw }, new MemberBeanMapper());
		return memberBean;
	}

	public MemberBean get(String id) {
		MemberBean memberBean = jdbcTmp.queryForObject(get, new String[] { id }, new MemberBeanMapper());
		// (쿼리문, 쿼리문에사용될 변수, RowMapper)
		return memberBean;
	}

	public int update(MemberBean memberBean) {
		return jdbcTmp.update(update, memberBean.getPw(), memberBean.getName(), memberBean.getId());
	}
	
	public int delete(String id) {
		return jdbcTmp.update(delete, id);
	}
	
	public int getCount() {
		return jdbcTmp.queryForInt(getCount);
	}

	class MemberBeanMapper implements RowMapper<MemberBean> {

		@Override
		public MemberBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			MemberBean memberBean = new MemberBean(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10));
			return memberBean;
		}
	}
}
