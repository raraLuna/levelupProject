package com.gs.levelup.python;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PythonController {
	private static final Logger logger = LoggerFactory.getLogger(PythonController.class);
	
	@Autowired
	private PythonService pythonService;
	
	@RequestMapping("runCrawling.do")
	public String runCrawlingMethod(HttpServletRequest request) throws IOException, InterruptedException {

		String scriptPath = request.getSession().getServletContext().getRealPath(
				"/resources/crawl");
		
		logger.info(scriptPath);
		
		if(pythonService.deleteAll()> 0) {
			
		ProcessBuilder pb = new ProcessBuilder(scriptPath + "/steamcrawling.exe");
		// 워킹디렉토리 지정(크롬드라이버 찾기 위해)
		pb.directory(new File(scriptPath)); 
		Process p = pb.start();	
		
		}
		Thread.sleep(45000); //45초 대기


		return "redirect:steam.do";  
	}
	
	@RequestMapping("steam.do")
	public String viewChart(HttpServletRequest request, Model model) {
		ArrayList<Python> list = pythonService.selectAll();
		
		model.addAttribute("list", list);
		return "chart/steam";
	}
	
	
}

