package edu.iss.team10.caps.dao.mysql;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.iss.team10.caps.dao.ConnectionHandler;
import edu.iss.team10.caps.dao.CourseDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.CourseSearchDTO;
import edu.iss.team10.caps.model.LecturerDTO;

public class CourseDAOImpl implements CourseDAO {

	private ResultSet rs;

	@Override
	public CourseDTO findCourse(String courseId) throws DAOException, MyDataException {
		CourseDTO courseDTO = null;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String selectCourse = "SELECT * FROM caps.course WHERE courseId=?";
		String selectLecturer = "SELECT * FROM caps.lecturer WHERE lecturerId=?";

		try {
			pstatement = connection.prepareStatement(selectCourse);
			pstatement.setString(1, courseId);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				LecturerDTO lecturer = new LecturerDTO();
				courseDTO = new CourseDTO(rs.getString("courseId"), rs.getString("courseName"),
						lecturer, rs.getString("courseDescription"), rs.getString("courseType"),
						rs.getDouble("courseDuration"), rs.getDate("enrolmentDate"), rs.getInt("courseSize"),
						rs.getFloat("courseCredit"));
			}
			if (courseDTO == null) {
				throw new MyDataException("There is no Course Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Select Course info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return null;
	}

	@Override
	public ArrayList<CourseDTO> findAllCourse() throws DAOException, MyDataException {
		ArrayList<CourseDTO> result = new ArrayList<CourseDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String select = "SELECT * FROM caps.course;";
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				LecturerDTO lecturer = new LecturerDTO();
				CourseDTO courseDTO = new CourseDTO(rs.getString("courseId"), rs.getString("courseName"),
						lecturer, rs.getString("courseDescription"), rs.getString("courseType"),
						rs.getDouble("courseDuration"), rs.getDate("enrolmentDate"), rs.getInt("courseSize"),
						rs.getFloat("courseCredit"));
				result.add(courseDTO);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no Course Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all course info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public ArrayList<CourseDTO> findCourseByCriteria(CourseSearchDTO courseSearchDTO)
			throws DAOException, MyDataException {
		ArrayList<CourseDTO> result = new ArrayList<CourseDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String select = null;
		if (courseSearchDTO.getCourseName().trim().equalsIgnoreCase("")) {

			select = "SELECT * FROM caps.course WHERE courseName LIKE '" + courseSearchDTO.getCourseName().trim()
					+ "%';";
		} else {
			if (courseSearchDTO.getCourseName().trim().equalsIgnoreCase("")) {
				select = "SELECT * FROM caps.course WHERE courseName LIKE '" + courseSearchDTO.getCourseName().trim()
						+ "%';";
			} else {
				select = "SELECT * FROM caps.course WHERE courseId LIKE '" + courseSearchDTO.getCourseId().trim()
						+ "%' AND coursetName LIKE '" + courseSearchDTO.getCourseName() + "%';";
			}
		}
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				LecturerDTO lecturer = new LecturerDTO();
				CourseDTO courseDTO = new CourseDTO(rs.getString("courseId"), rs.getString("courseName"),
						lecturer, rs.getString("courseDescription"), rs.getString("courseType"),
						rs.getDouble("courseDuration"), rs.getDate("enrolmentDate"), rs.getInt("courseSize"),
						rs.getFloat("courseCredit"));
				result.add(courseDTO);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no Course Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all course info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int insertCourse(CourseDTO course) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String ins = "INSERT INTO caps.course(courseId, courseName, lecturerId, courseDescription, courseType,"
				+ "courseDuration, courseStartDate, courseSize, courseCredit) " + "VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, course.getCourseId());
			pstatement.setString(2, course.getCourseName());
			pstatement.setString(3, course.getLecturer().getLecturerId());
			pstatement.setString(4, course.getCourseDescription());
			pstatement.setString(5, course.getCourseType());
			pstatement.setDouble(6, course.getCourseDuration());
			pstatement.setDate(7, (Date) course.getCourseStartDate());
			pstatement.setInt(8, course.getCourseSize());
			pstatement.setFloat(9, course.getCourseCredit());

			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Insert Specific Course!");
			} else {
				System.out.println("Success ! Insert Course!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to insert Course info to database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int updateCourse(CourseDTO course) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String ins = "UPDATE caps.course SET courseName=?, lecturerId=?, courseDescription=?, courseType=?, courseDuration=?, courseStartDate=?, courseSize=?, courseCredit=? WHERE courseId = ?; ";

		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, course.getCourseId());
			pstatement.setString(2, course.getCourseName());
			pstatement.setString(3, course.getLecturer().getLecturerId());
			pstatement.setString(4, course.getCourseDescription());
			pstatement.setString(5, course.getCourseType());
			pstatement.setDouble(6, course.getCourseDuration());
			pstatement.setDate(7, (Date) course.getCourseStartDate());
			pstatement.setInt(8, course.getCourseSize());
			pstatement.setFloat(9, course.getCourseCredit());

			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Update Specific Course!");
			} else {
				System.out.println("Success ! Update Course!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Update Course info to database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int deleteCourse(CourseDTO course) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String ins = "DELETE FROM caps.course WHERE courseId = ?; ";

		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, course.getCourseId());

			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Delete Specific Course!");
			} else {
				System.out.println("Success ! Delete Course!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Delete Course info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

}
