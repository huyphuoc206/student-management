package com.jwat.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jwat.constant.SystemConstant;
import com.jwat.dto.UserDTO;
import com.jwat.service.IUserService;
import com.jwat.utils.MessageUtil;
import com.jwat.utils.RedirectUtil;
import com.jwat.utils.SessionUtil;

@WebServlet(urlPatterns = { "/dang-nhap", "/thoat" })
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Inject
	private IUserService userService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null && action.equalsIgnoreCase("logout")) {
			SessionUtil.getInstance().removeValue(request, SystemConstant.USER);
			response.sendRedirect(request.getContextPath() + "/dang-nhap");
		} else {
			MessageUtil.showMessage(request);
			// if login redirect to home
			UserDTO user = (UserDTO) SessionUtil.getInstance().getValue(request, SystemConstant.USER);
			if (user != null) {
				RedirectUtil.redirect(user, request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("views/login.jsp");
				rd.forward(request, response);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDTO user = userService.checkLogin(username, password);
		if (user != null) {
			SessionUtil.getInstance().putValue(request, SystemConstant.USER, user);
			RedirectUtil.redirect(user, request, response);
		}
		else {
			response.sendRedirect(
					request.getContextPath() + "/dang-nhap?message=username_password_invalid&alert=danger");
		}
	}
}
