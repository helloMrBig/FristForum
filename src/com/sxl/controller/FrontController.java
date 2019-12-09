package com.sxl.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.util.StringHelper;

@Controller("webController")
@RequestMapping(value = "/front")
public class FrontController extends MyController {

	///用户的基本功能开始///////////////////////////////////////////////
	@RequestMapping(value = "/index")
	public String frame(Model model, HttpServletRequest request,String searchName,Long oneClassifyId)
			throws Exception {
		Map customer = getCustomer(request);
		
		
		String sql="select a.*,(select max(name) from t_customer b where b.id=a.customerId) customerName," +
				"(select bkName from t_bk c where c.id=a.bkId) bkName from t_wdxx a where 1=1  ";
		if(searchName !=null&&!"".equals(searchName)){
			sql+=" and a.title like '%"+searchName+"%'";
		}
		if(customer==null||customer.size()==0){
			sql+=" and a.nologin='是' ";
		}
		
		sql+=" order by id desc";
		List<Map> list = db.queryForList(sql);
		list = initList(list);
		model.addAttribute("list", list);
		return "/front/index";
	}
	
	public List<Map> initList(List<Map> list){
		String sql="select * from t_mgc ";
		List<Map> mgcList = db.queryForList(sql);
		if(list!=null&&list.size()>0){
			if(mgcList!=null&&mgcList.size()>0){
				for (int i = 0; i < list.size(); i++) {
					Map map = list.get(i);
					String title = map.get("title").toString();
					String content = map.get("content").toString();
					for (int j = 0; j < mgcList.size(); j++) {
						String mgc = mgcList.get(j).get("mgc").toString();
						title = title.replace(mgc, "***");
						content = content.replace(mgc, "***");
						list.get(i).put("title", title);
						list.get(i).put("content", content);
					}
				}
			}
			
			
		}
		return list;
	}
	
	public Map initMap(Map map){
		String sql="select * from t_mgc ";
		List<Map> mgcList = db.queryForList(sql);
			if(mgcList!=null&&mgcList.size()>0){
				String title = map.get("title").toString();
				String content = map.get("content").toString();
				for (int j = 0; j < mgcList.size(); j++) {
					String mgc = mgcList.get(j).get("mgc").toString();
					title = title.replace(mgc, "***");
					content = content.replace(mgc, "***");
					map.put("title", title);
					map.put("content", content);
				}
			
			
		}
		return map;
	}
	
	@RequestMapping(value = "/bk")
	public String bk(Model model, HttpServletRequest request,Long id)
			throws Exception {
		Map customer = getCustomer(request);
		String sql="select * from t_bk where id="+id;
		Map map  =db.queryForMap(sql);
		model.addAttribute("map", map);
		
		sql="select *,(select max(name) from t_customer b where b.id=a.customerId) customerName," +
				"(select bkName from t_bk c where c.id=a.bkId) bkName from t_wdxx a where bkId="+id+" ";
		if(customer==null||customer.size()==0){
			sql+=" and a.nologin='是' ";
		}
		sql+=" order by id desc";
		
		
		List<Map> list = db.queryForList(sql);
		list = initList(list);
		model.addAttribute("list", list);
		return "/front/bk";
	}
	
	
	@RequestMapping(value = "/ltgz")
	public String ltgz(Model model, HttpServletRequest request,String searchName,Long oneClassifyId)
			throws Exception {
		String sql="select * from t_ltsm limit 1";
		Map map  =db.queryForMap(sql);
		model.addAttribute("map", map);
		return "/front/ltgz";
	}
	
	@RequestMapping(value = "/find")
	public String find(Model model, HttpServletRequest request)
			throws Exception {
		return "/front/find";
	}
	
	@RequestMapping(value = "/cwshow")
	public String cwshow(Model model, HttpServletRequest request,Long id)
			throws Exception {
		if(id!=null){
			//修改
			String sql="select * from t_cw where id=?";
			Map map = db.queryForMap(sql,new Object[]{id});
			model.addAttribute("map", map);
		}
		return "/front/cwshow";
	}
	
	@RequestMapping(value = "/mycw")
	public String mycw(Model model, HttpServletRequest request,Long id)
			throws Exception {
		String sql="select * from t_cw where customerId='"+getCustomer(request).get("id")+"' order by id desc";
		List<Map> cwList = db.queryForList(sql);
		model.addAttribute("cwList", cwList);
		return "/front/mycw";
	}
	
	@RequestMapping(value = "/home")
	public String home(Model model, HttpServletRequest request,String searchName,Long oneClassifyId)
			throws Exception {
		String sql="select * from t_rd order by id desc";
		List<Map> rdList = db.queryForList(sql);
		model.addAttribute("rdList", rdList);
		
		
		sql="select * from t_cw order by id desc";
		List<Map> cwList = db.queryForList(sql);
		model.addAttribute("cwList", cwList);
		return "/front/home";
	}

	@RequestMapping(value = "/login")
	public String login(Model model, HttpServletRequest request)
			throws Exception {
		return "/front/login";
	}
	
	@RequestMapping(value = "/register")
	public String register(Model model, HttpServletRequest request)
			throws Exception {
		return "/front/register";
	}
	@RequestMapping(value = "/mine")
	public String mine(Model model, HttpServletRequest request)
			throws Exception {
		Map customer = getCustomer(request);
		model.addAttribute("customer", customer);
		return "/front/mine";
	}
	
	@RequestMapping(value = "/password")
	public String password(Model model, HttpServletRequest request)
			throws Exception {
		return "/front/password";
	}

	@RequestMapping(value = "/changePassword")
	public ResponseEntity<String> changePassword(Model model,
			HttpServletRequest request, String oldPassword, String newPassword)
			throws Exception {
		Map admin = getAdmin(request);
		if (oldPassword.equals(admin.get("password").toString())) {
			String sql = "update t_admin set password=? where id=?";
			db.update(sql, new Object[] { newPassword, admin.get("id") });
			return renderData(true, "1", null);
		} else {
			return renderData(false, "1", null);
		}
	}

	@RequestMapping(value = "/save")
	public ResponseEntity<String> loginSave(Model model,
			HttpServletRequest request, String username, String password)
			throws Exception {
		String sql = "select * from t_customer where username=?";
		List<Map> list = db.queryForList(sql, new Object[] { username });
		String result = "1";
		if (list != null && list.size() > 0) {
			Map map = list.get(0);
			if (StringHelper.get(map, "password").equals(password)) {
				request.getSession().setMaxInactiveInterval(60 * 60 * 24);
				request.getSession().setAttribute("customerBean", map);
				result = "1";
			} else {
				result = "0";
			}
		} else {
			result = "0";
		}
		return renderData(true, result, null);
	}
	
	@RequestMapping(value = "/findSave")
	public ResponseEntity<String> findSave(Model model,
			HttpServletRequest request, String username, String phone)
			throws Exception {
		String sql = "select * from t_customer where username=? and phone=?";
		List<Map> list = db.queryForList(sql, new Object[] { username,phone });
		System.out.println(list);
		String result = "1";
		if (list != null && list.size() > 0) {
			Map map = list.get(0);
			return renderData(true, result, null);
		} else {
			return renderData(false, result, null);
		}
		
	}
	
	@RequestMapping(value = "/findSaveConfirm")
	public ResponseEntity<String> findSaveConfirm(Model model,
			HttpServletRequest request, String username, String phone,String password)
			throws Exception {
		String sql = "update t_customer set password=? where  username=? and phone=?";
		db.update(sql, new Object[] {password, username,phone });
		return renderData(true, "", null);
		
	}

	@RequestMapping(value = "/registerSave")
	public ResponseEntity<String> mineSave(Model model,
			HttpServletRequest request, Long id, String username,String name,
			String password, String phone,String sex,String age,String address,String idcard,String headPic) throws Exception {
		/*
		create table t_customer(
		id int primary key auto_increment,
		username varchar(1000) comment '账号',
		password varchar(1000) comment '密码',
		name varchar(1000) comment '姓名',
		phone varchar(1000) comment '手机',
		sex varchar(100) comment '性别',
		age  varchar(100) comment '年龄',
		address varchar(100) comment '家庭住址',
		idcard varchar(100) comment '身份证',
		insertDate datetime comment '入库日期'
		) comment '用户';
		*/
		
		
		int result = 0;
		String sql = "insert into t_customer(username,password,name,phone,sex,age,address,idcard,insertDate,headPic,level,ispl,isft) values(?,?,?,?,?,?,?,?,now(),?,?,?,?)";
		result = db.update(sql, new Object[] { username, password,name, phone,
				sex,age,address,idcard ,headPic,"初级","是","是"});
		sql = "select * from t_customer order by id desc limit 1";
		List<Map> list = db.queryForList(sql);
		request.getSession().setMaxInactiveInterval(60 * 60 * 24);
		request.getSession().setAttribute("customerBean", list.get(0));
		return renderData(true, "操作成功", null);
	}
	
	@RequestMapping(value = "/registerModifySave")
	public ResponseEntity<String> registerModifySave(Model model,
			HttpServletRequest request, Long id, String username,String name,
			String password, String phone,String sex,String age,String address,String idcard,String headPic) throws Exception {
		
		int result = 0;
		String sql = "update t_customer set password=?, name=?,phone=?,sex=?,age=?,address=?,idcard=?,headPic=? where id=?";
		result = db.update(sql, new Object[] { password, name, phone,
				sex,age,address,idcard,headPic,id });
		sql = "select * from t_customer order by id desc limit 1";
		List<Map> list = db.queryForList(sql);
		request.getSession().setMaxInactiveInterval(60 * 60 * 24);
		request.getSession().setAttribute("customerBean", list.get(0));
		return renderData(true, "操作成功", null);
	}
	
	

	@RequestMapping(value = "/out")
	public String out(Model model, HttpServletRequest request) throws Exception {
		request.getSession().removeAttribute("customerBean");
		return "redirect:/front/login.html";
	}
	
	@RequestMapping(value = "/friend")
	public String friend(Model model, HttpServletRequest request,String name)
			throws Exception {
		Map customer = getCustomer(request);
		String sql="select a.*,(select case when exists(select 1 from t_wdhy b where b.customerId="+customer.get("id")+" and b.hhId=a.id) then 1 else 0 end) isGz from t_customer a where 1=1";
		if(name!=null&&!"".equals(name)){
				sql+=" and name like '%"+name+"%'";
			}
			sql+=" order by id desc";
			List list = db.queryForList(sql);
			request.setAttribute("list", list);
		return "/front/friend";
	}
	
	
	@RequestMapping(value = "/qxgz")
	public ResponseEntity<String> qxgz(Model model,
			HttpServletRequest request, Long id) throws Exception {
		Map customer = getCustomer(request);
		String sql="delete from t_wdhy where customerId=? and hhId=?";
		db.update(sql, new Object[]{customer.get("id"),id});
		return renderData(true, "操作成功", null);
	}
	

	@RequestMapping(value = "/wdxxDelete")
	public ResponseEntity<String> wdxxDelete(Model model,
			HttpServletRequest request, Long id) throws Exception {
		Map customer = getCustomer(request);
		String sql="delete from t_wdxx where  id=?";
		db.update(sql, new Object[]{id});
		return renderData(true, "操作成功", null);
	}
	
	
	@RequestMapping(value = "/gz")
	public ResponseEntity<String> gz(Model model,
			HttpServletRequest request, Long id) throws Exception {
		Map customer = getCustomer(request);
		String sql="insert into t_wdhy(customerId,hhId,insertDate) values(?,?,now())";
		db.update(sql, new Object[]{customer.get("id"),id});
		return renderData(true, "操作成功", null);
	}
	
	@RequestMapping(value = "/myfriend")
	public String myfriend(Model model, HttpServletRequest request,String name)
			throws Exception {
		Map customer = getCustomer(request);
		String sql="select a.*,(select case when exists(select 1 from t_wdhy b where b.customerId="+customer.get("id")+" and b.hhId=a.id) then 1 else 0 end) isGz from t_customer a where 1=1";
		if(name!=null&&!"".equals(name)){
				sql+=" and name like '%"+name+"%'";
			}
		sql+=" and exists(select 1 from t_wdhy b where b.customerId="+customer.get("id")+" and b.hhId=a.id) ";
			sql+=" order by id desc";
			List list = db.queryForList(sql);
			request.setAttribute("list", list);
		return "/front/myfriend";
	}
	
	@RequestMapping(value = "/wdxxList")
	public String list(Model model, HttpServletRequest request,String flag,String title)throws Exception {
		String sql="select a.*,(select max(name) from t_customer b where a.customerId=b.id) customerName  from t_wdxx a where 1=1";

if(1==1){sql+=" and customerId="+getCustomer(request).get("id") +" ";}
	if(title!=null&&!"".equals(title)){
			sql+=" and title like '%"+title+"%'";
		}
		sql+=" order by id desc";
		List list = db.queryForList(sql);
		request.setAttribute("list", list);
		return "/front/wdxxList";
	}
	
	@RequestMapping(value = "/hywdxxList")
	public String hywdxxList(Model model, HttpServletRequest request,String flag,String title)throws Exception {
		Map customer = getCustomer(request);
		String sql="select a.*,(select max(name) from t_customer b where a.customerId=b.id) customerName  from t_wdxx a where 1=1";
		sql+=" and exists(select 1 from t_wdhy b where a.customerId=b.hhId and b.customerId="+customer.get("id")+") ";
	if(title!=null&&!"".equals(title)){
			sql+=" and title like '%"+title+"%'";
		}
		sql+=" order by id desc";
		List list = db.queryForList(sql);
		request.setAttribute("list", list);
		return "/front/wdxxList";
	}
	
	@RequestMapping(value = "/wdxxEditSave")
	public ResponseEntity<String> editSave(Model model,HttpServletRequest request,Long id,String flag
		,Integer customerId,String title,String pic,String content,Integer zan,String insertDate,String nologin,Long bkId) throws Exception{
		int result = 0;
		if(id!=null){
			String sql="update t_wdxx set title=?,pic=?,content=?,nologin=?,bkId=? where id=?";
			result = db.update(sql, new Object[]{title,pic,content,nologin,bkId,id});
		}else{
			String sql="insert into t_wdxx(customerId,title,pic,content,zan,insertDate,nologin,bkId) values(?,?,?,?,?,now(),?,?)";
			result = db.update(sql, new Object[]{getCustomer(request).get("id"),title,pic,content,0,nologin,bkId});
		}
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
	}
	
	@RequestMapping(value = "/wdxxEditDelete")
	public ResponseEntity<String> editDelete(Model model,HttpServletRequest request,Long id,String flag) throws Exception {
		
		String sql="delete from t_wdxx where id=?";
		int result = db.update(sql, new Object[]{id});
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
		
	}
	
	@RequestMapping(value = "/wdxxEdit")
	public String edit(Model model, HttpServletRequest request,Long id,String flag)throws Exception {
		if(id!=null){
			//修改
			String sql="select * from t_wdxx where id=?";
			Map map = db.queryForMap(sql,new Object[]{id});
			model.addAttribute("map", map);
		}String sql="";

		return "/front/wdxxEdit";
	}
	
	@RequestMapping(value = "/wdxxShow")
	public String wdxxShow(Model model, HttpServletRequest request,Long id,String flag)throws Exception {
		if(id!=null){
			//修改
			String sql="select * from t_wdxx where id=?";
			Map map = db.queryForMap(sql,new Object[]{id});
			map = initMap(map);
			model.addAttribute("map", map);
		}
		String sql="select a.*,(select max(name) from t_customer b where a.customerId=b.id) customerName from t_pinglun a where wdxxId=? order by id desc";
		List<Map> list = db.queryForList(sql,new Object[]{id});
		model.addAttribute("list", list);
		return "/front/wdxxShow";
	}
	
	@RequestMapping(value = "/checkIsLogin")
	public ResponseEntity<String> checkIsLogin(Model model,
			HttpServletRequest request) throws Exception {
		Map customer = getCustomer(request);
		if (customer != null && customer.size() > 0) {
			return renderData(true, "操作成功", null);
		} else {
			return renderData(false, "操作失败", null);
		}
	}
	
	@RequestMapping(value = "/pinglunSave")
	public ResponseEntity<String> pinglunSave(Model model,HttpServletRequest request,Long id,String flag
		,String wdxxId,Integer customerId,String content,String insertDate) throws Exception{
		int result = 0;
		String sql="insert into t_pinglun(wdxxId,customerId,content,insertDate) values(?,?,?,now())";
		result = db.update(sql, new Object[]{wdxxId,getCustomer(request).get("id"),content});
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
	}
	
	@RequestMapping(value = "/zanSave")
	public ResponseEntity<String> zanSave(Model model,HttpServletRequest request,Long id) throws Exception{
		int result = 0;
		String sql="update t_wdxx set zan=zan+1 where id=?";
		result = db.update(sql, new Object[]{id});
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
	}
	
	
	///用户的基本功能结束///////////////////////////////////////////////
	
	
	
	@RequestMapping(value = "/lySave")
	public ResponseEntity<String> lySave(Model model,HttpServletRequest request,Long id,String flag
		,String cwName,String zl,String pz,String sex,String ms,String jkzt,String llfw,String hjdz,String cwnl,String status,Integer customerId,String syrxm,String syrsex,String syrsfz,String ly,String jtzz,String jtcy,String syrdh,String jjdz) throws Exception{
		int result = 0;
		Map customer = getCustomer(request);
		String sql="update t_cw set customerId=?, syrxm=?,syrsex=?,syrsfz=?,ly=?,jtzz=?,jtcy=?,syrdh=?,jjdz=?,status='已领养' where id=?";
		result = db.update(sql, new Object[]{customer.get("id"),syrxm,syrsex,syrsfz,ly,jtzz,jtcy,syrdh,jjdz,id});
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
	}
	
	@RequestMapping(value = "/qxly")
	public ResponseEntity<String> qxly(Model model,
			HttpServletRequest request, Long id) throws Exception {
		Map customer = getCustomer(request);
		String sql="update t_cw set status='待领养',customerId=null where id=?";
		db.update(sql, new Object[]{id});
		return renderData(true, "操作成功", null);
	}

}
