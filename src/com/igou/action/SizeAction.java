package com.igou.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.igou.pojos.Color;
import com.igou.pojos.Product;
import com.igou.pojos.ProductImages;
import com.igou.pojos.Size;
import com.igou.service.ProductService;
import com.igou.service.SizeService;
import com.igou.tools.HibernateUtils;
import com.opensymphony.xwork2.Action;

public class SizeAction {
	private Product product;
	private Size size;
	private Color color;
	private List<Object> sizeList = new ArrayList<>();
	private List<Object> colorList = new ArrayList<>();
	private ProductService productService;
	private SizeService sizeService;
	private ProductImages productImages = new ProductImages();

	private File file;

	private String fileFileName;

	private String fileContentType;

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public SizeService getSizeService() {
		return sizeService;
	}

	public void setSizeService(SizeService sizeService) {
		this.sizeService = sizeService;
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

	public Size getSize() {
		return size;
	}

	public void setSize(Size size) {
		this.size = size;
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

	public List<Object> getSizeList() {
		return sizeList;
	}

	public void setSizeList(List<Object> sizeList) {
		this.sizeList = sizeList;
	}

	public List<Object> getColorList() {
		return colorList;
	}

	public void setColorList(List<Object> colorList) {
		this.colorList = colorList;
	}

	public String save() {
		product = (Product) productService.findProductById(product.getId());
		for (int i = 0; i < colorList.size(); i++) {
			size.getColors().add((Color) colorList.get(i));
		}
		System.out.println("-------->>>>" + size.getColors().size());
		return null;

	}

	public String addSize() {
		product = (Product) productService.findProductById(product.getId());
		ServletActionContext.getRequest().setAttribute("product", product);
		return Action.SUCCESS;
	}

	public String saveSize() {
		product = (Product) productService.findProductById(product.getId());
		product.getSizes().add(size);
		productService.update(product);
		return null;
	}

	public String add() {
		product = (Product) productService.findProductById(product.getId());
		ServletActionContext.getRequest().setAttribute("product", product);
		return Action.SUCCESS;
	}

	public String addColor() {
		product = (Product) productService.findProductById(product.getId());
		ServletActionContext.getRequest().setAttribute("product", product);
		return Action.SUCCESS;
	}

	public String saveColor() {
		product = (Product) productService.findProductById(product.getId());
		size = (Size) sizeService.findSizeById(size.getId());
		size.getColors().add(color);
		sizeService.update(size);
		return null;
	}

	public String addPic() throws Exception {

		Integer id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id"));

		System.out.println("----->>>" + id);
		product = (Product) productService.findProductById(id);

		String root = ServletActionContext.getServletContext().getRealPath(
				"/productImages");
		System.out.println(root);
		File savefile = new File(new File(root), this.getFileFileName());
		if (!savefile.getParentFile().exists()) {
			savefile.getParentFile().mkdirs();
		}
		FileUtils.copyFile(file, savefile);
		System.out.println("......." + product.getId());
		System.out.println("..." + fileFileName);
		productImages.setImageUrl("productImages" + "/" + fileFileName);
		productImages.setProduct(product);
		Session session = HibernateUtils.getSession();
		Transaction trans = session.beginTransaction();
		session.save(productImages);
		trans.commit();
		session.close();
		return null;
	}
}
