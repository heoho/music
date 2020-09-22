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
public class MemberDao {

	@Autowired
	private JdbcTemplate jdbcTmp;

	@Value("#{sql['member.insert']}")
	private String insert;

	public int insert(MemberBean memberBean) {
		return jdbcTmp.update(insert, memberBean.getId(), memberBean.getPw(), memberBean.getName());
	}
}
