package com.gs.levelup.character.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gs.levelup.character.model.service.CharacterService;
import com.gs.levelup.common.Search;
import com.gs.levelup.inventory.model.service.InventoryService;
import com.gs.levelup.inventory.model.vo.Inventory;
import com.gs.levelup.user.model.vo.User;

@Controller
public class CharacterController {
	private static final Logger logger = LoggerFactory.getLogger(CharacterController.class);

	@Autowired
	private CharacterService characterService;

	@Autowired
	private InventoryService inventoryService;

	@RequestMapping("selectchars.do")
	public ModelAndView selectCharacters(int accountId, ModelAndView mv) {
		return mv;
	}

	@RequestMapping("listChar.do")
	public String testMaria(Model model) {
		ArrayList<com.gs.levelup.character.model.vo.Character> list = characterService.selectAll();

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);

			return "character/testChar";
		} else {
			model.addAttribute("message", "mariaDB 테스트 실패");
			return "common/error";
		}
	}

	@RequestMapping("selectchar")
	public ModelAndView selectCharacter(int accountId, int charId, ModelAndView mv) {
		return mv;
	}

	@RequestMapping(value="chardetailview.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String charDetailViewMethod(@RequestParam(name = "list", required = false) ArrayList<Inventory> list,
			@RequestParam(name = "char_", required = false) com.gs.levelup.character.model.vo.Character char_,
			@RequestParam(name = "message1", required = false) String message1,
			@RequestParam(name = "message2", required = false) String message2, Model model) {
		
		// 케릭터 아이디로 검색결과가 존재할 경우
		if (char_ != null) {
			model.addAttribute("char_", char_);
			// 검색한 캐릭터에게 인벤토리가 존재할 경우
			if (list != null &&  list.size() > 0 ) {
				model.addAttribute("list", list);
			}
		}
		
		return "empchar/charDetailView";
	}

	// 관리자용 : 캐릭터 검색 처리용 메소드
	@RequestMapping(value = "charsearch.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String selectSearchMethod(@RequestParam("keyword") String keyword,
									Model model, RedirectAttributes re) {
			re.addAttribute("keyword", keyword);
			return "redirect:csearchcharid.do";
	}
	
	// 캐릭터 CHAR ID 로 검색 처리용 메소드
	@RequestMapping(value = "csearchcharid.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectSearchAccountIdMethod(@RequestParam("keyword") String keyword, ModelAndView mv) {
		// 서비스 메소드 호출하고 리턴결과 받기
		com.gs.levelup.character.model.vo.Character char_ = characterService.selectCharacter(Integer.parseInt(keyword));

		// 검색된 캐릭터가 있을때
		if (char_ != null) {
			mv.addObject("char_", char_);

			// 캐릭터가 검색 되었을 때만 캐릭터를 검색함
			ArrayList<Inventory> list = inventoryService.selectUserInventory(Integer.parseInt(keyword));

			// 검색된 유저가 아이템을 하나라도 가지고 있을경우
			if (list != null && list.size() > 0) {
				mv.addObject("list", list);
			} else {
				// 검색된 유저가 캐릭터를 가지고 있지 않을 경우
				mv.addObject("message2", "해당 캐릭터는 아이템이 없습니다");
			}
		} else { // 캐릭터가 검색되지 않았을떄
			mv.addObject("message1", keyword + "로 검색된 캐릭터가 없습니다");
		}
		mv.addObject("keyword", keyword);
		mv.setViewName("empchar/charDetailView");
		return mv;
	}

}
