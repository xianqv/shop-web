package com.igou.test;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.igou.app.pojos.Advert;
import com.igou.app.pojos.UserInfo;
import com.igou.pojos.Attribute;
import com.igou.pojos.Brand;
import com.igou.pojos.Color;
import com.igou.pojos.Product;
import com.igou.pojos.ProductImages;
import com.igou.pojos.ProductType;
import com.igou.pojos.Size;
import com.igou.tools.HibernateUtils;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// insertDate();
		// getDate();
		// insertProductImage();
		// getAllImage();
		// insert();
		// getProduct();
		getAllUser();
	}

	private static void getAllUser() {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSession();
		Transaction trans = session.beginTransaction();
		UserInfo user = (UserInfo) session.get(UserInfo.class, 2);
		trans.commit();
		session.close();
		System.out.println("-----" + user.getName());
	}

	private static void getProduct() {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSession();
		Transaction trans = session.beginTransaction();
		Product product = (Product) session.get(Product.class, 4);
		System.out.println("------->>>" + product.getSizes().toString());
		trans.commit();
		session.close();
	}

	private static void insert() {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSession();
		Transaction trans = session.beginTransaction();
		Advert a = new Advert();
		a.setDes("aaaa");
		a.setImageUrl("ssss");
		a.setLink("ssss");
		session.save(a);
		trans.commit();
		session.close();
	}

	private static void tocolor() {

	}

	private static void getDate() {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSession();
		Transaction trans = session.beginTransaction();
		Product p = (Product) session.get(Product.class, 1);
		Size ss = null;
		for (Size s : p.getSizes()) {
			ss = s;
		}
		System.out.println("-->" + p.getAddress() + "" + ss.getName());
	}

	// private static void insert() {
	// Session session = HibernateUtils.getSession();
	// Transaction trans = session.beginTransaction();
	// Advertisement a = new Advertisement();
	// a.setDescribe("aaaa");
	// a.setImageUrl("aaaa");
	// a.setJumpUrl("bbbb");
	// session.save(a);
	// trans.commit();
	// session.close();
	// }

	private static void insertDate() {
		// TODO Auto-generated method stub
		Product product = new Product();
		Brand brand = new Brand();
		Attribute attr = new Attribute();
		Color color = new Color();
		Size size = new Size();
		ProductType type = new ProductType();

		// 设置商品类型
		type.setName("运动");
		// 设置品牌
		brand.setName("李宁");
		brand.setIsbig(0);
		// 设置颜色与尺寸
		color.setName("黑色");
		color.setNum(20);
		color.setState(0);

		size.setName("xxl");
		size.setState(0);

		// 设置属性
		attr.setAdditional("好东西");
		// 设置商品
		product.setName("男士休闲外套");
		product.setPrice(200.0);
		product.setMarketDate("");
		product.setSaleNum(0);
		product.setModel("xxxx");
		product.setAddress("北京");

		Session session = HibernateUtils.getSession();
		Transaction trans = session.beginTransaction();
		session.save(color);
		session.save(product);
		session.save(brand);
		session.save(attr);
		session.save(size);
		session.save(type);

		type.getProducts().add(product);
		brand.getProducts().add(product);
		// product.getAttributes().add(attr);
		product.getSizes().add(size);
		size.getColors().add(color);
		// size.setProduct(product);
		// color.setSize(size);

		trans.commit();
		session.close();

	}

	public static void insertProductImage() {
		Session session = HibernateUtils.getSession();
		Transaction trans = session.beginTransaction();
		ProductImages images = new ProductImages();
		images.setImageUrl("aaaaa");
		session.save(images);
		trans.commit();
		session.clear();
	}

	public static void getAllImage() {
		Session session = HibernateUtils.getSession();
		Transaction trans = session.beginTransaction();
		Product product = (Product) session.get(Product.class, 4);
		trans.commit();
		System.out.println("" + product.getPrice());
	}
}
