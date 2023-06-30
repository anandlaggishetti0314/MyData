package com.securisk.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "CLAIMSDATA")
public class ClaimsData {

	@Id
	@GenericGenerator(name = "myGenerator", strategy = "increment")
	@GeneratedValue(generator = "myGenerator", strategy = GenerationType.AUTO)
	@Column(name = "sno")
	private Integer sNo;
	@Column(name = "claimskey")
	private Integer key;
	@Column(name = "excelvalue")
	private Integer excelValue;
	@Column(name = "type")
	private Integer type;
	@Column(name = "tpa")
	private Integer tpa;

}
