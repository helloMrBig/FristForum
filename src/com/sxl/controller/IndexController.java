package com.sxl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller()
/* 请关注微信公众号：bysjbng,各种免费毕设相关模板提供下载*/
public class IndexController extends MyController {
	/**
	 * 首页
	 * @param model
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/index")
	public String index(Model model) throws Exception {
		return "public/index";
	}
}
