package com.securisk.controller;

import java.util.List;
import java.util.Optional;

import javax.websocket.server.PathParam;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.securisk.model.ClaimsData;
import com.securisk.model.ClaimsDataInput;
import com.securisk.service.ClaimsServiceImpl;



@RestController
@CrossOrigin
@RequestMapping("/securisk")
public class ClaimsController {

	@Autowired
	private ClaimsServiceImpl service;

	@PostMapping("/insert")
	//@MutationMapping()
	public ResponseEntity<String> insert(@RequestBody ClaimsData data) {
		ClaimsData claimsData=new ClaimsData();
		BeanUtils.copyProperties(data, claimsData);
		return service.insert(claimsData);

	}

	@GetMapping("/viewAll")
	//@QueryMapping("dataGetById")
	public List<ClaimsData> viewAll() {
		return service.viewAllData();

	}

	@DeleteMapping("/deleteId/{sNo}")
	//@MutationMapping("delete")
	public String deleteClaimsData(@PathVariable Integer sNo) {
		return service.deleteClaimsData(sNo);
	}
	
	@PutMapping("/editData")
	//@MutationMapping("edit")
	public ResponseEntity<ClaimsData> editClaimsData(@RequestBody ClaimsData data) {
		return service.editClaimsData(data);
		
	}
	
	@GetMapping("/getById/{sNo}")
	//@QueryMapping("dataGetById")
	public ResponseEntity<Optional<ClaimsData>> dataGetById(@PathVariable Integer sNo){
		
		return service.dataGetById(sNo);
	}

}
