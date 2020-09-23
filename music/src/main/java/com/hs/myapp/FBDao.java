package com.hs.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FBDao {

	@Autowired
	private JdbcTemplate jdbcTmp;

	@Value("#{sql['freeBoard.insert']}")
	private String insert;
	
	public int insert(FBBean fbBean) {
		return jdbcTmp.update(insert,  fbBean.getUserId(), fbBean.getTitle(), fbBean.getContents());
	}

}
