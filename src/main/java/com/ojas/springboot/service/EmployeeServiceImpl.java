package com.ojas.springboot.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ojas.springboot.entity.EmployeeEntity;
import com.ojas.springboot.model.Employee;
import com.ojas.springboot.repository.EmployeeRepo;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeRepo repo;
	@Override
	public int registraterEmployee(Employee employee) {
		int count=0;
		EmployeeEntity emp=new EmployeeEntity();
		//BeanUtils.copyProperties(employee, emp);
		emp.setEmployeeName(employee.getEmployeeName());
		emp.setDepartment(employee.getDepartment());
		emp.setSalary(employee.getSalary());
		
		EmployeeEntity epmSave=repo.save(emp);
		if(epmSave!=null)
			count=1;
		return count;
	}
	@Override
	public List<Employee> viewAllEmployee() {
		List<EmployeeEntity> empList=repo.findAll();
		List<Employee> emp=new ArrayList<>();
		for(EmployeeEntity emp1:empList ) {
			Employee e1=new Employee();
			BeanUtils.copyProperties(emp1, e1);
			emp.add(e1);
		}
		return emp;
	}
	@Override
	public void deleteEmployee(int id) {
		repo.deleteById(id);
		
	}
	@Override
	public Employee editEmployee(int id) {
		
		Optional<EmployeeEntity> empEntity= repo.findById(id);
		EmployeeEntity emp=empEntity.get();
		Employee employee=new Employee();
		BeanUtils.copyProperties(emp, employee);
		return employee;
	}
	@Override
	public int updateEmployee(Employee employee) {
		int count=0;
		
		EmployeeEntity empEntity=new EmployeeEntity();
		BeanUtils.copyProperties(employee, empEntity);
		EmployeeEntity emp1=repo.saveAndFlush(empEntity);
		if(emp1!=null) {
			count=1;
		}
		return count;
	}

}
