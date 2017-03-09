package com.som.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.som.dao.IPrizeDao;
import com.som.entity.Prize;

@Service
public class PrizeService {
	@Resource
	private IPrizeDao prizeDao;
	
	
	
	public void addPrize(Prize prize){
		prizeDao.add(prize);
	}
	
	public void deletePrizeById(int id){
		prizeDao.deleteById(id);
	}
	
	public Prize findPrizeById(int id){
		return prizeDao.findById(id);
	}
	
	public List<Prize> findPrizeByGrade(String grade){
		return prizeDao.findByGrade(grade);
	}
	
	public List<Prize> findAllPrizes(){
		return prizeDao.findAll();
	}
	
	public void updatePrize(Prize prize){
		prizeDao.update(prize);
	}
	
}
