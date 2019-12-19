package com.doArtShow.dao;

import javax.sql.DataSource;

// 가고 싶은 전시 dao
public class WishListDao {
DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}
}
