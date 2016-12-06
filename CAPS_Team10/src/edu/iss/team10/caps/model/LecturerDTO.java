package edu.iss.team10.caps.model;

import java.io.Serializable;

public class LecturerDTO implements Serializable{
	
	private static final long serialVersionUID = 1L;

	String lecturerId;

	String lecturerName;

	String lecturerEmail;

	String lecturerPhoneNumber;

	String lecturerAddress;

	public LecturerDTO() {
		super();
	}

	public LecturerDTO(String lecturerId, String lecturerName, String lecturerEmail, String lecturerPhoneNumber,
			String lecturerAddress) {
		super();
		this.lecturerId = lecturerId;
		this.lecturerName = lecturerName;
		this.lecturerEmail = lecturerEmail;
		this.lecturerPhoneNumber = lecturerPhoneNumber;
		this.lecturerAddress = lecturerAddress;
	}

	public String getLecturerId() {
		return lecturerId;
	}

	public void setLecturerId(String lecturerId) {
		this.lecturerId = lecturerId;
	}

	public String getLecturerName() {
		return lecturerName;
	}

	public void setLecturerName(String lecturerName) {
		this.lecturerName = lecturerName;
	}

	public String getLecturerEmail() {
		return lecturerEmail;
	}

	public void setLecturerEmail(String lecturerEmail) {
		this.lecturerEmail = lecturerEmail;
	}

	public String getLecturerPhoneNumber() {
		return lecturerPhoneNumber;
	}

	public void setLecturerPhoneNumber(String lecturerPhoneNumber) {
		this.lecturerPhoneNumber = lecturerPhoneNumber;
	}

	public String getLecturerAddress() {
		return lecturerAddress;
	}

	public void setLecturerAddress(String lecturerAddress) {
		this.lecturerAddress = lecturerAddress;
	}

	@Override
	public String toString() {
		return "LecturerDTO [lecturerId=" + lecturerId + ", lecturerName=" + lecturerName + ", lecturerEmail="
				+ lecturerEmail + ", lecturerPhoneNumber=" + lecturerPhoneNumber + ", lecturerAddress="
				+ lecturerAddress + "]";
	}



}
