package edu.iss.team10.caps.dao.mysql;

import java.util.ArrayList;

import edu.iss.team10.caps.model.EnrollmentDTO;

public interface EnrollmentDAO {
	public ArrayList<EnrollmentDTO> listByStudentId(String userId);
}
