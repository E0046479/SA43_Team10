package edu.iss.team10.caps.dao;

import java.util.ArrayList;

import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.CourseSearchDTO;

public interface CourseDAO{

	public CourseDTO findCourse(String courseId) throws DAOException, MyDataException;

	public ArrayList<CourseDTO> findAllCourse() throws DAOException, MyDataException;

	public ArrayList<CourseDTO> findCourseByCriteria(CourseSearchDTO courseSearchDTO) throws DAOException, MyDataException;
	
	public int insertCourse(CourseDTO course) throws DAOException, MyDataException;

	public int updateCourse(CourseDTO course) throws DAOException, MyDataException;

	public int deleteCourse(CourseDTO course) throws DAOException, MyDataException;
	
	public int getTotalCourseCount() throws DAOException;
	
	public String getLastCourse() throws DAOException;
}
