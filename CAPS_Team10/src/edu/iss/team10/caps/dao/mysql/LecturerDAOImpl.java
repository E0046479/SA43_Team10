package edu.iss.team10.caps.dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.iss.team10.caps.dao.ConnectionHandler;
import edu.iss.team10.caps.dao.LecturerDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.LecturerDTO;
import edu.iss.team10.caps.model.LecturerSearchDTO;

public class LecturerDAOImpl implements LecturerDAO {

	private ResultSet rs;
	@Override
	public LecturerDTO findLecturer(String lecturerId) throws DAOException, MyDataException {
		LecturerDTO lecturerDTO = null;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String select = "SELECT * FROM caps.lecturer WHERE lecturerId=?";

		try {
			pstatement = connection.prepareStatement(select);
			pstatement.setString(1, lecturerId);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				lecturerDTO = new LecturerDTO(rs.getString("lecturerId"), rs.getString("lecturerName"),
						rs.getString("lecturerEmail"), rs.getString("lecturerPhoneNumber"),
						rs.getString("lecturerAddress"));
			}
			if (lecturerDTO == null) {
				throw new MyDataException("There is no Lecturer Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Select Lecturer info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return null;
	}

	@Override
	public ArrayList<LecturerDTO> findAllLecturer() throws DAOException, MyDataException {
		ArrayList<LecturerDTO> result = new ArrayList<LecturerDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String select = "SELECT * FROM caps.lecturer;";
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				LecturerDTO lecturerDTO = new LecturerDTO(rs.getString("lecturerId"), rs.getString("lecturerName"),
						rs.getString("lecturerEmail"), rs.getString("lecturerPhoneNumber"),
						rs.getString("lecturerAddress"));
				result.add(lecturerDTO);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no lecturer Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all stuedent info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public ArrayList<LecturerDTO> findLecturerByCriteria(LecturerSearchDTO lecturerSearchDTO)
			throws DAOException, MyDataException {
		ArrayList<LecturerDTO> result = new ArrayList<LecturerDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String select = null;
		if (lecturerSearchDTO.getLecturerName().trim().equalsIgnoreCase("")) {

			select = "SELECT * FROM caps.lecturer WHERE lecturerName LIKE '" + lecturerSearchDTO.getLecturerName().trim()
					+ "%';";
		} else {
			if (lecturerSearchDTO.getLecturerName().trim().equalsIgnoreCase("")) {
				select = "SELECT * FROM caps.lecturer WHERE lecturerName LIKE '"
						+ lecturerSearchDTO.getLecturerName().trim() + "%';";
			} else {
				select = "SELECT * FROM caps.lecturer WHERE lecturerId LIKE '" + lecturerSearchDTO.getLecturerId().trim()
						+ "%' AND lecturerName LIKE '" + lecturerSearchDTO.getLecturerName() + "%';";
			}
		}
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				LecturerDTO lecturerDTO = new LecturerDTO(rs.getString("lecturerId"), rs.getString("lecturerName"),
						rs.getString("lecturerEmail"), rs.getString("lecturerPhoneNumber"),
						rs.getString("lecturerAddress"));
				result.add(lecturerDTO);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no lecturer Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all lecturer info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int insertLecturer(LecturerDTO lecturer) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String ins = "INSERT INTO caps.lecturer(lecturerId, lecturerName, lecturerEmail, lecturerPhoneNumber, lecturerAddress) "
				+ "VALUES (?,?,?,?,?,?)";
		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, lecturer.getLecturerId());
			pstatement.setString(2, lecturer.getLecturerName());
			pstatement.setString(3, lecturer.getLecturerEmail());
			pstatement.setString(4, lecturer.getLecturerPhoneNumber());
			pstatement.setString(5, lecturer.getLecturerAddress());

			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Insert Specific Lecturer!");
			} else {
				System.out.println("Success ! Insert Lecturer!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to insert lecturer info to database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int updateLecturer(LecturerDTO lecturer) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String ins = "UPDATE caps.lecturer SET lecturerName=?, lecturerEmail=?, lecturerPhoneNumber=?, lecturerAddress=? WHERE lecturerId = ?; ";

		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, lecturer.getLecturerName());
			pstatement.setString(2, lecturer.getLecturerEmail());
			pstatement.setString(3, lecturer.getLecturerPhoneNumber());
			pstatement.setString(4, lecturer.getLecturerAddress());
			pstatement.setString(5, lecturer.getLecturerId());

			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Update Specific Lecturer!");
			} else {
				System.out.println("Success ! Update Lecturer!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Update Lecturer info to database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int deleteLecturer(LecturerDTO lecturer) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String ins = "DELETE FROM caps.lecturer WHERE lecturerId = ?; ";

		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, lecturer.getLecturerId());

			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Delete Specific Lecturer!");
			} else {
				System.out.println("Success ! Delete Lecturer!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Delete lecturer info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

}
