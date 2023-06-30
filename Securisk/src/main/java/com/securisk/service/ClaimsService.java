package com.securisk.service;

import java.util.List;
import java.util.Optional;

import org.springframework.http.ResponseEntity;

import com.securisk.model.ClaimsData;

public interface ClaimsService {

	public ResponseEntity<String> insert(ClaimsData data);

	public List<ClaimsData> viewAllData();

	public String deleteClaimsData(Integer sNo);
	
	public ResponseEntity<ClaimsData> editClaimsData(ClaimsData data);

	public ResponseEntity<Optional<ClaimsData>> dataGetById(Integer sNo);

}
