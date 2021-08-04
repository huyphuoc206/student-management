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
import com.jwat.dto.LecturerDTO;
import com.jwat.dto.SemesterDTO;
import com.jwat.dto.UserDTO;
import com.jwat.service.ILecturerService;
import com.jwat.service.ISemesterService;
import com.jwat.utils.SessionUtil;

@WebServlet(urlPatterns = { "/giang-vien/danh-sach-mon-hoc" })
public class SubjectAssignController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Inject
	private ISemesterService semesterService;
	@Inject
	private ILecturerService lecturerService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDTO user = (UserDTO) SessionUtil.getInstance().getValue(request, SystemConstant.USER);
		LecturerDTO lecturer = lecturerService.findOneByUserId(user.getId());
		List<SemesterDTO> semesters = semesterService.getSemestersAssignLecturer(lecturer.getId());
		request.setAttribute("semesters", semesters);
		request.setAttribute("lecturer", lecturer);
		RequestDispatcher rd = request.getRequestDispatcher("/views/lecturer/subject-assign.jsp");
		rd.forward(request, response);
	}
}
