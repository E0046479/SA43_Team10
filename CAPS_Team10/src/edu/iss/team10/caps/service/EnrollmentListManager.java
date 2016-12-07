package edu.iss.team10.caps.service;

import java.util.ArrayList;

import edu.iss.team10.caps.dao.DAOFactory;
import edu.iss.team10.caps.dao.EnrollmentDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.EnrollmentDTO;
import edu.iss.team10.caps.model.StudentDTO;

public class EnrollmentListManager {
	private EnrollmentDAO enrollmentDAO;

	public EnrollmentListManager() {
		enrollmentDAO = DAOFactory.loadInstance().getEnrollmentDAO();
	}

	public ArrayList<EnrollmentDTO> loadAllEnrollment() {
		ArrayList<EnrollmentDTO> enrollmentList = new ArrayList<EnrollmentDTO>();
		try {
			enrollmentList = enrollmentDAO.loadAllEnrollment();
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
        return enrollmentList;
	}

	public int deleteEnrollment(StudentDTO student,CourseDTO course) {
		int delete = 0;
		try {
			delete = enrollmentDAO.deleteEnrollment(student, course);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return delete;
	}

	public ArrayList<EnrollmentDTO> loadStudentEnrollment(String studentId) {
		ArrayList<EnrollmentDTO> studentEnrollmentList = new ArrayList<EnrollmentDTO>();
		try {
			studentEnrollmentList = enrollmentDAO.loadStudentEnrollment(studentId);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return studentEnrollmentList;
	}

}
