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

	@Value("#{sql['freeBoard.get']}")
	private String get;

	@Value("#{sql['freeBoard.update']}")
	private String update;

	@Value("#{sql['freeBoard.delete']}")
	private String delete;

	public int insert(FBBean fbBean) {
		return jdbcTmp.update(insert, fbBean.getUserId(), fbBean.getTitle(), fbBean.getContents());
	}

	public ArrayList<FBBean> getList(int start, int end) {
		ArrayList<FBBean> fbBean = (ArrayList<FBBean>) jdbcTmp.query(getList, new Integer[] { start, end },
				new FBMapper());
		return fbBean;
	}

	public int getCount() {
		return jdbcTmp.queryForInt(getCount);
	}

	public FBBean get(int idx) {
		FBBean fbBean = jdbcTmp.queryForObject(get, new Integer[] { idx }, new FBMapper());
		// (쿼리문, 쿼리문에사용될 변수, RowMapper)
		return fbBean;
	}

	public int update(FBBean fbBean) {
		return jdbcTmp.update(update, fbBean.getTitle(), fbBean.getContents(), fbBean.getIdx());
	}

	public int delete(int idx) {
		return jdbcTmp.update(delete, idx);
	}

	class FBMapper implements RowMapper<FBBean> {

		@Override
		public FBBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			FBBean fbBean = new FBBean(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getInt(6));
			return fbBean;
		}
	}

}
