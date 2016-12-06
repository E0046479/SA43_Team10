package edu.iss.team10.caps.model;

import java.io.Serializable;
import java.util.Date;

public class StudentDTO  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String studentId;

	String studentName;

	String studentEmail;

	String studentPhoneNumber;

	String studentAddress;

	Date enrolmentDate;

	public StudentDTO() {
		super();
	}

	public StudentDTO(String studentId, String studentName, String studentEmail, String studentPhoneNumber,
			String studentAddress, Date enrolmentDate) {
		super();
		this.studentId = studentId;
		this.studentName = studentName;
		this.studentEmail = studentEmail;
		this.studentPhoneNumber = studentPhoneNumber;
		this.studentAddress = studentAddress;
		this.enrolmentDate = enrolmentDate;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentEmail() {
		return studentEmail;
	}

	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}

	public String getStudentPhoneNumber() {
		return studentPhoneNumber;
	}

	public void setStudentPhoneNumber(String studentPhoneNumber) {
		this.studentPhoneNumber = studentPhoneNumber;
	}

	public String getStudentAddress() {
		return studentAddress;
	}

	public void setStudentAddress(String studentAddress) {
		this.studentAddress = studentAddress;
	}

	public Date getEnrolmentDate() {
		return enrolmentDate;
	}

	public void setEnrolmentDate(Date enrolmentDate) {
		this.enrolmentDate = enrolmentDate;
	}

	@Override
	public String toString() {
		return "StudentDTO [studentId=" + studentId + ", studentName=" + studentName + ", studentEmail=" + studentEmail
				+ ", studentPhoneNumber=" + studentPhoneNumber + ", studentAddress=" + studentAddress
				+ ", enrolmentDate=" + enrolmentDate + "]";
	}

}
