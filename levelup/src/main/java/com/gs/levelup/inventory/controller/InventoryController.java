package com.gs.levelup.inventory.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gs.levelup.inventory.model.service.InventoryService;
import com.gs.levelup.inventory.model.vo.Inventory;

@Controller
public class InventoryController {
	private static final Logger logger = LoggerFactory.getLogger(InventoryController.class);

	@Autowired
	private InventoryService inventoryService;

	@RequestMapping(value="inventory.do",method= { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void selectInventoryLog(
			HttpServletResponse response,
			@RequestParam("charId") int charId) throws IOException {
		ArrayList<Inventory> inventory= inventoryService.selectInventory(charId);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		for(Inventory b : inventory) {
			out.append(b.toString() + "\n");
		}
		
		out.flush();
		out.close();
	}
	
	

}
