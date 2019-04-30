package com.igou.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;

import com.igou.app.pojos.ProductClassify;
import com.igou.pojos.Product;
import com.igou.service.ProductClassifyService;
import com.igou.service.ProductService;
import com.opensymphony.xwork2.Action;

public class ProductClassifyAction {
	private ProductClassifyService productClassifyService;
	private ProductService productService;
	private ProductClassify productClassify;
	private List<Object> list, productlist;
	private int[] proids;
	private Product product;

	public ProductClassify getProductClassify() {
		return productClassify;
	}

	public int[] getProids() {
		return proids;
	}

	public void setProids(int[] proids) {
		this.proids = proids;
	}

	public List<Object> getProductlist() {
		return productlist;
	}

	public void setProductlist(List<Object> productlist) {
		this.productlist = productlist;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public List<Object> getList() {
		return list;
	}

	public void setList(List<Object> list) {
		this.list = list;
	}

	public void setProductClassify(ProductClassify productClassify) {
		this.productClassify = productClassify;
	}

	public ProductClassifyService getProductClassifyService() {
		return productClassifyService;
	}

	public void setProductClassifyService(
			ProductClassifyService productClassifyService) {
		this.productClassifyService = productClassifyService;
	}

	public String save() {

		productClassifyService.save(productClassify);
		return "list";

	}

	public String delete() {
		productClassifyService.delete(productClassify.getId());
		return "list";
	}

	public String list() {
		list = productClassifyService.getAll();
		ServletActionContext.getRequest().setAttribute("list", list);
		return Action.SUCCESS;
	}

	public String prolist() {
		productClassify = (ProductClassify) productClassifyService
				.findCLassifyById(productClassify.getId());

		System.out.println("---->" + productClassify.getProducts());

		// for (Product pro : productClassify.getProducts()) {
		// productlist.add(pro);
		// }

		ServletActionContext.getRequest().setAttribute("productlist",
				productClassify.getProducts());

		return Action.SUCCESS;
	}

	public String modify() {
		productClassify = (ProductClassify) productClassifyService
				.findCLassifyById(productClassify.getId());
		ServletActionContext.getRequest().setAttribute("productClassify",
				productClassify);
		return Action.SUCCESS;
	}

	public String update() {
		productClassifyService.update(productClassify);
		return "list";
	}

	public String add() {
		System.out.println("------------>>>" + productClassify.getId());
		productClassify = (ProductClassify) productClassifyService
				.findCLassifyById(productClassify.getId());
		productClassify.getProducts().add(
				(Product) productService.findProductById(product.getId()));
		productClassifyService.update(productClassify);
		return "list";
	}

	public String prodelete() {
		productClassify = (ProductClassify) productClassifyService
				.findCLassifyById(productClassify.getId());
		productClassify.getProducts().remove(
				productService.findProductById(product.getId()));
		return "list";
	}

	public String addpro() {
		productClassify = (ProductClassify) productClassifyService
				.findCLassifyById(productClassify.getId());
		productlist = productService.findAllProduct();
		ServletActionContext.getRequest().setAttribute("productlist",
				productlist);
		ServletActionContext.getRequest().setAttribute("productClassify",
				productClassify);
		return Action.SUCCESS;
	}

	public String addmore() {
		System.out.println(">>>>>>>");
		System.out.println(">>>>>>>" + productClassify.getId());
		productClassify = (ProductClassify) productClassifyService
				.findCLassifyById(productClassify.getId());

		for (int i = 0; i < proids.length; i++) {
			productClassify.getProducts().add(
					(Product) productService.findProductById(proids[i]));
		}
		productClassifyService.update(productClassify);
		return "list";
	}

	public String returnAllClassify() throws IOException {

		list = productClassifyService.getAll();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray sArray = JSONArray.fromObject(list, jsonConfig);
		String result = sArray.toString();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
		response.getWriter().close();
		return null;
	}
}
