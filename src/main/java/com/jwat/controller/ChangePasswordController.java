package com.jwat.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jwat.utils.MessageUtil;

@WebServlet(urlPatterns = { "/quan-tri/doi-mat-khau", "/giang-vien/doi-mat-khau", "/sinh-vien/doi-mat-khau" })
public class ChangePasswordController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MessageUtil.showMessage(request);
		RequestDispatcher rd = request.getRequestDispatcher("/views/change-password.jsp");
		rd.forward(request, response);
	}
}
