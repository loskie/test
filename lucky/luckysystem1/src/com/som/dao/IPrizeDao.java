package com.som.dao;

import java.util.List;

import com.som.entity.Prize;


public interface IPrizeDao {
	
	public Prize findById(int id);
	
	public List<Prize> findByGrade(String grade);

	public void add(Prize prize);
	
	public List<Prize> findAll();
	
	public void deleteById(int id);
	
	public void update(Prize prize);
}
