package edu.iss.team10.caps.dao;

import edu.iss.team10.caps.dao.mysql.DAOFactoryImpl;

public abstract class DAOFactory {

	public abstract StudentDAO getStudentDAO();

	public static DAOFactory loadInstance() {
		return new DAOFactoryImpl();
	}
}
