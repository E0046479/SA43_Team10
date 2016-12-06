package edu.iss.team10.caps.dao.mysql;

import edu.iss.team10.caps.dao.DAOFactory;
import edu.iss.team10.caps.dao.LoginDAO;
import edu.iss.team10.caps.dao.StudentDAO;

public class DAOFactoryImpl extends DAOFactory {

	private StudentDAO studentDAO = new StudentDAOImpl();
	private LoginDAO loginDAO = new LoginDAOImpl();

	@Override
	public StudentDAO getStudentDAO() {
		return studentDAO;
	}

	@Override
	public LoginDAO getLoginDAO() {
		return loginDAO;
	}

}
