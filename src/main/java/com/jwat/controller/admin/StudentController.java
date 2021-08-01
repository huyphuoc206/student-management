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
import com.jwat.dto.ClassDTO;
import com.jwat.dto.FacultyDTO;
import com.jwat.dto.StudentDTO;
import com.jwat.service.IClassService;
import com.jwat.service.IFacultyService;
import com.jwat.service.IStudentService;
import com.jwat.utils.MessageUtil;

@WebServlet(urlPatterns = { "/quan-tri/sinh-vien" })
public class StudentController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private IStudentService studentService;
	@Inject
	private IFacultyService facultyService;
	@Inject
	private IClassService classService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		String id = request.getParameter("id");
		MessageUtil.showMessage(request);
		if (id != null) {
			StudentDTO student = studentService.findOneById(Long.parseLong(id));
			request.setAttribute(SystemConstant.MODEL, student);
			List<FacultyDTO> faculties = facultyService.findAll();
			request.setAttribute("faculties", faculties);
			List<ClassDTO> classDTOs = classService.findByFacultyId(student.getClassDTO().getFacultyId());
			request.setAttribute("classDTOs", classDTOs);
			url = "/views/admin/student-edit.jsp";
		} else {
			List<StudentDTO> students = studentService.findAll();
			request.setAttribute(SystemConstant.MODEL, students);
			url = "/views/admin/student.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
