package edu.iss.team10.caps.controller;

import java.io.IOException;
import java.util.ArrayList;

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
@WebServlet({ "/adminHome", "/adminHome/studentInsert", "/adminHome/studentEdit", "/adminHome/studentDelete" })
public class AdminHome extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		case "/adminHome/studentInsert":
			
			break;
		case "/adminHome/studentEdit":

			break;
		case "/adminHome/studentDelete":

			break;

		default:
			doGetStudentLsit(request, response);
			break;
		}
	}

	private void doGetStudentLsit(HttpServletRequest request, HttpServletResponse response) {
		StudentManager studentManager = new StudentManager();
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
