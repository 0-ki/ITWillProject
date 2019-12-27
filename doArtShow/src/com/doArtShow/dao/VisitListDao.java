package com.doArtShow.dao;

import javax.sql.DataSource;

// 갔다온 전시 정보 dao
public class VisitListDao {
	DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}
}
