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
import com.jwat.dto.SemesterDTO;
import com.jwat.dto.SubjectDTO;
import com.jwat.service.ILecturerService;
import com.jwat.service.ISemesterService;
import com.jwat.service.ISubjectService;
import com.jwat.utils.MessageUtil;

@WebServlet(urlPatterns = { "/quan-tri/giao-mon-hoc" })
public class SubjectAssignController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private ISubjectService subjectService;
	@Inject
	private ISemesterService semesterService;
	@Inject
	private ILecturerService lecturerService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		String subjectId = request.getParameter("subjectId");
		MessageUtil.showMessage(request);
		if (subjectId != null) {
			SubjectDTO subject = subjectService.findOneById(Long.parseLong(subjectId));
			request.setAttribute(SystemConstant.MODEL, subject); 
			
			List<SemesterDTO> semesters = semesterService.findAll();
			request.setAttribute("semesters", semesters); 
			
			List<LecturerDTO> lecturers = lecturerService.findByDepartmentIdAndStatus(subject.getDepartmentId(), 1);
			request.setAttribute("lecturers", lecturers); 
			
			url = "/views/admin/subject-assign.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/quan-tri/mon-hoc");
		}
	}
}
