package com.jwat.controller.admin;

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
import com.jwat.utils.SessionUtil;

@WebServlet(urlPatterns = { "/quan-tri/thong-tin-ca-nhan" })
public class InformationController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Inject
	private IUserService userService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MessageUtil.showMessage(request);
		UserDTO user = (UserDTO) SessionUtil.getInstance().getValue(request, SystemConstant.USER);
		UserDTO userDTO = userService.findOneById(user.getId());
		request.setAttribute(SystemConstant.MODEL, userDTO);
		RequestDispatcher rd = request.getRequestDispatcher("/views/update-information.jsp");
		rd.forward(request, response);
	}
}
