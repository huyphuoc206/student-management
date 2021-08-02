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
import com.jwat.dto.DegreeDTO;
import com.jwat.dto.DepartmentDTO;
import com.jwat.dto.FacultyDTO;
import com.jwat.dto.LecturerDTO;
import com.jwat.service.IDepartmentService;
import com.jwat.service.IFacultyService;
import com.jwat.service.ILecturerService;
import com.jwat.utils.MessageUtil;

@WebServlet(urlPatterns = { "/quan-tri/giang-vien" })
public class LecturerController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private ILecturerService lecturerService;
	@Inject
	private IFacultyService facultyService;
	@Inject
	private IDepartmentService departmentService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		String id = request.getParameter("id");
		MessageUtil.showMessage(request);
		if (id != null) {
			LecturerDTO lecturer = lecturerService.findOneById(Long.parseLong(id));
			request.setAttribute(SystemConstant.MODEL, lecturer);
			List<DepartmentDTO> departments = departmentService.findByFacultyId(lecturer.getDepartment().getFacultyId());
			request.setAttribute("departments", departments);
			url = "/views/admin/lecturer-edit.jsp";
		} else {
			List<LecturerDTO> lecturers = lecturerService.findAll();
			request.setAttribute(SystemConstant.MODEL, lecturers);
			url = "/views/admin/lecturer.jsp";
		}
		List<FacultyDTO> faculties = facultyService.findAll();
		request.setAttribute("faculties", faculties);
		List<DegreeDTO> degrees = lecturerService.findAllDegrees();
		request.setAttribute("degrees", degrees);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
