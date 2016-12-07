package edu.iss.team10.caps.service;

import java.util.ArrayList;

import edu.iss.team10.caps.dao.DAOFactory;
import edu.iss.team10.caps.dao.mysql.EnrollmentDAO;
import edu.iss.team10.caps.dao.CourseDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.CourseSearchDTO;
import edu.iss.team10.caps.model.EnrollmentDTO;

public class CourseManager {

	private CourseDAO courseDAO;

	private EnrollmentDAO enrollmentDAO;

	public CourseManager() {
		courseDAO = DAOFactory.loadInstance().getCourseDAO();
		enrollmentDAO = DAOFactory.loadInstance().getEnrollmentDAO();
	}

	@SuppressWarnings("finally")
	public ArrayList<CourseDTO> findCoursesByCriteria(CourseSearchDTO courseSearchDTO) {
		ArrayList<CourseDTO> currentList = new ArrayList<CourseDTO>();
		try {
			currentList = courseDAO.findCourseByCriteria(courseSearchDTO);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		} finally {
			return currentList;
		}
	}

	@SuppressWarnings("finally")
	public CourseDTO findCourse(String courseName) {
		CourseDTO currentCourse = new CourseDTO();
		try {
			currentCourse = courseDAO.findCourse(courseName);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		} finally {
			return currentCourse;
		}

	}

	@SuppressWarnings("finally")
	public ArrayList<CourseDTO> findAllCourse() {
		ArrayList<CourseDTO> currentList = new ArrayList<CourseDTO>();
		try {
			currentList = courseDAO.findAllCourse();
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		} finally {
			return currentList;
		}
	}

	public int insertCourse(CourseDTO course) {
		int insert = 0;
		try {
			insert = courseDAO.insertCourse(course);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return insert;
	}

	public int updateCourse(CourseDTO course) {
		int update = 0;
		try {
			update = courseDAO.updateCourse(course);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return update;
	}

	public int deletecourse(CourseDTO course) {
		int delete = 0;
		try {
			delete = courseDAO.deleteCourse(course);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return delete;
	}

	public ArrayList<EnrollmentDTO> listByStudentID(String userId) {
		ArrayList<EnrollmentDTO> currentList = new ArrayList<EnrollmentDTO>();
		try {
			currentList = enrollmentDAO.listByStudentId(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return currentList;
	}
}
