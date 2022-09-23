package kr.green.hand.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.hand.dao.ProductDAO;
import kr.green.hand.pagination.Criteria;
import kr.green.hand.utils.UploadFileUtils;
import kr.green.hand.vo.CategoryVO;
import kr.green.hand.vo.FileVO;
import kr.green.hand.vo.MemberVO;
import kr.green.hand.vo.ProductVO;

@Service
public class ProductServiceImp implements ProductService{
	@Autowired
	ProductDAO productDao;
	String uploadPath = "E:\\uploadfiles\\HM";
	
	@Override
	public boolean categoryInsertL(String cl_name) {
		if(cl_name == null || cl_name == "")
			return false;
		productDao.categoryInsertL(cl_name);
			return true;
		
	}
	
	@Override
	public boolean categoryInsertS(String cl_name, String cs_name) {
		if(cl_name == null || cs_name == null)
			return false;
		
		productDao.categoryInsertS(cl_name, cs_name);
		return  true;
	}
	@Override
	public ArrayList<CategoryVO> getCategoryL() {
		return productDao.getCategoryL();
	}
	@Override
	public ArrayList<CategoryVO> getCategoryS(String cl_name) {
		if(cl_name == null)
			return null;
		return productDao.getCategoryS(cl_name);
	}
	@Override
	public int countCategory(String pr_code) {
		if(pr_code == null)
			return 0;
		return productDao.countCategory(pr_code);
	}
	@Override
	public String getCategoryCode(String ca_code, int pr_num) {
		int length = (int)(Math.log10(pr_num)+1);
		int count = 8 - ca_code.length() - length; 
		String num_str = "";
		if(ca_code != null & count != 8) {
			for(int i = 0; i < count ; i++)
				num_str += 0;
			ca_code += num_str + pr_num;
			return ca_code;
		}
		return null;
	}
	@Override
	public boolean productInsert(ProductVO product, MemberVO user, MultipartFile[] files) {
		if(product == null || user == null)
			return false;
		productDao.productInsert(product,user);
		
		insertFiles(files, "product", product.getPr_code());
		
		return true;
	}
	@Override
	public ArrayList<ProductVO> getProductList(Criteria cri) {
		if(cri == null)
			return null;
		cri.setPerPageNum(10);
		return productDao.getProductList(cri);
	}
	@Override
	public int getTotalcountPr(Criteria cri) {
		if(cri == null)
			cri = new Criteria();
		return productDao.getTotalcountPr(cri);
	}
	private void insertFiles(MultipartFile[] files, String fi_table, String fi_code) {
		if(files == null || files.length == 0)
			return;
		for(MultipartFile file : files) {
			if(file.getOriginalFilename().length() == 0)
				continue;
			try {
				String fi_name = UploadFileUtils.uploadFileUUID(uploadPath, file.getOriginalFilename(), file.getBytes());
				FileVO fileVo = new FileVO(fi_name, file.getOriginalFilename(), fi_table, fi_code);
				productDao.insertFile(fileVo);
				System.out.println(fileVo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	@Override
	public ProductVO selectProduct(String pr_code) {
		if(pr_code == null)
			return null;
		
		return productDao.selectProduct(pr_code);
	}
	@Override
	public ArrayList<FileVO> selectProductFile(String pr_code) {
		if(pr_code == null)
			return null;
		
		return productDao.selectProductFile(pr_code);
	}

	

}
