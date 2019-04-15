package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.utils.BeanAndString;
import com.utils.Redis.RedisDao;
import com.utils.SessionUtil;
import com.utils.kafkaUtils.KafkaProduce;
import com.utils.kafkaUtils.ReadKafkaPropertiesUtils;
import com.utils.logC;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import static com.utils.HttpContextUtil.getRequset;
import com.alibaba.fastjson.JSONObject;
import com.entity.User;
import com.service.UserService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	private static final Logger log = Logger.getLogger(UserController.class);
	
	@Resource
	UserService userSrvice;

	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping(value = "loginpage.do")
	public String goLogin(){
//		getResponse().setHeader("Location","jsp/admin/login.jsp");
//		getResponse().setHeader("content-type","text/html;charset=UTF-8");"text/html;charset=UTF-8"
//		try {
//			OutputStream  out = getResponse().getOutputStream();
//			out.write();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		String data = "中国";
//		try {
//		 byte[] dataByte =	data.getBytes("UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
		return "admin/login";
//		return null;

	}

	/**
	 * 登录
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "login.do")
	@logC(operationType = "查询操作",operationName = "用户登录")
	public String login(HttpServletRequest request,HttpServletResponse response){
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		log.info("=====================用户名="+name+"密码="+pwd+"==================");
		User userInfo = userSrvice.findUser(name);
		if(userInfo == null){
			String msg = "该用户不存在";
			return jsonFail(msg);
		}else{
			User user = userSrvice.login(name, pwd);
			if(user == null){
				String msg = "密码错误，请重新输入";
				return jsonFail(msg);
			}else{
				JSONObject result =  (JSONObject) JSONObject.toJSON(user);
				SessionUtil.loginUser(getRequset().getSession(), user);
				return jsonSuccess(result);
			}
		}
	}

	/**
	 * 登出
	 * @return
	 */
	@RequestMapping(value = "loginOut.do")
	public String loginOut(){
//		SessionUtil.loginoutUser(getRequset().getSession());
//		getResponse().setHeader("Location","");
//		redirect 转发 返回ModelAndView
//		return new ModelAndView("redirect:/list.do");
//		redirect 转发 返回String
//		return "redirect:/list.do";
		return "admin/login";
	}

	/**
	 * 添加用户
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "register.do")
	@ResponseBody
	public String register(HttpServletRequest request,HttpServletResponse response){
		JSONObject json = new JSONObject();
		String name = request.getParameter("name").trim();
		String age = request.getParameter("age").trim();
		String pwd = request.getParameter("pwd").trim();
		String power = request.getParameter("power");
		if(name == null || "".equals(name)){
			return jsonFail("用户名不能为空");
		}
		if(pwd == null || "".equals(pwd)){
			return jsonFail("密码不能为空");
		}
		if(Integer.valueOf(age)>120 || Integer.valueOf(age)<0){
			return jsonFail("年龄不合法");
		}
		User userObj = userSrvice.findUser(name);
		if(userObj != null){
				return jsonFail("该用户已经存在");
		}
		//直接走数据库保存
//		userSrvice.add(name,pwd,age,power);
		//走kafka发送消息
		User user = new User();
		user.setAge(age);
		user.setName(name);
		user.setPwd(pwd);
		user.setPower(Integer.parseInt(power));
		user.setRegistertime(new Date());
		String userStr = BeanAndString.beanToString(user);
		String topic = ReadKafkaPropertiesUtils.getTopic();
		String key = "userkey";
		KafkaProduce.sendMsg(topic,key,userStr);
		return jsonSuccess(json);
	}

	/**
	 * 首页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "index.do")
	public String userIndex(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = getRequset().getSession();
//		int isLogin = SessionUtil.isLogin(session);
		User user = (User) session.getAttribute(SessionUtil.USER_KEY);
		request.setAttribute("user", user);
//		request.setAttribute("isLogin", isLogin);
		return "admin/index";
	}

	/**
	 * 用户指南
	 * @return
	 */
	@RequestMapping(value = "handbook.do")
	public String handbook(){
		return "admin/info";
	}

	/**
	 * 用户添加页面
	 * @return
	 */
	@RequestMapping(value = "addUser.do")
	public String addUser(){

		return "admin/addUser";
	}

	/**
	 * 用户列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "userList.do")
	public String userList(HttpServletResponse response,HttpServletRequest request){
		HttpSession session = getRequset().getSession();
		List list = new ArrayList();
		User user = (User) session.getAttribute(SessionUtil.USER_KEY);
		request.setAttribute("user", user);
		if(user.getPower() == 1){
			 if(RedisDao.ttl("userList")>0L){  //判断key是否存在和过期
			 	log.info("-----走redis缓存-----");
				 list = (List) RedisDao.get("userList");
			 }else{
				 log.info("-----走数据库查询-----");
				 list = userSrvice.findUsers();
				 RedisDao.set("userList",list);
			 }

		}else{
			list.add(user);
		}
		request.setAttribute("list",list);
		return "admin/yhgl";
	}

	/*
	*
	 */
//	public void downloadFile(){
//			log.info("---------------定时任务---------------");
//	}
}
