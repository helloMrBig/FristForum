
package com.sxl.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.controller.MyController;

@Controller("customerController")
@RequestMapping(value = "/admin/customer")
public class CustomerController extends MyController {
	

	@RequestMapping(value = "/frame")
	public String frame(Model model, HttpServletRequest request,String flag)throws Exception {
		return "/admin/customer/frame";
	}
	
	@RequestMapping(value = "/list")
	public String list(Model model, HttpServletRequest request,String flag,String username,String app)throws Exception {
		String sql="select a.* from t_customer a where 1=1";
		System.out.println("app====="+app);
		if("123".equals(app)){
			sql+=" and ( isft ='否' or isft is null  or ispl='否' or ispl is null) ";
		}
	if(username!=null&&!"".equals(username)){
			sql+=" and username like '%"+username+"%'";
		}
		sql+=" order by id desc";
		List list = db.queryForList(sql);
		System.out.println(sql);
		request.setAttribute("list", list);
		return "/admin/customer/list";
	}
	
	@RequestMapping(value = "/editSave")
	public ResponseEntity<String> editSave(Model model,HttpServletRequest request,Long id,String flag
		,String username,String password,String name,String phone,String sex,String age,
		String address,String idcard,String insertDate,String isft,String ispl) throws Exception{
		int result = 0;
		if(id!=null){
			String sql="update t_customer set password=?,name=?,phone=?,sex=?,age=?,address=?,idcard=?,isft=?,ispl=? where id=?";
			result = db.update(sql, new Object[]{password,name,phone,sex,age,address,idcard,isft,ispl,id});
		}else{
			String sql="insert into t_customer(username,password,name,phone,sex,age,address,idcard,insertDate,isft,ispl) values(?,?,?,?,?,?,?,?,now(),?,?)";
			result = db.update(sql, new Object[]{username,password,name,phone,sex,age,address,idcard,isft,ispl});
		}
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
	}
	
	@RequestMapping(value = "/editDelete")
	public ResponseEntity<String> editDelete(Model model,HttpServletRequest request,Long id,String flag) throws Exception {
		
		String sql="delete from t_customer where id=?";
		int result = db.update(sql, new Object[]{id});
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
		
	}
	
	@RequestMapping(value = "/edit")
	public String edit(Model model, HttpServletRequest request,Long id,String flag)throws Exception {
		if(id!=null){
			//修改
			String sql="select * from t_customer where id=?";
			Map map = db.queryForMap(sql,new Object[]{id});
			model.addAttribute("map", map);
		}String sql="";

		return "/admin/customer/edit";
	}
}
