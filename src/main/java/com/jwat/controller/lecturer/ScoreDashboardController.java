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

import com.jwat.dto.ClassDTO;
import com.jwat.dto.StudentScoreDTO;
import com.jwat.dto.SubjectAssignDTO;
import com.jwat.service.IClassService;
import com.jwat.service.IStudentScoreService;
import com.jwat.service.ISubjectService;
import com.jwat.utils.MessageUtil;

@WebServlet(urlPatterns = { "/giang-vien/bang-diem" })
public class ScoreDashboardController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private ISubjectService subjectService;
	@Inject
	private IClassService classService;
	@Inject
	private IStudentScoreService studentScoreService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String subjectAssignParam = request.getParameter("subjectAssignId");
		String classIdParam = request.getParameter("classId");
		String type = request.getParameter("type");
		String url = "";
		if (subjectAssignParam != null && classIdParam != null) {
			MessageUtil.showMessage(request);
			Long subjectAssignId = Long.parseLong(subjectAssignParam);
			SubjectAssignDTO subjectAssignDTO = subjectService.findSubjectAssignById(subjectAssignId);
			request.setAttribute("subjectAssign", subjectAssignDTO);
			
			Long classId = Long.parseLong(classIdParam);
			ClassDTO classDTO = classService.findOneById(classId);
			request.setAttribute("classDTO", classDTO);
			
			List<StudentScoreDTO> studentScores = studentScoreService.findAll(subjectAssignId, classId);
			request.setAttribute("studentScores", studentScores);
			
			if(type.equalsIgnoreCase("view")) url = "/views/lecturer/score.jsp";
			else if(type.equalsIgnoreCase("edit")) url = "/views/lecturer/score-update.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/giang-vien/danh-sach-mon-hoc");
		}
	}
}
