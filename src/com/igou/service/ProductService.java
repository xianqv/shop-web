package com.igou.service;

import java.util.ArrayList;
import java.util.List;

import com.igou.dao.ProductDao;
import com.igou.pojos.Brand;
import com.igou.pojos.Product;
import com.igou.pojos.ProductType;
import net.sf.json.JSONObject;

public class ProductService {
	private ProductDao productDao;

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public List<Object> findAllBrand() {
		// TODO Auto-generated method stub
		return productDao.findAllBrand();
	}

	public List<Object> findAllTypes() {
		// TODO Auto-generated method stub
		return productDao.findAllTypes();
	}

	public Object findTypeById(Integer id) {
		// TODO Auto-generated method stub
		return productDao.findById(ProductType.class, id);
	}

	public Object findBrandById(Integer id) {
		// TODO Auto-generated method stub
		return productDao.findById(Brand.class, id);
	}

	public void save(Object object) {
		// TODO Auto-generated method stub
		productDao.save(object);
	}

	public List<Object> findAllProduct() {
		// TODO Auto-generated method stub
		return productDao.getAll("from Product");
	}

	public void delete(Integer id) {
		// TODO Auto-generated method stub
		productDao.delete(Product.class, id);
	}

	public Object findProductById(Integer id) {
		// TODO Auto-generated method stub
		return productDao.findById(Product.class, id);
	}

	public void update(Object object) {
		// TODO Auto-generated method stub
		productDao.update(object);
	}

	public JSONObject search(String value) {
		JSONObject jsonObject = new JSONObject();
		List<Product> products = new ArrayList<>();
		try {
			if (value == null || value.equals("")){
				jsonObject.put("success",0);
				jsonObject.put("msg","搜索内容不能为空!");
				return  jsonObject;
			}
			List<Object> list = productDao.findByHQL("from Product where name like '%"+value+"%'", null);
			System.out.print("==============>>"+value);
			Product product = null;
			for (Object object:list){
				Product pro = (Product) object;
				product = new Product();
				product.setId(pro.getId());
				product.setImgUrl(pro.getImgUrl());
				product.setName(pro.getName());
				product.setPrice(pro.getPrice());
				products.add(product);
			}
			if (list !=null && products.size()>=1){
				jsonObject.put("success",1);
				jsonObject.put("msg","共"+products.size()+"条数据!");
				jsonObject.put("products",products);
				return jsonObject;
			}else {
				jsonObject.put("success",0);
				jsonObject.put("msg","搜索内容为空!");
				return jsonObject;
			}
		}catch (Exception e){
			e.printStackTrace();
			jsonObject.put("success",0);
			jsonObject.put("msg","系统异常！");
			return jsonObject;
		}

	}
}
