package com.som.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.som.dao.IExRecordDao;
import com.som.entity.ExRecord;

@Service
public class ExRecordService {

	@Resource 
	IExRecordDao exRecordDao;
	
	public void addExRecord(ExRecord exRecord){
		exRecordDao.add(exRecord);
	}
	
	public ExRecord findByExnum(String exnum){
		return exRecordDao.findByExnum(exnum);
	}
}
