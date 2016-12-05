package edu.iss.team10.caps.dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import edu.iss.team10.caps.dao.ConnectionHandler;
import edu.iss.team10.caps.dao.LoginDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.LoginDTO;

public class LoginDAOImpl implements LoginDAO{

	private ResultSet rs;
	@Override
	public LoginDTO findUser(String userId, String password) throws DAOException,MyDataException {
		
		LoginDTO loginDTO = null;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		
		String sl= "SELECT * FROM caps.login WHERE userId = ? AND password = ?";
		
		try {
			pstatement = connection.prepareStatement(sl);
			pstatement.setString(1, userId);
			pstatement.setString(2, password);
			rs = pstatement.executeQuery();
			while(rs.next())
			{
				loginDTO = new LoginDTO(rs.getString("userId"),rs.getString("password"),rs.getString("role"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("Error!occure");;
		}finally
		{
			ConnectionHandler.closeConnection(connection, pstatement);
		}		
		return loginDTO;
	}
	
}
