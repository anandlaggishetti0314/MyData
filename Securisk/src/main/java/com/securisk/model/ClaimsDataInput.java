package com.securisk.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClaimsDataInput {

//	private Integer sNo;

	private Integer key;

	private Integer excelValue;

	private Integer type;

	private Integer tpa;
}
