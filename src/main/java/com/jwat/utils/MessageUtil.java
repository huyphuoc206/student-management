package com.jwat.utils;

import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

public class MessageUtil {
	private static ResourceBundle bundle = ResourceBundle.getBundle("messages");

	public static void showMessage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");
		if (message != null && alert != null) {
			String val = bundle.getString(message);
			request.setAttribute("message", val);
			request.setAttribute("alert", alert);
		}
	}
}
