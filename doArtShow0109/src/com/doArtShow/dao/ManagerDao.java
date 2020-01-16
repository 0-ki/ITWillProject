package com.doArtShow.dao;

import javax.sql.DataSource;

// 관리자 정보 dao
public class ManagerDao {
	DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}
}
