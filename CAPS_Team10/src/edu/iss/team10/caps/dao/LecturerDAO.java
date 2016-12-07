package edu.iss.team10.caps.dao;

import java.util.ArrayList;

import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.LecturerDTO;
import edu.iss.team10.caps.model.LecturerSearchDTO;

public interface LecturerDAO {

	LecturerDTO findLecturer(String lecturerId) throws DAOException, MyDataException;

	ArrayList<LecturerDTO> findAllLecturer() throws DAOException, MyDataException;

	ArrayList<LecturerDTO> findLecturerByCriteria(LecturerSearchDTO lecturerSearchDTO)
			throws DAOException, MyDataException;

	int insertLecturer(LecturerDTO lecturer) throws DAOException, MyDataException;

	int updateLecturer(LecturerDTO lecturer) throws DAOException, MyDataException;

	int deleteLecturer(LecturerDTO lecturer) throws DAOException, MyDataException;

	int getTotalLecturerCount() throws DAOException;

}
