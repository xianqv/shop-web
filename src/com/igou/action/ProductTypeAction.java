package com.igou.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.igou.pojos.Product;
import com.igou.pojos.ProductType;
import com.igou.service.ProductService;
import com.igou.service.ProductTypeService;
import com.opensymphony.xwork2.Action;

public class ProductTypeAction implements ServletRequestAware {
	private ProductType type;
	private List<Object> typeList = new ArrayList<>();
	private ProductTypeService productTypeService;
	private ProductService productService;
	private Product product;
	private List<Object> productlist;
	private HttpServletRequest request;

	public ProductService getProductService() {
		return productService;
	}

	public List<Object> getProductlist() {
		return productlist;
	}

	public void setProductlist(List<Object> productlist) {
		this.productlist = productlist;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public ProductTypeService getProductTypeService() {
		return productTypeService;
	}

	public void setProductTypeService(ProductTypeService productTypeService) {
		this.productTypeService = productTypeService;
	}

	public ProductType getType() {
		return type;
	}

	public void setType(ProductType type) {
		this.type = type;
	}

	public List<Object> getTypeList() {
		return typeList;
	}

	public void setTypeList(List<Object> typeList) {
		this.typeList = typeList;
	}

	public String save() {
		productTypeService.save(type);
		return null;
	}

	public String list() {
		typeList = productTypeService.findAll();
		ServletActionContext.getRequest().setAttribute("typeList", typeList);
		return Action.SUCCESS;
	}

	public String delete() {
		// System.out.println(type.getId());
		// productTypeService.delete
		return "list";

	}

	public String returnAllType() throws IOException {

		typeList = productTypeService.findAll();
		JSONArray array = new JSONArray();
		ProductType type;
		for (Object obj : typeList) {
			type = (ProductType) obj;
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("name", type.getName());
			jsonObject.put("id", type.getId());
			array.add(jsonObject);
		}

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(array.toString());
		response.getWriter().close();
		return null;
	}

	public String getProductsByTypeName() throws IOException {
		Integer id = Integer.parseInt(request.getParameter("type.id"));
		System.out.println("--------->>>>" + id);
		type = (ProductType) productTypeService.findTypeById(id);
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		Set<Product> products = type.getProducts();
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
