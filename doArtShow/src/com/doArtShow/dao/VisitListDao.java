package com.doArtShow.dao;

import javax.sql.DataSource;

// 갔다 온 싶은 전시 정보 dao
public class VisitListDao {
	DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}
}
