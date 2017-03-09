package com.som.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.som.dao.ILuckNumDao;
import com.som.entity.LuckNumber;

@Service
public class LuckNumService {
	@Resource
	ILuckNumDao luckNumDao;
	
	public LuckNumber checkNum(String luckNum){
		if(luckNumDao.findByLuckNum(luckNum)!=null){
			LuckNumber lucknum=luckNumDao.findByLuckNum(luckNum);
			return lucknum;
		}
		else{
			return null;
		}		
	}
	public void addLuckNum(LuckNumber luckNum){
		luckNumDao.add(luckNum);
	}
}

