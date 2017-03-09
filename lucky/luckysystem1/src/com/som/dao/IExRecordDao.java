package com.som.dao;

import com.som.entity.ExRecord;

public interface IExRecordDao {
	
	public void add (ExRecord exRecord);
	
	public ExRecord findByExnum(String exnum);

}
