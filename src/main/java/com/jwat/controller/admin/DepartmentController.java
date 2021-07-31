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
import com.jwat.dto.DepartmentDTO;
import com.jwat.dto.FacultyDTO;
import com.jwat.dto.LecturerDTO;
import com.jwat.service.IDepartmentService;
import com.jwat.service.IFacultyService;
import com.jwat.service.ILecturerService;
import com.jwat.utils.MessageUtil;

@WebServlet(urlPatterns = { "/quan-tri/bo-mon" })
public class DepartmentController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private IDepartmentService departmentService;
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
			DepartmentDTO department = departmentService.findOneById(Long.parseLong(id));
			List<LecturerDTO> lecturers = lecturerService.findByDepartmentId(Long.parseLong(id));
			request.setAttribute("lecturers", lecturers);
			request.setAttribute(SystemConstant.MODEL, department);
			url = "../views/admin/department-edit.jsp";
		} else {
			List<DepartmentDTO> departments = departmentService.findAll();
			request.setAttribute(SystemConstant.MODEL, departments);
			url = "../views/admin/department.jsp";
		}
		List<FacultyDTO> faculties = facultyService.findAll();
		request.setAttribute("faculties", faculties);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
