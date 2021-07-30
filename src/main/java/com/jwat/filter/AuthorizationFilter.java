package com.jwat.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jwat.constant.SystemConstant;
import com.jwat.dto.UserDTO;
import com.jwat.utils.SessionUtil;

public class AuthorizationFilter implements Filter {

	@SuppressWarnings("unused")
	private ServletContext context;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String url = req.getRequestURI();
		
		UserDTO user = (UserDTO) SessionUtil.getInstance().getValue(req, SystemConstant.USER);
		if (url.startsWith("/quan-tri")) {
			if (user != null) {
				String role = user.getRole().getCode();
				if (role.equalsIgnoreCase(SystemConstant.ADMIN))
					chain.doFilter(request, response);
				else if (role.equalsIgnoreCase(SystemConstant.STUDENT) || role.equalsIgnoreCase(SystemConstant.LECTURER)) {
					SessionUtil.getInstance().removeValue(req, SystemConstant.USER);
					res.sendRedirect(req.getContextPath() + "/dang-nhap?message=not_permission&alert=danger");
				}
			} else
				res.sendRedirect(req.getContextPath() + "/dang-nhap?message=not_login&alert=danger");
		} else if(url.startsWith("/giang-vien")) {
			if (user != null) {
				String role = user.getRole().getCode();
				if (role.equalsIgnoreCase(SystemConstant.LECTURER))
					chain.doFilter(request, response);
				else if (role.equalsIgnoreCase(SystemConstant.ADMIN) || role.equalsIgnoreCase(SystemConstant.STUDENT)) {
					SessionUtil.getInstance().removeValue(req, SystemConstant.USER);
					res.sendRedirect(req.getContextPath() + "/dang-nhap?message=not_permission&alert=danger");
				}
			} else
				res.sendRedirect(req.getContextPath() + "/dang-nhap?message=not_login&alert=danger");
		} else if(url.startsWith("/sinh-vien")) {
			if (user != null) {
				String role = user.getRole().getCode();
				if (role.equalsIgnoreCase(SystemConstant.STUDENT))
					chain.doFilter(request, response);
				else if (role.equalsIgnoreCase(SystemConstant.ADMIN) || role.equalsIgnoreCase(SystemConstant.LECTURER)) {
					SessionUtil.getInstance().removeValue(req, SystemConstant.USER);
					res.sendRedirect(req.getContextPath() + "/dang-nhap?message=not_permission&alert=danger");
				}
			} else
				res.sendRedirect(req.getContextPath() + "/dang-nhap?message=not_login&alert=danger");
		}
		else
			chain.doFilter(request, response);
	}

	@Override
	public void destroy() {

	}
}
