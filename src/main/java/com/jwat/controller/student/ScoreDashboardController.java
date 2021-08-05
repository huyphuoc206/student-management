package com.jwat.controller.student;

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
import com.jwat.dto.SemesterDTO;
import com.jwat.dto.StudentDTO;
import com.jwat.dto.UserDTO;
import com.jwat.service.ISemesterService;
import com.jwat.service.IStudentService;
import com.jwat.service.IUserService;
import com.jwat.utils.SessionUtil;

@WebServlet(urlPatterns = { "/sinh-vien/xem-diem" })
public class ScoreDashboardController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Inject
	private IStudentService studentService;
	@Inject
	private IUserService userService;
	@Inject
	private ISemesterService semesterService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDTO user = (UserDTO) SessionUtil.getInstance().getValue(request, SystemConstant.USER);
		UserDTO userDTO = userService.findOneById(user.getId());
		StudentDTO student = studentService.findOneByUserId(userDTO.getId());
		request.setAttribute(SystemConstant.MODEL, student);
		
		List<SemesterDTO> semesters = semesterService.findByClass(student.getClassId());
		request.setAttribute("semester", semesters);
		RequestDispatcher rd = request.getRequestDispatcher("/views/student/student-score.jsp");
		rd.forward(request, response);
	}
}
