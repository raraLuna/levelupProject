package com.gs.levelup.item.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gs.levelup.item.model.service.ItemService;
import com.gs.levelup.item.model.vo.Item;

@Controller
public class ItemController {
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("selectitems.do")
	public ModelAndView selectListItems(ModelAndView mv) {
		return mv;
	}
	
	@RequestMapping("selectitem.do")
	public String selectItem(int itemId, Model model) {
		return null;
	}
	
	@RequestMapping("selectitemtype.do")
	public ModelAndView selectListItemType(String itemType, ModelAndView mv) {
		return mv;
	}

	@RequestMapping("searchitems.do")
	public String selectSearchItems(String searchword, Model model) {
		return null;
	}
}
