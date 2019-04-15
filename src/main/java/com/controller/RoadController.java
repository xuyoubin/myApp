package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.entity.Road;
import com.entity.User;
import com.service.RoadService;
import com.utils.PageBean;
import com.utils.SessionUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Date;
import java.util.List;

import static com.utils.HttpContextUtil.getRequset;

@Controller
@RequestMapping("/road")
public class RoadController extends BaseController {
    private static final int  PAGE_NUMBER = 5; //一页显示条数
    private static final int   NUMBER_ONE = 1; //损坏路灯表示
    private static final int   NUMBER_ZERO = 0; //正常路灯表示
    private static final Logger log = Logger.getLogger(RoadController.class);

    @Resource
    RoadService roadService;
    /**
     * 路灯列表
     * @returnlist
     */
    @RequestMapping(value = "listPage.do")
    public String roadList(HttpServletRequest request, HttpServletResponse response){
        log.info("路灯列表");
        String pageIndex = request.getParameter("pageIndex");
        PageBean pg = roadService.findAll(Integer.valueOf(pageIndex),PAGE_NUMBER);
        request.setAttribute("pg",pg);
        return "admin/ldgl";
    }
    /**
     * 删除路灯
     * @returnlist
     */
    @RequestMapping(value = "delete.do")
    @ResponseBody
    public String delete(HttpServletRequest request, HttpServletResponse response){
        String parms = request.getParameter("parms");
        JSONObject result = new JSONObject();
        roadService.delete(parms);
        return jsonSuccess(result);
    }

    /**
     * 路灯控制-正常路灯列表获取
     * @returnlist
     */
    @RequestMapping(value = "contol.do")
    public String contol(HttpServletRequest request, HttpServletResponse response){
        String pageIndex = request.getParameter("pageIndex");
        PageBean pg = roadService.findNormal(NUMBER_ZERO,Integer.valueOf(pageIndex),PAGE_NUMBER);
        request.setAttribute("pg",pg);
        return "admin/ldkz";
    }
    /**
     * 时间策略-正常路灯列表获取
     * @returnlist
     */
    @RequestMapping(value = "time.do")
    public String setTime(HttpServletRequest request, HttpServletResponse response){
        String pageIndex = request.getParameter("pageIndex");
//        List<Road>
        PageBean pg = roadService.findNormal(NUMBER_ZERO,Integer.valueOf(pageIndex),PAGE_NUMBER);
        request.setAttribute("pg",pg);
        return "admin/clsz";
    }
    /**
     * 时间策略-春夏秋冬策略设置接口
     * @returnlist
     */
    @RequestMapping(value = "timeForSj.do")
    @ResponseBody
    public String timeForSj(HttpServletRequest request, HttpServletResponse response){
        String openTime = request.getParameter("openTime");
        String closeTime = request.getParameter("closeTime");
        HttpSession session = getRequset().getSession();
        User user = (User) session.getAttribute(SessionUtil.USER_KEY);
        JSONObject result = new JSONObject();
        List<Road> roadList = roadService.findAllByState(NUMBER_ZERO);
//        if(roadList.size()<=0){
//            return jsonFail("没有路灯可以设置");
//        }
        for (int i=0;i<roadList.size();i++){
            Road road = roadList.get(i);
           road.setOpentime(openTime);
           road.setClosetime(closeTime);
           road.setCzpeople(user.getName());
           roadService.updateRoad(road);
        }
        return jsonSuccess(result);
    }
    /**
     * 警报页面
     * @returnlist
     */
    @RequestMapping(value = "jbxx.do")
    public String jbxx(HttpServletRequest request, HttpServletResponse response){
        String pageIndex = request.getParameter("pageIndex");
        PageBean pg = roadService.findNormal(NUMBER_ONE,Integer.valueOf(pageIndex),PAGE_NUMBER);
        request.setAttribute("pg",pg);
        return "admin/bjxx";
    }

    /**
     * 跳转到时间设置界面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "timePage.do")
    public String timePage(HttpServletRequest request, HttpServletResponse response){
        String num = request.getParameter("number");
        String id = request.getParameter("id");
        String index = request.getParameter("pageIndex");
        request.setAttribute("id",id);
        request.setAttribute("num",num);
        request.setAttribute("index",index);
        return "admin/timePage";
    }

    /**
     * 跳转到时间设置界面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "plSetTime.do")
    public String plSetTime(HttpServletRequest request, HttpServletResponse response){
        String num = request.getParameter("num");
        String str = request.getParameter("str");
        String index = request.getParameter("pageIndex");
        request.setAttribute("str",str);
        request.setAttribute("num",num);
        request.setAttribute("index",index);
        return "admin/timePagePl";
    }

    /**
     * 修改路灯信息
     *
     */
    @RequestMapping(value = "update.do")
    @ResponseBody
    public String update(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("id");
        String isopen = request.getParameter("isopen"); //开关
        String opentime = request.getParameter("opentime"); //时间
        String closetime = request.getParameter("closetime");
        String state = request.getParameter("state");
        HttpSession session = getRequset().getSession();
        User user = (User) session.getAttribute(SessionUtil.USER_KEY);
        JSONObject result = new JSONObject();
        Road road = roadService.findOnly(Integer.valueOf(id));
        if(road != null){
            if(isopen != null && isopen !=""){  //更新开关
                road.setIsopen(isopen);
            }
            if(opentime != null && opentime !=""){  //更新打开时间
                road.setOpentime(opentime);
            }
            if(state != null && state !=""){  //更新状态
                road.setState(Integer.parseInt(state));
            }
            if(closetime != null && closetime !=""){  //更新关闭时间
                road.setClosetime(closetime);
            }
            if(isopen != null && isopen !=""){  //更新开关
                road.setIsopen(isopen);
            }
            road.setCzpeople(user.getName());

        }else{
            return jsonFail("未找到该条记录！");
        }
        roadService.updateRoad(road);
        return jsonSuccess(result);
    }

    /**
     * 添加页面
     * @returnlist
     */
    @RequestMapping(value = "addPage.do")
    public String addRoadPage(HttpServletRequest request, HttpServletResponse response){
        return "admin/addRoad";
    }
    /**
     * 添加
     * @returnlist
     */
    @RequestMapping(value = "add.do")
    @ResponseBody
    public String addRoad(HttpServletRequest request, HttpServletResponse response){
        String number = request.getParameter("number");
        String dl = request.getParameter("dl");
        String dy = request.getParameter("dy");
        String scgs = request.getParameter("scgs");
        String azpeople = request.getParameter("azpeople");
        String azaddress = request.getParameter("azaddress");
        String opentime = request.getParameter("opentime"); //时间
        String closetime = request.getParameter("closetime");
        HttpSession session = getRequset().getSession();
        User user = (User) session.getAttribute(SessionUtil.USER_KEY);
        JSONObject result = new JSONObject();
        Road road = new Road();
        road.setNumber(number);
        road.setDl(dl);
        road.setDy(dy);
//        road.setCzpeople(azpeople);
        road.setAzpeople(azpeople);
        road.setScgs(scgs);
        road.setAzaddress(azaddress);
        road.setOpentime(opentime);
        road.setClosetime(closetime);
        road.setCzpeople(user.getName());
        road.setAzdate(new Date());
        road.setState(0);
        road.setIsopen("0");
        roadService.add(road);
        return jsonSuccess(result);
    }


}
