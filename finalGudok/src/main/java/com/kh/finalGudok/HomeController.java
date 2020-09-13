package com.kh.finalGudok;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.finalGudok.item.model.service.ItemService;
import com.kh.finalGudok.item.model.vo.Item;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes("loginUser")
@Controller
public class HomeController {
	
	@Autowired
	ItemService iService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, HttpServletResponse response, Model model) {
		
		ArrayList<Item> newList = iService.selectnewList();
		ArrayList<Item> bestList = iService.selectBestList();
		
		ArrayList<Item> recommendMList = iService.selectHomeRecommendMList();
		ArrayList<Item> recommendFList = iService.selectHomeRecommendFList();
		ArrayList<Item> recommendCList = iService.selectHomeRecommendCList();
		
//		System.out.println(newList);
//		System.out.println(bestList);
//		System.out.println(recommendList);
		
		model.addAttribute("newList", newList);
		model.addAttribute("bestList", bestList);
		
		model.addAttribute("recommendMList", recommendMList);
		model.addAttribute("recommendFList", recommendFList);
		model.addAttribute("recommendCList", recommendCList);
		return "home";
	}
	
}