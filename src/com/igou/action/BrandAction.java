package com.igou.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.igou.pojos.Brand;
import com.igou.pojos.Product;
import com.igou.service.BrandService;
import com.opensymphony.xwork2.Action;

public class BrandAction implements ServletRequestAware {
	private Brand brand;
	private List<Object> brandList = new ArrayList<>();
	private BrandService brandService;
	private File Brandimage;
	private String BrandimageFileName;
	private HttpServletRequest request;

	public File getBrandimage() {
		return Brandimage;
	}

	public void setBrandimage(File brandimage) {
		Brandimage = brandimage;
	}

	public String getBrandimageFileName() {
		return BrandimageFileName;
	}

	public void setBrandimageFileName(String brandimageFileName) {
		BrandimageFileName = brandimageFileName;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public List<Object> getBrandList() {
		return brandList;
	}

	public void setBrandList(List<Object> brandList) {
		this.brandList = brandList;
	}

	public BrandService getBrandService() {
		return brandService;
	}

	public void setBrandService(BrandService brandService) {
		this.brandService = brandService;
	}

	public String save() throws IOException {
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/BrandImg");
		System.out.println(realpath);
		File savefile = new File(new File(realpath), BrandimageFileName);
		if (!savefile.getParentFile().exists()) {
			savefile.getParentFile().mkdirs();
		}
		FileUtils.copyFile(Brandimage, savefile);
		brand.setImgUrl("BrandImg" + "/" + BrandimageFileName);
		brandService.save(brand);
		return null;

	}

	public String list() {
		brandList = brandService.findAll();
		ServletActionContext.getRequest().setAttribute("brandList", brandList);
		return Action.SUCCESS;
	}

	public String toJson() throws IOException {
		brandList = brandService.findAll();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		// JSONArray sArray = JSONArray.fromObject(brandList, jsonConfig);
		// String result = sArray.toString();
		Brand brand;
		JSONArray array = new JSONArray();
		for (Object object : brandList) {
			brand = (Brand) object;
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", brand.getId());
			jsonObject.put("name", brand.getName());
			jsonObject.put("imgUrl", brand.getImgUrl());
			array.add(jsonObject);
		}

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(array.toString());
		response.getWriter().close();
		return null;
	}

	public String returnAllProById() throws IOException {
		Integer id = Integer.parseInt(request.getParameter("Brand_id"));
		System.out.println("--------->>>>" + id);
		brand = (Brand) brandService.findBrandById(id);
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		Set<Product> products = brand.getProducts();
		for (Product product : products) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", product.getId());
			jsonObject.put("name", product.getName());
			jsonObject.put("saleNum", product.getSaleNum());
			jsonObject.put("price", product.getPrice());
			jsonObject.put("imgUrl", product.getImgUrl());
			jsonArray.add(jsonObject);
		}
		json.put("products", jsonArray);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		System.out.println(json.toString() + "..");
		response.getWriter().write(json.toString());
		response.getWriter().close();

		return null;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}

}
