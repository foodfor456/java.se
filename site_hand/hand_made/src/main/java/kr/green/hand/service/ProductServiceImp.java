package kr.green.hand.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.hand.dao.ProductDAO;

@Service
public class ProductServiceImp implements ProductService{
	@Autowired
	ProductDAO productDao;
	@Override
	public boolean categoryInsertL(String cl_name) {
		if(cl_name == null || cl_name == "")
			return false;
		productDao.categoryInsertL(cl_name);
			return true;
		
	}
	@Override
	public ArrayList<String> getCategoryL() {
		
		return productDao.getCategoryL();
	}
	@Override
	public boolean categoryInsertS(String cl_name, String cs_name) {
		if(cl_name == null || cs_name == null)
			return false;
		
		productDao.categoryInsertS(cl_name, cs_name);
		return  true;
	}

}
