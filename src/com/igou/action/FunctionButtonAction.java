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

import com.igou.app.pojos.FunctionButton;
import com.igou.service.FunctionButtonService;
import com.opensymphony.xwork2.Action;

public class FunctionButtonAction {
	private FunctionButton button;
	private FunctionButtonService functionButtonService;
	private File Brandimage;
	private String BrandimageFileName;
	private List<Object> buttonlist;

	public List<Object> getButtonlist() {
		return buttonlist;
	}

	public void setButtonlist(List<Object> buttonlist) {
		this.buttonlist = buttonlist;
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

	public FunctionButton getButton() {
		return button;
	}

	public void setButton(FunctionButton button) {
		this.button = button;
	}

	public FunctionButtonService getFunctionButtonService() {
		return functionButtonService;
	}

	public void setFunctionButtonService(
			FunctionButtonService functionButtonService) {
		this.functionButtonService = functionButtonService;
	}

	public String save() throws IOException {

		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/ButtonImage");
		File savefile = new File(new File(realpath), BrandimageFileName);
		if (!savefile.getParentFile().exists()) {
			savefile.mkdirs();
		}
		FileUtils.copyFile(Brandimage, savefile);
		button.setImageUrl("ButtonImage" + "/" + BrandimageFileName);
		functionButtonService.save(button);
		return null;
	}

	public String list() {
		buttonlist = functionButtonService.getAll();
		ServletActionContext.getRequest()
				.setAttribute("buttonlist", buttonlist);
		return Action.SUCCESS;
	}

	public String modify() {
		button = (FunctionButton) functionButtonService.findButtonById(button
				.getId());
		ServletActionContext.getRequest().setAttribute("button", button);
		return Action.SUCCESS;
	}

	public String update() throws IOException {
		if (Brandimage == null) {
			FunctionButton bt = (FunctionButton) functionButtonService
					.findButtonById(button.getId());
			System.out.println("---->>" + bt.getId());
			button.setImageUrl(bt.getImageUrl());
			functionButtonService.update(button);
			return "list";
		} else {
			String realpath = ServletActionContext.getServletContext()
					.getRealPath("/ButtonImage");
			File savefile = new File(new File(realpath), BrandimageFileName);
			if (!savefile.getParentFile().exists()) {
				savefile.mkdirs();
			}
			FileUtils.copyFile(Brandimage, savefile);
			button.setImageUrl("ButtonImage" + "/" + BrandimageFileName);
			functionButtonService.update(button);
			return "list";
		}

	}

	public String delete() {
		functionButtonService.delete(button.getId());
		return "list";
	}

	public String returnAllButton() throws IOException {

		buttonlist = functionButtonService.getAll();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray sArray = JSONArray.fromObject(buttonlist, jsonConfig);
		String result = sArray.toString();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
		response.getWriter().close();
		return null;
	}

}
