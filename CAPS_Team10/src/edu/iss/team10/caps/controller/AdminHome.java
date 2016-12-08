  package edu.iss.team10.caps.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.EnrollmentDTO;
import edu.iss.team10.caps.model.LecturerDTO;
import edu.iss.team10.caps.model.StudentDTO;
import edu.iss.team10.caps.service.CourseManager;
import edu.iss.team10.caps.service.EnrollmentListManager;
import edu.iss.team10.caps.service.LecturerManager;
import edu.iss.team10.caps.service.StudentManager;

/**
 * Servlet implementation class AdminHome
 */
@WebServlet({ "/adminHome", "/studentInsert", "/studentEdit", "/studentDelete", "/lecturerList", "/lecturerInsert",
		"/lecturerEdit", "/lecturerDelete", "/courseList", "/courseInsert", "/courseEdit", "/courseDelete",
		"/adminEnrollment", "/deleteEnrollment" })
public class AdminHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentManager studentManager = new StudentManager();
	LecturerManager lecturerManager = new LecturerManager();
	CourseManager courseManager = new CourseManager();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminHome() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("AdminHome Servlet: URL : " + path);

		switch (path) {
		case "/studentInsert":
			doInsertStudent(request, response);
			break;
		case "/studentEdit":
			doEditStudent(request, response);
			break;
		case "/studentDelete":
			doDeleteStudent(request, response);
			break;
		case "/adminHome":
			doGetStudentLsit(request, response);
			break;
		case "/lecturerInsert":
			doInsertLecturer(request, response);
			break;
		case "/lecturerEdit":
			doEditLecturer(request, response);
			break;
		case "/lecturerDelete":
			doDeleteLecturer(request, response);
			break;
		case "/lecturerList":
			doGetLecturerLsit(request, response);
			break;
		case "/courseInsert":
			doInsertCourse(request, response); 
			break;
		case "/courseEdit":
			doEditCourse(request, response);
			break;
		case "/courseDelete":
			doDeleteCourse(request, response);
			break;
		case "/courseList":
			doGetCourseLsit(request, response);
			break;
		case "/adminEnrollment":
			doGetEnrollmentList(request, response);
			break;
		case "/deleteEnrollment":
			doDeleteEnrollment(request, response);
			break;
		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// Student Method

	private void doGetStudentLsit(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<StudentDTO> studentList = studentManager.findAllStudent();
		request.setAttribute("studentList", studentList);
		RequestDispatcher rd = request.getRequestDispatcher("views/Student_List.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doInsertStudent(HttpServletRequest request, HttpServletResponse response) {
		int totalStudentCount = studentManager.getTotalStudentCount();
		String studentId = "";
		if (totalStudentCount == 0) {
			studentId = "s001";
		} else {
			totalStudentCount++;
			studentId = "s00" + totalStudentCount;
		}
		String studentName = (String) request.getParameter("studentName");
		String studentEmail = (String) request.getParameter("studentEmail");
		String studentPhoneNumber = (String) request.getParameter("studentPhoneNumber");
		String studentAddress = (String) request.getParameter("studentAddress");
		String enrollmentString = (String) request.getParameter("enrollmentDate");
		System.out.println(enrollmentString);
		DateFormat format = new SimpleDateFormat("yyyy-MM-d", Locale.ENGLISH);
		// DateFormat format = new SimpleDateFormat("d/MM/yyyy",
		// Locale.ENGLISH);
		Date enrollmentDate = null;
		try {
			enrollmentDate = format.parse(enrollmentString);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		StudentDTO studentDTO = new StudentDTO(studentId, studentName, studentEmail, studentPhoneNumber, studentAddress,
				enrollmentDate);
		int insert = studentManager.insertStudent(studentDTO);
		if (insert > 0) {
			System.out.println("Insert Success");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/main");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doEditStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String studentId = (String) request.getParameter("studentId");
		String studentName = (String) request.getParameter("studentName");
		String studentEmail = (String) request.getParameter("studentEmail");
		String studentPhoneNumber = (String) request.getParameter("studentPhoneNumber");
		String studentAddress = (String) request.getParameter("studentAddress");
		String enrollmentString = (String) request.getParameter("enrollmentDate");
		System.out.println(enrollmentString);
		DateFormat format = new SimpleDateFormat("yyyy-MM-d", Locale.ENGLISH);
		Date enrollmentDate = null;
		try {
			enrollmentDate = format.parse(enrollmentString);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		StudentDTO studentDTO = new StudentDTO(studentId, studentName, studentEmail, studentPhoneNumber, studentAddress,
				enrollmentDate);
		int update = studentManager.updateStudent(studentDTO);
		if (update > 0) {
			System.out.println("Update Success");
		} else {
			System.out.println("Fail Update Student");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/main");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private void doDeleteStudent(HttpServletRequest request, HttpServletResponse response) {
		String studentId = request.getParameter("studentId");
		StudentDTO student = new StudentDTO();
		student.setStudentId(studentId);
		int delete = studentManager.deletestudent(student);
		if (delete > 0) {
			System.out.println("Delete Success");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/adminHome");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// Lecturer Methods
	private void doGetLecturerLsit(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<LecturerDTO> lecturerList = lecturerManager.findAllLecturer();
		request.setAttribute("lecturerList", lecturerList);
		RequestDispatcher rd = request.getRequestDispatcher("views/Lecturer_List.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private void doEditLecturer(HttpServletRequest request, HttpServletResponse response) {
		String lecturerId = (String) request.getParameter("lecturerId");
		String lecturerName = (String) request.getParameter("lecturerName");
		String lecturerEmail = (String) request.getParameter("lecturerEmail");
		String lecturerPhoneNumber = (String) request.getParameter("lecturerPhoneNumber");
		String lecturerAddress = (String) request.getParameter("lecturerAddress");
		LecturerDTO lecturerDTO = new LecturerDTO(lecturerId, lecturerName, lecturerEmail, lecturerPhoneNumber,
				lecturerAddress);
		int update = lecturerManager.updateLecturer(lecturerDTO);
		if (update > 0) {
			System.out.println("Update Lecturer Success");
		} else {
			System.out.println("Fail Update Lecturer");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/lecturerList");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private void doInsertLecturer(HttpServletRequest request, HttpServletResponse response) {
		int totallecturercount = lecturerManager.getTotalLecturerCount();
		String id = null;
		if (totallecturercount == 0) {
			id = "l001";
		} else {
			totallecturercount++;
			id = "l00" + totallecturercount;
		}
		String lecturerId = id;
		String lecturerName = request.getParameter("lecturerName");
		String lecturerEmail = request.getParameter("lecturerEmail");
		String lecturerAddress = request.getParameter("lecturerAddress");
		String lecturerPhoneNumber = request.getParameter("lecturerPhoneNumber");
		LecturerDTO lecturer = new LecturerDTO(lecturerId, lecturerName, lecturerEmail, lecturerPhoneNumber,
				lecturerAddress);
		int insert = lecturerManager.insertLecturer(lecturer);
		if (insert > 0) {
			System.out.println("Insert Lecturer successfully!");
		} else {
			System.out.println("Fail Insert Lecturer");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/lecturerList");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int doDeleteLecturer(HttpServletRequest request, HttpServletResponse response) {
		int del = 0;
		String lecturerId = request.getParameter("lecturerId");
		LecturerDTO lecturer = new LecturerDTO();
		lecturer.setLecturerId(lecturerId);
		del = lecturerManager.deletelecturer(lecturer);
		if (del > 0) {
			System.out.println("Delete successfully!");
		} else {
			System.out.println("Fail Delete Lecturer");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/adminHome");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return del;
	}

	// Course Method
	private void doGetCourseLsit(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CourseDTO> courseList = courseManager.findAllCourse();
		request.setAttribute("courseList", courseList);
		RequestDispatcher rd = request.getRequestDispatcher("views/Course_List.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doInsertCourse(HttpServletRequest request, HttpServletResponse response) {
		int totalCourseCount = courseManager.getTotalCourseCount();
		String courseId = "";
		if (totalCourseCount == 0) {
			courseId = "c001";
		} else {
			totalCourseCount++;
			courseId = "c00" + totalCourseCount;
		}
		String courseName = (String) request.getParameter("courseName");
		String lecturerId = (String) request.getParameter("lecturerId");
		LecturerDTO lecturer = lecturerManager.findLecturer(lecturerId);
		String courseDescription = (String) request.getParameter("courseDescription");
		String courseType = (String) request.getParameter("courseType");
		Double courseDuration = Double.parseDouble(request.getParameter("courseDuration"));
		String courseStartDateString = (String) request.getParameter("courseStartDate");
		DateFormat format = new SimpleDateFormat("yyyy-MM-d", Locale.ENGLISH);
		Date courseStartDate = null;
		try {
			courseStartDate = format.parse(courseStartDateString);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		int courseSize = Integer.parseInt(request.getParameter("courseSize"));
		float courseCredit = Float.parseFloat(request.getParameter("courseCredit"));

		CourseDTO courseDTO = new CourseDTO(courseId, courseName, lecturer, courseDescription, courseType,
				courseDuration, courseStartDate, courseSize, courseCredit);
		int insert = courseManager.insertCourse(courseDTO);
		if (insert > 0) {
			System.out.println("Insert Course Success");
		} else {
			System.out.println("Fail Course Insert");
		}

		RequestDispatcher rd = request.getRequestDispatcher("/courseList");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doEditCourse(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String courseId = (String) request.getParameter("courseId");
		String courseName = (String) request.getParameter("courseName");
		String lecturerId = (String) request.getParameter("lecturerId");
		LecturerDTO lecturer = lecturerManager.findLecturer(lecturerId);
		String courseDescription = (String) request.getParameter("courseDescription");
		String courseType = (String) request.getParameter("courseType");
		Double courseDuration = Double.parseDouble(request.getParameter("courseDuration"));
		String courseStartDateString = (String) request.getParameter("courseStartDate");
		DateFormat format = new SimpleDateFormat("yyyy-MM-d", Locale.ENGLISH);
		Date courseStartDate = null;
		try {
			courseStartDate = format.parse(courseStartDateString);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		int courseSize = Integer.parseInt(request.getParameter("courseSize"));
		float courseCredit = Float.parseFloat(request.getParameter("courseCredit"));

		CourseDTO courseDTO = new CourseDTO(courseId, courseName, lecturer, courseDescription, courseType,
				courseDuration, courseStartDate, courseSize, courseCredit);
		int update = courseManager.updateCourse(courseDTO);
		if (update > 0) {
			System.out.println("Update Course Success");
		} else {
			System.out.println("Fail Course Update");
		}

		RequestDispatcher rd = request.getRequestDispatcher("/courseList");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doDeleteCourse(HttpServletRequest request, HttpServletResponse response) {
		String courseId = request.getParameter("courseId");
		CourseDTO course = new CourseDTO();
		course.setCourseId(courseId);
		int delete = courseManager.deletecourse(course);
		if (delete > 0) {
			System.out.println("Delete Course Success");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/courseList");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// Enrollment

	private void doGetEnrollmentList(HttpServletRequest request, HttpServletResponse response) {
		EnrollmentListManager enrollmentListManager = new EnrollmentListManager();
		ArrayList<EnrollmentDTO> enrollmentList = enrollmentListManager.loadAllEnrollment();
		request.setAttribute("enrollmentList", enrollmentList);
		RequestDispatcher rd = request.getRequestDispatcher("views/Admin_Enrollment.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doDeleteEnrollment(HttpServletRequest request, HttpServletResponse response) {
		EnrollmentListManager enrollmentListManager = new EnrollmentListManager();
		StudentDTO student = new StudentManager().findStudent(request.getParameter("studentID"));
		CourseDTO course = new CourseManager().findCourse(request.getParameter("courseID"));
		enrollmentListManager.deleteEnrollment(student, course);
		RequestDispatcher rd = request.getRequestDispatcher("/adminEnrollment");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}
}
