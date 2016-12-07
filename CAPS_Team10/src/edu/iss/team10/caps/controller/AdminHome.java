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

import edu.iss.team10.caps.model.LecturerDTO;
import edu.iss.team10.caps.model.StudentDTO;
import edu.iss.team10.caps.service.CourseManager;
import edu.iss.team10.caps.service.LecturerManager;
import edu.iss.team10.caps.service.StudentManager;

/**
 * Servlet implementation class AdminHome
 */
@WebServlet({ "/adminHome", "/studentInsert", "/studentEdit", "/studentDelete", "/lecturerList", "/lecturerInsert",
		"/lecturerEdit", "/lecturerDelete" })
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

			break;
		case "/lecturerEdit":
			doEditLecturer(request, response);
			break;
		case "/lecturerDelete":

			break;
		case "/lecturerList":
			doGetLecturerLsit(request, response);
			break;
		default:
			break;
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// Student Method
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
		//DateFormat format = new SimpleDateFormat("d/MM/yyyy", Locale.ENGLISH);
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
		//DateFormat format = new SimpleDateFormat("d/MM/yyyy", Locale.ENGLISH);
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
		String lecturerId = (String) request.getAttribute("lecturerId");
		String lecturerName = (String) request.getAttribute("lecturerName");
		String lecturerEmail = (String) request.getAttribute("lecturerEmail");
		String lecturerPhoneNumber = (String) request.getAttribute("lecturerPhoneNumber");
		String lecturerAddress = (String) request.getAttribute("lecturerAddress");
		LecturerDTO lecturerDTO = new LecturerDTO(lecturerId, lecturerName, lecturerEmail, lecturerPhoneNumber,
				lecturerAddress);
		int update = lecturerManager.updateLecturer(lecturerDTO);
		System.out.println("Update Success");
		RequestDispatcher rd = request.getRequestDispatcher("views/Lecturer_List.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// Course Method

}
