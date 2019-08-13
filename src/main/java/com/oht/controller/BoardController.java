package com.oht.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oht.domain.BoardVO;
import com.oht.domain.Criteria;
import com.oht.domain.PageMaker;
import com.oht.service.BoardService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("board/*")
public class BoardController {

	private BoardService boardService;
	
	@GetMapping("/list")
	public void getList(Criteria cri, Model model){
		
		model.addAttribute("list", boardService.getList(cri));
		
		int total = boardService.getTotal(cri);
		
		model.addAttribute("pageMaker", new PageMaker(cri, total));
	}
	
	@PostMapping("/insert")
	public String insert(BoardVO boardVO, RedirectAttributes rttr) {
		
		boardService.insert(boardVO);
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/insert")
	public void insert() {
		
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("bno") int bno, Model model) {
		
		model.addAttribute("board", boardService.get(bno));
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("bno") int bno, Model model) {
		
		model.addAttribute("board", boardService.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO boardVO, RedirectAttributes rttr) {
		
		boardService.modify(boardVO);
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(int bno) {
		
		boardService.remove(bno);
		
		return "redirect:/board/list";
	}
}
