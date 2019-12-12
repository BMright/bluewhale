package com.bluewhale.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.bluewhale.pojo.PageData;

public class BaseController {

	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;
	protected Model model;
	
	@ModelAttribute
	protected void setReqAndRes(HttpServletRequest request, HttpServletResponse response,Model model) {
		this.request = request;
		this.response = response;
		this.model = model;
		this.session = request.getSession();
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
	}
	
	/**
	 * 得到request对象
	 */
	protected HttpServletRequest getRequest() {
		return request;
	}

	/**
	 * 得到response对象
	 */
	protected HttpServletResponse getResponse() {
		return response;
	}
	
	/**
	 * 得到session对象
	 */
	protected HttpSession getSession() {
		return session;
	}
	
	/**
	 * 得到PageData
	 */
	protected PageData getPageData() {
		return new PageData(this.getRequest());
	}
	
	/**
	 * 实现转发
	 * url不会改变
	 * @param url
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void forward(String url){
		try {
			this.getRequest().getRequestDispatcher(url).forward(this.request, this.response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 实现重定向
	 */
	protected void sendRedirect(String url){
		try {
			this.response.sendRedirect(url);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
