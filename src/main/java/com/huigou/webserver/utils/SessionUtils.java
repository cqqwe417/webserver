package com.huigou.webserver.utils;

import javax.servlet.http.HttpServletRequest;

import com.huigou.webserver.entity.WiUser;

public class SessionUtils {
	
	public static WiUser getSession(HttpServletRequest request) {
		Object obj = request.getSession().getAttribute(Constants.LOGIN_SESSION);
		return  null == obj ? null : (WiUser) obj;
		//LoginSessionInterface lgObj = SessionHelper.getLoginSession(request);
		//return lgObj == null ? null : (EmployeeModel)lgObj;
	}
	
	public static void remove(HttpServletRequest request){
		request.getSession().removeAttribute(Constants.LOGIN_SESSION);
		//SessionHelper.remove(request);
	}
	
	public static void setLoginSession(HttpServletRequest request,WiUser emp){
		request.getSession().setAttribute(Constants.LOGIN_SESSION, emp);
		//SessionHelper.setLoginSession(request, emp);
	}

}
