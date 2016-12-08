package edu.iss.team10.caps.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.EnrollmentDTO;
import edu.iss.team10.caps.model.LoginDTO;
import edu.iss.team10.caps.model.StudentDTO;
import edu.iss.team10.caps.service.CourseManager;
import edu.iss.team10.caps.service.EnrollmentListManager;
import edu.iss.team10.caps.service.StudentManager;

/**
 * Servlet implementation class StudentHome
 */
@WebServlet({ "/studentHome", "/studentEnrollCourse", "/EnrolledCourses", "/studentDeleteEnroll"})
public class StudentHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CourseManager courseManager = new CourseManager();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentHome() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("StudentHome Servlet: URL : " + path);

		switch (path) {
		case "/studentHome":
			doGetGPAList(request, response);
			break;
		case "/studentEnrollCourse":
			doGetStudentEnrollCourseList(request, response);
			break;
		case "/EnrolledCourses":
			doGetViewEnrolledCourses(request, response);
			break;
		case "/studentDeleteEnroll":
			doDeleteEnrolledCourses(request, response);
			break;
		default:
			break;
		}
	}

	private void doDeleteEnrolledCourses(HttpServletRequest request, HttpServletResponse response) {
		EnrollmentListManager enrollmentListManager = new EnrollmentListManager();
		StudentDTO student = new StudentManager().findStudent(request.getParameter("studentID"));
		CourseDTO course = new CourseManager().findCourse(request.getParameter("courseID"));
		enrollmentListManager.deleteEnrollment(student, course);
		RequestDispatcher rd = request.getRequestDispatcher("/EnrolledCourses");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	private void doGetViewEnrolledCourses(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String path = "";
		LoginDTO user = null;
		if (session != null) {
			user = (LoginDTO) session.getAttribute("user");
		}
		if (user != null) {
			EnrollmentListManager enrollmentListManager = new EnrollmentListManager();
			ArrayList<EnrollmentDTO> enrolledCoursesList = enrollmentListManager.loadStudentEnrollment(user.getUserId());
			request.setAttribute("enrolledCoursesList", enrolledCoursesList);
			path = "views/EnrolledCourses.jsp";
		} else {
			request.setAttribute("logInError", "LogIn Error! Please Log In Again!");
			path = "views/login.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(path);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void doGetStudentEnrollCourseList(HttpServletRequest request, HttpServletResponse response) {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void doGetGPAList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		LoginDTO user = null;
		String path = "";
		if (session != null) {
			user = (LoginDTO) session.getAttribute("user");
		}
		System.out.println("StudentHome.doGetGPAList() : " + user.getUserId());
		if(user == null){
			path = "login.jsp";
		}else {
			
			ArrayList<EnrollmentDTO> courseList = courseManager.listByStudentID(user.getUserId());
			request.setAttribute("courseList", courseList);
			path = "views/GradeAndGPA.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(path);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
