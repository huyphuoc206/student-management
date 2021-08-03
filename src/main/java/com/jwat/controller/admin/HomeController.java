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
import com.jwat.service.IClassService;
import com.jwat.service.IDepartmentService;
import com.jwat.service.IFacultyService;
import com.jwat.service.ISubjectService;
import com.jwat.service.IUserService;

@WebServlet(urlPatterns = {"/quan-tri"})
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Inject
	private IFacultyService facultyService;
	@Inject
	private IDepartmentService departmentService;
	@Inject 
	private ISubjectService subjectService;
	@Inject
	private IClassService classService;
	@Inject
	private IUserService userService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long facultyCounter = facultyService.count();
		long departmentCounter = departmentService.count();
		long subjectCounter = subjectService.count();
		long classCounter = classService.count();
		long lecturerCounter = userService.countByRole(SystemConstant.LECTURER);
		long studentCounter = userService.countByRole(SystemConstant.STUDENT);
		
		request.setAttribute("facultyCounter", facultyCounter);
		request.setAttribute("departmentCounter", departmentCounter);
		request.setAttribute("subjectCounter", subjectCounter);
		request.setAttribute("classCounter", classCounter);
		request.setAttribute("lecturerCounter", lecturerCounter);
		request.setAttribute("studentCounter", studentCounter);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/home.jsp");
		rd.forward(request, response);
	}
}
