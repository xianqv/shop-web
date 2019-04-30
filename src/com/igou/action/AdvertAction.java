package com.igou.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.igou.app.pojos.Advert;
import com.igou.service.AdvertService;
import com.opensymphony.xwork2.Action;

public class AdvertAction {
	private AdvertService advertService;
	private Advert advert;
	private List<Object> advertlist;
	private File Brandimage;
	private String BrandimageFileName;
	String realpath = ServletActionContext.getServletContext().getRealPath(
			"/AdvertImage");

	public AdvertService getAdvertService() {
		return advertService;
	}

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

	public void setAdvertService(AdvertService advertService) {
		this.advertService = advertService;
	}

	public Advert getAdvert() {
		return advert;
	}

	public void setAdvert(Advert advert) {
		this.advert = advert;
	}

	public List<Object> getAdvertlist() {
		return advertlist;
	}

	public void setAdvertlist(List<Object> advertlist) {
		this.advertlist = advertlist;
	}

	public String save() throws IOException {

		File savefile = new File(new File(realpath), BrandimageFileName);
		if (!savefile.getParentFile().exists()) {
			savefile.mkdirs();
		}
		FileUtils.copyFile(Brandimage, savefile);
		advert.setImageUrl("AdvertImage" + "/" + BrandimageFileName);
		advertService.save(advert);
		return "list";
	}

	public String list() {
		advertlist = advertService.findAll();
		ServletActionContext.getRequest()
				.setAttribute("advertlist", advertlist);
		return Action.SUCCESS;
	}

	public String delete() {
		advertService.delete(advert.getId());
		return "list";
	}

	public String modify() {
		advert = (Advert) advertService.findAdvertById(advert.getId());
		ServletActionContext.getRequest().setAttribute("advert", advertlist);
		return Action.SUCCESS;
	}

	public String update() throws IOException {
		if (Brandimage == null) {

			advert.setImageUrl(((Advert) advertService.findAdvertById(advert
					.getId())).getImageUrl());
			advertService.update(advert);
		} else {
			File savefile = new File(new File(realpath), BrandimageFileName);
			if (!savefile.getParentFile().exists()) {
				savefile.mkdirs();
			}
			FileUtils.copyFile(Brandimage, savefile);
			advert.setImageUrl("AdvertImage" + "/" + BrandimageFileName);
			advertService.update(advert);
		}
		return "list";
	}

	public String returnAllAdvert() throws IOException {

		advertlist = advertService.findAll();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray sArray = JSONArray.fromObject(advertlist, jsonConfig);
		String result = sArray.toString();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
		response.getWriter().close();
		return null;
	}

}
