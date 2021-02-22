package org.zerock.domain.mountain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MCriteria {
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public MCriteria() {
		this(1, 10);
	}

	public MCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		if (this.type == null) {
			return new String[] {};
		} else {
			return type.split("");
		}
	}
}
