package com.bluewhale.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController extends BaseController{
	
	@RequestMapping(value = "/toMBoard")
	public String toMBoard() {
		return "mboard/mboard";
	}
}
