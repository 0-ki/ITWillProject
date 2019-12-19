package com.doArtShow.dao;

import javax.sql.DataSource;

// 리뷰 정보 dao
public class ReviewDao {
	DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}
}
