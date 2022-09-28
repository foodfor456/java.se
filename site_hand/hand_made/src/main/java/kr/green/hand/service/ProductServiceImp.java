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
import kr.green.hand.vo.WaitingVO;

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
		return true;
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

	@Override
	public CategoryVO getCategory(String pr_code) {
		if(pr_code == null)
			return null;
		String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		int cl_num = str.indexOf(pr_code.charAt(0))+1;
		int cs_num = str.indexOf(pr_code.charAt(1))+1;
		
		return productDao.getCategory(cl_num, cs_num);
	}

	@Override
	public ArrayList<FileVO> getFileList() {
		return productDao.getFileList();
	}

	@Override
	public ArrayList<CategoryVO> getCategoryList() {
		
		return productDao.getCategoryList();
	}

	@Override
	public ArrayList<CategoryVO> updateCategory(CategoryVO cl_name, ArrayList<CategoryVO> categoryS) {
		if(cl_name == null)
			return null;
		ArrayList<CategoryVO> category = new ArrayList<CategoryVO>();
		for(CategoryVO cas : categoryS) {
			if(cas.getCl_name().equals(cl_name.getCl_name()))
				category.add(cas);
		}
		return category;
	}
	@Override
	public ArrayList<FileVO> getDelFile(FileVO file) {
		if(file.getFi_code() == null || file.getFi_num() == null)
			return null;
		ArrayList<FileVO> fi = productDao.getDelFile(file);
		if(fi == null)
			return null;
		return fi;
	}

	@Override
	public boolean updateProduct(MemberVO user, MultipartFile[] files, ProductVO pr, int[] delFiles, String pr_num) {
		if(user == null || user.getMe_id() == null)
			return false;
		if(files != null)
			insertFiles(files, "product", pr.getPr_code());
		if(pr == null)
			return false;
		pr.setPr_me_id(user.getMe_id());
		if(delFiles != null) {
			for(Integer num : delFiles) {
				FileVO delFile = productDao.delFileInfo(num);
				if(delFile != null)
					deleteFile(delFile);
			}
		}
		updateFiles(pr_num, pr.getPr_code());
		productDao.updateProduct(pr,pr_num);
		return true;
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
	private void updateFiles(String fi_ori_code, String fi_code) {
				productDao.updateFile(fi_ori_code, fi_code);
	}
	private void deleteFile(FileVO fileVo) {
		if(fileVo == null)
			return;
		UploadFileUtils.deleteFile(uploadPath, fileVo.getFi_name());
		productDao.deleteFile(fileVo.getFi_num());
	}

	@Override
	public boolean insertWaiting(WaitingVO wa, MemberVO user, ProductVO pr) {
		if(wa == null || wa.getWp_state() == null)
			return false;
		if(user == null)
			return false;
		if(pr.getPr_waiting() == "Y")
			return false;
		pr.setPr_waiting("Y");
		productDao.insertWaiting(wa);
		productDao.updateProduct(pr, wa.getWp_pr_code());
		return true;
	}

	@Override
	public WaitingVO getWaiting(String pr_code) {
		if(pr_code == null)
			return null;
		return productDao.getWaiting(pr_code);
	}
	

}
