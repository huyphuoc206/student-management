package com.jwat.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jwat.constant.SystemConstant;
import com.jwat.dto.LecturerDTO;
import com.jwat.service.ILecturerService;
import com.jwat.utils.MessageUtil;

@WebServlet(urlPatterns = { "/quan-tri/giang-vien" })
public class LecturerController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private ILecturerService lecturerService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		String id = request.getParameter("id");
		MessageUtil.showMessage(request);
		if (id != null) {
			LecturerDTO lecturer = lecturerService.findOneById(Long.parseLong(id));
			request.setAttribute(SystemConstant.MODEL, lecturer);
			url = "/views/admin/lecturer-edit.jsp";
		} else {
			List<LecturerDTO> lecturers = lecturerService.findAll();
			request.setAttribute(SystemConstant.MODEL, lecturers);
			url = "/views/admin/lecturer.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
