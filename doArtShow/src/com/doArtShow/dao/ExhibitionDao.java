package com.doArtShow.dao;

import javax.sql.DataSource;

// 전시 정보 dao
public class ExhibitionDao {
	DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}
}
