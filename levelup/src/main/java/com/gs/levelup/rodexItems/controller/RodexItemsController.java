package com.gs.levelup.rodexItems.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gs.levelup.item.model.vo.Item;
import com.gs.levelup.rodexItems.model.service.RodexItemsService;
import com.gs.levelup.rodexMail.model.vo.RodexMail;

@Controller
public class RodexItemsController {
	@Autowired
	private RodexItemsService rodexItemsService;
	
	@RequestMapping(value="insertrodexitems.do", method=RequestMethod.POST)
	public String insertRodexItems(RodexMail rodexMail, Item item, Model model) {
		return "";
	}
	
	@RequestMapping(value="deleterodexitems.do", method=RequestMethod.POST)
	public String deleteRodexItems(RodexMail rodexMail, Item item, Model model) {
		return "";
	}


	

}
