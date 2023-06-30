package com.securisk.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.securisk.model.ClaimsData;
import com.securisk.repository.ClaimsRepository;

@Service
public class ClaimsServiceImpl implements ClaimsService {

	@Autowired
	private ClaimsRepository repository;

	@Override
	public ResponseEntity<String> insert(ClaimsData data) {
		int id = repository.save(data).getSNo();
		if (id != 0) {
			return ResponseEntity.ok().body("Data " + id + "  Inserted Successfully");
		} else {
			return ResponseEntity.badRequest().body("Data Not Inserted!.....");
		}
	}

	@Override
	public List<ClaimsData> viewAllData() {

		List<ClaimsData> claimsList = repository.findAll();
		return claimsList;
	}

	@Override
	public String deleteClaimsData(Integer sNo) {
		ClaimsRepository repository2 = repository;
		repository2.deleteById(sNo);
		if (repository2.existsById(sNo)) {
			return "Data Not Deleted";
		} else {
			return "Data " + sNo + " Deleted";
		}
	}

	@Override
	public ResponseEntity<ClaimsData> editClaimsData(ClaimsData data) {
		ClaimsData saveAndFlush = repository.saveAndFlush(data);
		if (saveAndFlush != null)
			return ResponseEntity.ok().body(saveAndFlush);
		return ResponseEntity.notFound().build();
	}

	@Override
	public ResponseEntity<Optional<ClaimsData>> dataGetById(Integer sNo) {
		Optional<ClaimsData> findById = repository.findById(sNo);
		if (findById != null) {
			return ResponseEntity.ok(findById);
		}
		return ResponseEntity.notFound().build();
	}

}
