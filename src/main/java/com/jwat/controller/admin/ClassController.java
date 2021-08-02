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
import com.jwat.dto.ClassDTO;
import com.jwat.dto.FacultyDTO;
import com.jwat.service.IClassService;
import com.jwat.service.IFacultyService;
import com.jwat.utils.MessageUtil;

@WebServlet(urlPatterns = { "/quan-tri/lop" })
public class ClassController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private IFacultyService facultyService;
	@Inject
	private IClassService classService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		String id = request.getParameter("id");
		MessageUtil.showMessage(request);
		if (id != null) {
			ClassDTO classDTO = classService.findOneById(Long.parseLong(id));
			request.setAttribute(SystemConstant.MODEL, classDTO);
			url = "/views/admin/class-edit.jsp";
		} else {
			List<ClassDTO> classDTOs = classService.findAll();
			request.setAttribute(SystemConstant.MODEL, classDTOs);
			url = "/views/admin/class.jsp";
		}
		List<FacultyDTO> faculties = facultyService.findAll();
		request.setAttribute("faculties", faculties);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
