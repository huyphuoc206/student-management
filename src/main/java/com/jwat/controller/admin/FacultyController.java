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
import com.jwat.dto.FacultyDTO;
import com.jwat.dto.LecturerDTO;
import com.jwat.service.IFacultyService;
import com.jwat.service.ILecturerService;
import com.jwat.utils.MessageUtil;

@WebServlet(urlPatterns = { "/quan-tri/khoa" })
public class FacultyController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private IFacultyService facultyService;
	@Inject
	private ILecturerService lecturerService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		String id = request.getParameter("id");
		MessageUtil.showMessage(request);
		if (id != null) {
			FacultyDTO faculty = facultyService.findOneById(Long.parseLong(id));
			List<LecturerDTO> lecturers = lecturerService.findByFacultyId(Long.parseLong(id));
			request.setAttribute("lecturers", lecturers);
			request.setAttribute(SystemConstant.MODEL, faculty);
			url = "../views/admin/faculty-edit.jsp";
		} else {
			List<FacultyDTO> faculties = facultyService.findAll();
			request.setAttribute(SystemConstant.MODEL, faculties);
			url = "../views/admin/faculty.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
