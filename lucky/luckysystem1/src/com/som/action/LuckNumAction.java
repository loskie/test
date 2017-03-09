package com.som.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.som.entity.LuckNumber;
import com.som.entity.Prize;
import com.som.service.LuckNumService;
import com.som.service.PrizeService;

@Controller
@SessionAttributes("inputNum")
@RequestMapping(value = "/luckNum")
public class LuckNumAction {

	@Resource
	private LuckNumService luckNumService;
	@Resource
	private PrizeService prizeService;
	
	@RequestMapping(value = "/ajax", method = RequestMethod.POST)
	@ResponseBody
	public String ajax(
			@RequestParam("num") String num,
			@RequestParam("type") String type,
			@RequestParam("date") String date
			){
		LuckNumber luckNum = new LuckNumber();
		luckNum.setNum(num);
		luckNum.setType(type);
		luckNum.setDate(date);
		luckNumService.addLuckNum(luckNum);
		System.out.println(num);
		System.out.println(type);
		System.out.println(date);
		return "a";
	};
	
	@RequestMapping(value="/checkNum",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
	public String checkNum(String inputNum ,Model model,ModelMap map){
		System.out.println(inputNum);
		LuckNumber lucknum= luckNumService.checkNum(inputNum);
		if(lucknum!=null){
			 
			
			String grade = lucknum.getType();
			System.out.println(grade);
			List<Prize> prizes=prizeService.findPrizeByGrade(grade);
			model.addAttribute("prizes", prizes);
			System.out.println(prizes);
			map.addAttribute("inputNum", inputNum);
			
			System.out.println("aaaaaaaaa");
			return "/exchangePrize_list.jsp";
		}
		
			return"/noQualification.jsp";
		
	}
	
	
}
