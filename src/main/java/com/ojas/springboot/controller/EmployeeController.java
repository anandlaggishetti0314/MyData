package com.ojas.springboot.controller;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ojas.springboot.entity.EmployeeEntity;
import com.ojas.springboot.model.Employee;
import com.ojas.springboot.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService service;

	@RequestMapping("/loadForm")
	public String loadForm(Model model) {
		Employee employee = new Employee();
		model.addAttribute("employee", employee);
		return "empRegister";
	}

	@RequestMapping("/save")
	public String register(@ModelAttribute Employee employee, Model model) {

		int num = service.registraterEmployee(employee);
		if (num != 0) {
			String msg = "Registration success......";
			model.addAttribute("msg", msg);
		}
		return "redirect:/loadForm";

	}

	@RequestMapping("/view")
	public String ViewAll(Model model) {
		List<Employee> empList = service.viewAllEmployee();
		model.addAttribute("empList", empList);
		return "view";

	}

	@RequestMapping("/delete")
	public String deleteemployee(@RequestParam("id") int id) {
		service.deleteEmployee(id);
		return "redirect:/view";

	}
	
	@RequestMapping("/edit")
	public String editEmployee(@RequestParam("id") int id,Model model) {
		Employee employee=service.editEmployee(id);
		model.addAttribute("editList",employee);
		return "editEmp";
		
	}
	
	@RequestMapping("/update")
	public String updateEmployee(@ModelAttribute("emp") Employee employee) {
		service.updateEmployee(employee);
		return "redirect:/view";
		
	}
}
