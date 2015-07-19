package com.huigou.webserver.utils;

import lombok.Data;

@Data
public class SQLAdapter {
	public SQLAdapter(){}
	
	public SQLAdapter(String v){
		this.value = v;
	}
	private String value;
}
