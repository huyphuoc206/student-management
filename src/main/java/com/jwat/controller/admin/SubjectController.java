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
import com.jwat.dto.SubjectDTO;
import com.jwat.service.IDepartmentService;
import com.jwat.service.IFacultyService;
import com.jwat.service.ISubjectService;
import com.jwat.utils.MessageUtil;

@WebServlet(urlPatterns = { "/quan-tri/mon-hoc" })
public class SubjectController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private ISubjectService subjectService;
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
			SubjectDTO subject = subjectService.findOneById(Long.parseLong(id));
			request.setAttribute(SystemConstant.MODEL, subject);
			List<DepartmentDTO> departments = departmentService.findByFacultyId(subject.getDepartment().getFacultyId());
			request.setAttribute("departments", departments);
			url = "/views/admin/subject-edit.jsp";
		} else {
			List<SubjectDTO> subjects = subjectService.findAll();
			request.setAttribute(SystemConstant.MODEL, subjects);
			url = "/views/admin/subject.jsp";
		}
		List<FacultyDTO> faculties = facultyService.findAll();
		request.setAttribute("faculties", faculties);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
