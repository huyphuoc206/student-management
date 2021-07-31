package com.jwat.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jwat.dto.ChangePasswordDTO;
import com.jwat.dto.UserDTO;
import com.jwat.service.IUserService;

@WebServlet(urlPatterns = { "/api-user" })
public class UserAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private IUserService userService;

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		UserDTO userDTO = mapper.readValue(request.getInputStream(), UserDTO.class);
		userDTO = userService.update(userDTO);
		mapper.writeValue(response.getOutputStream(), userDTO);
	}

	// change password
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		ChangePasswordDTO dto = mapper.readValue(request.getInputStream(), ChangePasswordDTO.class);
		boolean result = userService.changePassword(dto);
		mapper.writeValue(response.getOutputStream(), result);
	}
}
