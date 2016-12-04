package edu.iss.team10.caps.service;

import java.util.ArrayList;

import edu.iss.team10.caps.dao.DAOFactory;
import edu.iss.team10.caps.dao.StudentDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.StudentDTO;
import edu.iss.team10.caps.model.StudentSearchDTO;

public class StudentManager {

	private StudentDAO studentDAO;

	public StudentManager() {
		studentDAO = DAOFactory.loadInstance().getStudentDAO();
	}

	@SuppressWarnings("finally")
	public ArrayList<StudentDTO> findStudentsByCriteria(StudentSearchDTO studentSearchDTO) {
		ArrayList<StudentDTO> currentList = new ArrayList<StudentDTO>();
		try {
			currentList = studentDAO.findStudentByCriteria(studentSearchDTO);
		} catch (DAOException e) {
			e.printStackTrace();
		}  catch (MyDataException e) {
			e.printStackTrace();
		} finally {
			return currentList;
		}
	}

	@SuppressWarnings("finally")
	public StudentDTO findStudent(String studentName) {
		StudentDTO currentStudent = new StudentDTO();
		try {
			currentStudent = studentDAO.findStudent(studentName);
		} catch (DAOException e) {
			e.printStackTrace();
		}  catch (MyDataException e) {
			e.printStackTrace();
		} finally {
			return currentStudent;
		}

	}

	@SuppressWarnings("finally")
	public ArrayList<StudentDTO> findAllStudent() {
		ArrayList<StudentDTO> currentList = new ArrayList<StudentDTO>();
		try {
			currentList = studentDAO.findAllStudent();
		} catch (DAOException e) {
			e.printStackTrace();
		}  catch (MyDataException e) {
			e.printStackTrace();
		} finally {
			return currentList;
		}
	}

	public int insertStudent(StudentDTO student) {
		int insert = 0;
		try {
			insert = studentDAO.insertStudent(student);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return insert;
	}

	public int updateStudent(StudentDTO student) {
		int update = 0;
		try {
			update = studentDAO.updateStudent(student);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return update;
	}

	public int deletestudent(StudentDTO student) {
		int delete = 0;
		try {
			delete = studentDAO.deleteStudent(student);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return delete;
	}
}
