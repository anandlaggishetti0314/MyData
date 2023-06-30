package com.securisk.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.securisk.model.ClaimsData;

@Repository
public interface ClaimsRepository extends JpaRepository<ClaimsData, Integer> {

}
