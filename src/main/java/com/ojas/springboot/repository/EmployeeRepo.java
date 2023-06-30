package com.ojas.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ojas.springboot.entity.EmployeeEntity;
@Repository
public interface EmployeeRepo extends JpaRepository<EmployeeEntity, Integer> {

}
