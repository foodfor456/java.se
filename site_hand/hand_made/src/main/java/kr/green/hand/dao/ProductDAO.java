package kr.green.hand.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface ProductDAO {

	void categoryInsertL(String cl_name);

	ArrayList<String> getCategoryL();

	boolean categoryInsertS(@Param("cl_name")String cl_name, @Param("cs_name")String cs_name);
	
	
	
}
