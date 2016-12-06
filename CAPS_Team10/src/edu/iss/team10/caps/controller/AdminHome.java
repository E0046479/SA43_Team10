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

import edu.iss.team10.caps.model.StudentDTO;
import edu.iss.team10.caps.service.StudentManager;

/**
 * Servlet implementation class AdminHome
 */
@WebServlet({ "/adminHome", "/studentInsert", "/studentEdit", "/studentDelete" })
public class AdminHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentManager studentManager = new StudentManager();

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

			break;
		case "/studentEdit":
			doEditStudent(request, response);
			break;
		case "/studentDelete":

			break;

		default:
			doGetStudentLsit(request, response);
			break;
		}
	}

	private void doGetStudentLsit(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<StudentDTO> studentList = studentManager.findAllStudent();
		request.setAttribute("studentList", studentList);
		RequestDispatcher rd = request.getRequestDispatcher("views/Student_List.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
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
		System.out.println("Update Success");

		RequestDispatcher rd = request.getRequestDispatcher("/main");
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

}
