package com.som.dao;

import com.som.entity.LuckNumber;

public interface ILuckNumDao {

	public LuckNumber findByLuckNum(String luckNum);
	
	public void add(LuckNumber luckNum);
}
