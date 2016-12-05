package edu.iss.team10.caps.dao;

import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.LoginDTO;

public interface LoginDAO {
	public LoginDTO findUser(String userId, String password) throws DAOException, MyDataException;

}
