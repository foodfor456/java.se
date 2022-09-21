package kr.green.hand.service;

import java.util.ArrayList;

public interface ProductService {

	boolean categoryInsertL(String cl_name);

	ArrayList<String> getCategoryL();

	boolean categoryInsertS(String cl_name, String cs_name);

}
