package edu.iss.team10.caps.model;

import java.io.Serializable;
import java.util.Date;

public class CourseDTO implements Serializable {

	private static final long serialVersionUID = 1L;

	String courseId;
	String courseName;
	String lecturerId;
	String courseDescription;
	String courseType;
	Double courseDuration;
	Date courseStartDate;
	int courseSize;
	float courseCredit;

	public CourseDTO() {
		super();
	}

	public CourseDTO(String courseId, String courseName, String lecturerId, String courseDescription, String courseType,
			Double courseDuration, Date courseStartDate, int courseSize, float courseCredit) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.lecturerId = lecturerId;
		this.courseDescription = courseDescription;
		this.courseType = courseType;
		this.courseDuration = courseDuration;
		this.courseStartDate = courseStartDate;
		this.courseSize = courseSize;
		this.courseCredit = courseCredit;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getLecturerId() {
		return lecturerId;
	}

	public void setLecturerId(String lecturerId) {
		this.lecturerId = lecturerId;
	}

	public String getCourseDescription() {
		return courseDescription;
	}

	public void setCourseDescription(String courseDescription) {
		this.courseDescription = courseDescription;
	}

	public String getCourseType() {
		return courseType;
	}

	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	public Double getCourseDuration() {
		return courseDuration;
	}

	public void setCourseDuration(Double courseDuration) {
		this.courseDuration = courseDuration;
	}

	public Date getCourseStartDate() {
		return courseStartDate;
	}

	public void setCourseStartDate(Date courseStartDate) {
		this.courseStartDate = courseStartDate;
	}

	public int getCourseSize() {
		return courseSize;
	}

	public void setCourseSize(int courseSize) {
		this.courseSize = courseSize;
	}

	public float getCourseCredit() {
		return courseCredit;
	}

	public void setCourseCredit(float courseCredit) {
		this.courseCredit = courseCredit;
	}

	@Override
	public String toString() {
		return "CourseDTO [courseId=" + courseId + ", courseName=" + courseName + ", lecturerId=" + lecturerId
				+ ", courseDescription=" + courseDescription + ", courseType=" + courseType + ", courseDuration="
				+ courseDuration + ", courseStartDate=" + courseStartDate + ", courseSize=" + courseSize
				+ ", courseCredit=" + courseCredit + "]";
	}

}
