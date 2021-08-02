package com.jwat.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jwat.dto.StudentDTO;
import com.jwat.service.IStudentService;

@WebServlet(urlPatterns = { "/api-admin-student" })
public class StudentAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private IStudentService studentService;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		StudentDTO studentDTO = mapper.readValue(request.getInputStream(), StudentDTO.class);
		studentDTO = studentService.insert(studentDTO);
		mapper.writeValue(response.getOutputStream(), studentDTO);
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		StudentDTO studentDTO = mapper.readValue(request.getInputStream(), StudentDTO.class);
		studentDTO = studentService.update(studentDTO);
		mapper.writeValue(response.getOutputStream(), studentDTO);
	}
}
