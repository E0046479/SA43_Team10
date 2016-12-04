package edu.iss.team10.caps.dao.mysql;

import edu.iss.team10.caps.dao.DAOFactory;
import edu.iss.team10.caps.dao.StudentDAO;

public class DAOFactoryImpl extends DAOFactory {

	private StudentDAO studentDAO = new StudentDAOImpl();

	@Override
	public StudentDAO getStudentDAO() {
		return studentDAO;
	}

}
