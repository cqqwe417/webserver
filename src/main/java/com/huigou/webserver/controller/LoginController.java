package com.huigou.webserver.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huigou.webserver.base.controller.BaseController;
import com.huigou.webserver.entity.LfEmployee;
import com.huigou.webserver.model.enums.ASMResponse;
import com.huigou.webserver.service.LfEmployeeService;
import com.huigou.webserver.utils.Constants;
import com.huigou.webserver.utils.SessionUtils;
import com.lifang.json.FasterJsonTool;
import com.lifang.model.Response;

@Controller
public class LoginController extends BaseController {

	protected Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private LfEmployeeService lfEmployeeService;

	/**
	 * 登录
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "login")
	@ResponseBody
	public Response login(String username,String password,HttpSession session,Model model) {
		Map<String,Object> map = new HashMap<>();
		map.put("loginName", username);
		map.put("password", password);
		LfEmployee lfEmployee = lfEmployeeService.loginCheck(map);
		if(lfEmployee != null){
			lfEmployee.setPassWord("");
			session.setAttribute(Constants.LOGIN_SESSION,lfEmployee);
			return ASMResponse.Success.value;
		}else{
			return ASMResponse.LoginFailure.value;
		}
	}
	
	
	/**
	 * 功能描述:获取登录用户的信息
	 *
	 * <pre>
	 * Modify Reason:(修改原因,不需覆盖，直接追加.)
	 *     CK:   2015年5月28日      新建
	 * </pre>
	 *
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "loginInfo", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String loginInfo(HttpSession session){
		LfEmployee employee = getLoginEmployeeInfo(session); 
		if(employee != null){
			return "agent="+FasterJsonTool.writeValueAsString(employee)+";";
		}else{
			return "agent=null;";
		}
	}
	
	

	@RequestMapping("/logout.action")
	private String loginout(HttpSession session) {
		session.removeAttribute(Constants.LOGIN_SESSION);
		return "redirect:login.jsp";
	}

	@RequestMapping("/mianForward.action")
	private String mianForward(HttpServletRequest request) {
		return "main";
	}

	@RequestMapping("/index.action")
	private String login(HttpServletRequest request, ModelMap model) {
		LfEmployee loginEmp = SessionUtils.getSession(request);
		if (null == loginEmp) {
			return "login";
		}
		return "main";
	}

	/**
	 * 主页
	 */
	@RequestMapping("menuTree")
	public String getMenuTree(HttpSession session){
		LfEmployee employee = getLoginEmployeeInfo(session);
		String menuTree = null;
		int type= employee.getGrade();
		switch (type) {
		case 1:
			menuTree = "outlooktree.txt";
			break;
		case 2:
			menuTree = "outlooktree_admin.txt";
			break;
		}
		return "redirect:"+menuTree;
	}
}
