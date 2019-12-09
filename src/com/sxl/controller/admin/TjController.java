
package com.sxl.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.controller.MyController;

@Controller("TjController")
@RequestMapping(value = "/admin/tj")
public class TjController extends MyController {
	

	@RequestMapping(value = "/tj1")
	public String tj1(Model model, HttpServletRequest request,String flag)throws Exception {
		String sql="select date_format(insertDate,'%y-%m-%d') days ,count(1) counts from t_wdxx group by date_format(insertDate,'%y-%m-%d')";
		List<Map> list = db.queryForList(sql);
		model.addAttribute("list", list);
		return "/admin/tj/tj1";
	}
	
	
	@RequestMapping(value = "/tj2")
	public String tj2(Model model, HttpServletRequest request,String flag)throws Exception {
		String sql="select date_format(insertDate,'%y-%m-%d') days ,count(1) counts from t_customer group by date_format(insertDate,'%y-%m-%d')";
		List<Map> list = db.queryForList(sql);
		model.addAttribute("list", list);
		return "/admin/tj/tj2";
	}
	
}
