package com.huigou.webserver.common;

import lombok.Data;

@Data
public class Response {
	private int status = 1;
	private String message;
	
	private Object data;

}
