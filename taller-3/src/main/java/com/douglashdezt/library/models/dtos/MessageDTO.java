package com.douglashdezt.library.models.dtos;

public class MessageDTO {
	
	private String message;

	public MessageDTO() {
		super();
	}

	public MessageDTO(String message) {
		super();
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
