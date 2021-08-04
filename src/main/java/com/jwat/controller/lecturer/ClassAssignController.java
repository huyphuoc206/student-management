package com.jwat.controller.lecturer;

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
import com.jwat.dto.SubjectAssignDTO;
import com.jwat.service.IClassService;
import com.jwat.service.ISubjectService;

@WebServlet(urlPatterns = { "/giang-vien/danh-sach-lop" })
public class ClassAssignController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Inject
	private ISubjectService subjectService;
	@Inject
	private IClassService classService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String subjectAssignParam = request.getParameter("subjectAssignId");
		if(subjectAssignParam != null) {
			Long subjectAssignId = Long.parseLong(subjectAssignParam);
			SubjectAssignDTO subjectAssignDTO = subjectService.findSubjectAssignById(subjectAssignId);
			List<ClassDTO> classDTOs = classService.findBySubjectAssign(subjectAssignId);
			request.setAttribute(SystemConstant.MODEL, classDTOs);
			request.setAttribute("subjectAssign", subjectAssignDTO);
			RequestDispatcher rd = request.getRequestDispatcher("/views/lecturer/class-assign.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendRedirect(request.getContextPath() + "/giang-vien/danh-sach-mon-hoc");
		}
	}
}
