package com.jwat.utils;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jwat.constant.SystemConstant;
import com.jwat.dto.UserDTO;

public class RedirectUtil {
	public static void redirect(UserDTO user, HttpServletRequest request ,HttpServletResponse response) throws IOException {
		if (user.getRole().getCode().equalsIgnoreCase(SystemConstant.ADMIN))
			response.sendRedirect(request.getContextPath() + "/quan-tri");
		else if (user.getRole().getCode().equalsIgnoreCase(SystemConstant.LECTURER))
			response.sendRedirect(request.getContextPath() + "/giang-vien");
		else if (user.getRole().getCode().equalsIgnoreCase(SystemConstant.STUDENT))
			response.sendRedirect(request.getContextPath() + "/sinh-vien");
	}
}
