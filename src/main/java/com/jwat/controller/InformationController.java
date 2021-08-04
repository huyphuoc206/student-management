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
import com.jwat.dto.LecturerDTO;
import com.jwat.dto.UserDTO;
import com.jwat.service.ILecturerService;
import com.jwat.service.IStudentService;
import com.jwat.service.IUserService;
import com.jwat.utils.MessageUtil;
import com.jwat.utils.SessionUtil;

@WebServlet(urlPatterns = { "/quan-tri/thong-tin-ca-nhan", "/giang-vien", "/sinh-vien" })
public class InformationController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Inject
	private IUserService userService;
	@Inject
	private ILecturerService lecturerService;
	@Inject
	private IStudentService studentService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MessageUtil.showMessage(request);
		UserDTO user = (UserDTO) SessionUtil.getInstance().getValue(request, SystemConstant.USER);
		UserDTO userDTO = userService.findOneById(user.getId());
		request.setAttribute(SystemConstant.MODEL, userDTO);
		String role = user.getRole().getCode();
		if(role.equals(SystemConstant.LECTURER)) {
			LecturerDTO lecturer = lecturerService.findOneByUserId(userDTO.getId());
			request.setAttribute("lecturer", lecturer);
		} else if(role.equals(SystemConstant.STUDENT)) {
			
		}
		RequestDispatcher rd = request.getRequestDispatcher("/views/update-information.jsp");
		rd.forward(request, response);
	}
}
