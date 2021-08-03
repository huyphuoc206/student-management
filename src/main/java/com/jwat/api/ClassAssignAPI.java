package com.jwat.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jwat.dto.ClassAssignDTO;
import com.jwat.service.IClassService;

@WebServlet(urlPatterns = { "/api-admin-class-assign" })
public class ClassAssignAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private IClassService classService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		String subjectAssignIdParam = request.getParameter("subjectAssignId");
		
		Long[] classAssignIds = null;
		if(subjectAssignIdParam != null) {
			Long subjectAssignId = Long.parseLong(subjectAssignIdParam);
			classAssignIds = classService.findClassAssign(subjectAssignId);
		}
		mapper.writeValue(response.getOutputStream(), classAssignIds);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		ClassAssignDTO classAssignDTO = mapper.readValue(request.getInputStream(), ClassAssignDTO.class);
		boolean result = classService.assignClass(classAssignDTO);
		mapper.writeValue(response.getOutputStream(), result);
	}
}
