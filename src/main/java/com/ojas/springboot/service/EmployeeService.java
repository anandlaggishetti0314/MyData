package com.ojas.springboot.service;

import java.util.List;
import com.ojas.springboot.model.Employee;

public interface EmployeeService {

	public int  registraterEmployee(Employee employee);
	
	public List<Employee> viewAllEmployee();
	
	public void deleteEmployee(int id);
	
	public Employee editEmployee(int id);
	
	public int updateEmployee(Employee employee);
}
