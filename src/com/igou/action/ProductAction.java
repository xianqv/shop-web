package com.igou.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.igou.pojos.Attribute;
import com.igou.pojos.Brand;
import com.igou.pojos.Product;
import com.igou.pojos.ProductType;
import com.igou.service.ProductService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class ProductAction extends ActionSupport implements ServletRequestAware {
	private Product product;
	private Brand brand;
	private ProductType type;
	private Attribute attribute;
	private List<Object> brandlist = new ArrayList<>();
	private List<Object> typeList = new ArrayList<>();
	private List<Object> productList = new ArrayList<>();
	private ProductService productService;
	private File image;
	private String imageFileName;
	private HttpServletRequest request;

	public File getImage() {
		return image;
	}

	public List<Object> getProductList() {
		return productList;
	}

	public void setProductList(List<Object> productList) {
		this.productList = productList;
	}

	public Attribute getAttribute() {
		return attribute;
	}

	public void setAttribute(Attribute attribute) {
		this.attribute = attribute;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public ProductService getProductService() {
		return productService;
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

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public ProductType getType() {
		return type;
	}

	public void setType(ProductType type) {
		this.type = type;
	}

	public List<Object> getBrandlist() {
		return brandlist;
	}

	public void setBrandlist(List<Object> brandlist) {
		this.brandlist = brandlist;
	}

	public List<Object> getTypeList() {
		return typeList;
	}

	public void setTypeList(List<Object> typeList) {
		this.typeList = typeList;
	}

	public String save() throws IOException {
		// TODO Auto-generated method stub
		type = (ProductType) productService.findTypeById(type.getId());
		brand = (Brand) productService.findBrandById(brand.getId());
		product.setType(type);
		product.setBrands(brand);
		product.setAttribute(attribute);
		product.setIsSale(0);
		// 图片保存目录 根目录的 productshowimg
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/productShowImg");
		System.out.println(realpath);
		File savefile = new File(new File(realpath), imageFileName);
		if (!savefile.getParentFile().exists()) {
			savefile.getParentFile().mkdirs();
		}
		FileUtils.copyFile(image, savefile);
		product.setImgUrl("productShowImg" + "/" + imageFileName);
		productService.save(product);
		return null;
	}

	public String add() {
		// TODO Auto-generated method stub
		brandlist = productService.findAllBrand();
		ServletActionContext.getRequest().setAttribute("brandlist", brandlist);
		typeList = productService.findAllTypes();
		ServletActionContext.getRequest().setAttribute("typeList", typeList);
		return Action.SUCCESS;
	}

	public String list() {
		productList = productService.findAllProduct();
		ServletActionContext.getRequest().setAttribute("productList",
				productList);
		return Action.SUCCESS;
	}

	public String delete() {
		System.out.println("---------->" + product.getId());
		productService.delete(product.getId());

		return "list";
	}

	public String modify() {
		product = (Product) productService.findProductById(product.getId());
		return Action.SUCCESS;
	}

	public String update() {
		System.out.println("--------->>>" + product.getId());
		product.setAttribute(attribute);

		productService.update(product);
		return "list";
	}

	public String toJson() throws IOException {
		// productList = productService.findAllProduct();
		product = (Product) productService.findProductById(4);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray sArray = JSONArray.fromObject(product, jsonConfig);
		// String result = JSONUtils.toJSONString(brandList);
		String result = sArray.toString();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
		response.getWriter().close();
		return null;
	}

	public String returnProductById() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();

		System.out.println("888888888899");
		Integer id = Integer.parseInt(request.getParameter("product_id"));
		product = (Product) productService.findProductById(id);
		System.out.println("——————————————————》》"
				+ product.getAttribute().toString() + "----"
				+ product.getSizes().toString());

		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONObject fromObject = JSONObject.fromObject(product, jsonConfig);
		System.out.println("=====" + fromObject.toString());
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(fromObject.toString());
		response.getWriter().close();
		return null;
	}

	public String search(){
		try {
			String value = new String(request.getParameter("searchValue").getBytes("iso-8859-1"), "utf-8");
			JSONObject jsonObject = productService.search(value);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(jsonObject.toString());
			response.getWriter().flush();
		}catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}

}
