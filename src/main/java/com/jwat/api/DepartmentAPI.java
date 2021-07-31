package com.jwat.api;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jwat.dto.DepartmentDTO;
import com.jwat.service.IDepartmentService;

@WebServlet(urlPatterns = { "/api-admin-department" })
public class DepartmentAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private IDepartmentService departmentService;

	// get departments by faculty id
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		Long facultyId = Long.parseLong(request.getParameter("facultyId"));
		List<DepartmentDTO> departments = null;
		if (facultyId == -1)
			departments = departmentService.findAll();
		else
			departments = departmentService.findByFacultyId(facultyId);
		mapper.writeValue(response.getOutputStream(), departments);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		DepartmentDTO departmentDTO = mapper.readValue(request.getInputStream(), DepartmentDTO.class);
		departmentDTO = departmentService.insert(departmentDTO);
		mapper.writeValue(response.getOutputStream(), departmentDTO);
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		DepartmentDTO departmentDTO = mapper.readValue(request.getInputStream(), DepartmentDTO.class);
		departmentDTO = departmentService.update(departmentDTO);
		mapper.writeValue(response.getOutputStream(), departmentDTO);
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		DepartmentDTO departmentDTO = mapper.readValue(request.getInputStream(), DepartmentDTO.class);
		boolean result = departmentService.delete(departmentDTO.getId());
		mapper.writeValue(response.getOutputStream(), result);
	}
}
