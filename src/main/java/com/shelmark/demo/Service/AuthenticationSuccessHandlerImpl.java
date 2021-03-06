package com.shelmark.demo.Service;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.shelmark.demo.SetupSession;
import com.shelmark.demo.Entity.Permission;
import com.shelmark.demo.Entity.User;

@Component
public class AuthenticationSuccessHandlerImpl implements AuthenticationSuccessHandler {

    @Autowired UserService userService; //autowire the user repo

    @Autowired PermissionService perService;
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationSuccessHandlerImpl.class);
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        // TODO Auto-generated method stub
        String userName = "";
        userName = ((org.springframework.security.core.userdetails.User)authentication.getPrincipal()).getUsername();
        User user = userService.findByUsername(userName);
        logger.info("userName: " + userName);
        HttpSession session = request.getSession();
        String referer = (String) session.getAttribute("referer");
        if(user.getStatus()) {
            session.setAttribute("user", user);
            SetupSession.setHeader(user.getCartItems().size() ,user.getProLiked().size(), request);
            Set<Permission> pers = user.getPermissions();
            session.setAttribute("permissionForSearch", pers);
            for (Permission p : pers) {
            	if (p.getPermissionName().equals("ADMIN")||p.getPermissionName().equals("PRODUCT MANAGER")||p.getPermissionName().equals("ORDER MANAGER")) {
            		referer="/admin";
            		break;
            	}
            }
        }
        else {
        	referer="/logout";
        }
        redirectStrategy.sendRedirect(request, response, referer);
    }
}
