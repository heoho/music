package com.hs.myapp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class FBDao {

	@Autowired
	private JdbcTemplate jdbcTmp;

	@Value("#{sql['freeBoard.insert']}")
	private String insert;
	
	@Value("#{sql['freeBoard.getList']}")
	private String getList;
	
	@Value("#{sql['freeBoard.getCount']}")
	private String getCount;
	
	public int insert(FBBean fbBean) {
		return jdbcTmp.update(insert,  fbBean.getUserId(), fbBean.getTitle(), fbBean.getContents());
	}
	
	public ArrayList<FBBean> getList(int start, int end) {
		ArrayList<FBBean> fbBean = (ArrayList<FBBean>) jdbcTmp.query(getList, new Integer[] { start, end },
				new FBMapper());
		return fbBean;
	}
	
	public int getCount() {
		return jdbcTmp.queryForInt(getCount);
	}
	
	class FBMapper implements RowMapper<FBBean> {

		@Override
		public FBBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			FBBean fbBean = new FBBean(rs.getInt(1), rs.getString(2), rs.getString(4), rs.getString(5), rs.getInt(6));
			return fbBean;
		}
	}

}
