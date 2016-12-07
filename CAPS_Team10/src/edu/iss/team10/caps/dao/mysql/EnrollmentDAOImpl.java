package edu.iss.team10.caps.dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import edu.iss.team10.caps.dao.ConnectionHandler;
import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.EnrollmentDTO;
import edu.iss.team10.caps.model.StudentDTO;
import edu.iss.team10.caps.service.CourseManager;
import edu.iss.team10.caps.service.StudentManager;

public class EnrollmentDAOImpl implements EnrollmentDAO {
	private ResultSet rs;

	public ArrayList<EnrollmentDTO> listByStudentId(String userId) {
		ArrayList<EnrollmentDTO> enrollmentList = new ArrayList<EnrollmentDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String select = "select * from caps.course c,caps.enrollment e,caps.student s"
				+ " where c.courseID =e.courseId and e.studentId=s.studentId and s.studentId=?";

		try {
			pstatement = connection.prepareStatement(select);
			pstatement.setString(1, userId);
			rs = pstatement.executeQuery();

			while (rs.next()) {
				String courseId = rs.getString("courseId");
				String studentId = rs.getString("studentId");
				float grade = rs.getFloat("grade");
				Date courseStartDate = rs.getDate("courseStartDate");
				Date courseEnrollmentDate = rs.getDate("courseEnrollmentDate");
				boolean allowDelete = true;

				StudentDTO newStudent = new StudentManager().findStudent(studentId);
				CourseDTO newCourse = new CourseManager().findCourse(courseId);
				EnrollmentDTO enrollment = new EnrollmentDTO(newCourse, newStudent, courseEnrollmentDate, grade,
						allowDelete);
				enrollmentList.add(enrollment);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return enrollmentList;
	}
}
