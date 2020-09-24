package com.luv2code.servletdemo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.io.PrintWriter;  



import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import com.luv2code.servletdemo.*;


/**
 * Servlet implementation class Hospitalmanagement
 */
@WebServlet("/Hospitalmanagement")
public class Hospitalmanagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 
	 * 
	 */
	
	@Resource(name="jdbc/hospitalmanagement")
	private DataSource dataSource;
	String output=null;
	String email=null;
	
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
		Databaseconnection Databaseconnection = new Databaseconnection(dataSource);
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String thecommand= request.getParameter("command");
		
		if (thecommand == null) {
			thecommand = "LIST";
		}
		
		switch (thecommand)
		{
		case "ADD":
			try {
				addPatientdetails(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "ADDDoctor":
			try {
				addDoctordetails(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "LOGIN":
			try {
				Login(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "COVID":
			covid(request, response);
			break;
		case "LIST":
			listStudents(request, response);
			break;
		case "BOOKAPPOINTMENT":
			try {
				bookAppointment(request, response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			break;
		}
			
	}


	private void covid(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String  age=request.getParameter("Age");
		String body_temperature=request.getParameter("body temperature");
		String symptoms=request.getParameter("symptoms");
		String smoking=request.getParameter("smoking");
		String travel=request.getParameter("travel");
		String previoushealth=request.getParameter("Diabetes");
		
		if(body_temperature.equals("normal")||symptoms.equals("None of these")||smoking.equals("No")||travel.equals("No travel History")||travel.equals("No contact with affected people"))
		{
			response.sendRedirect("covidresponse.jsp");
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
	
	
		
		
		
	}


	private void bookAppointment(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		
		String doctorName = request.getParameter("doctorname");
		String[] doctor = doctorName.split(":"); 
		  
          String[] Name=doctor[0].split(" ");
          String doctorfirstName=Name[0];
          String doctorlastName=Name[1];
           String specilization=doctor[1];
		String appointment_date = request.getParameter("appointmemt date");
		String Location = request.getParameter("location");
		String Timeslot = request.getParameter("Timeslot");
		String description = request.getParameter("description");
		String Mobile = request.getParameter("mobilenumber");
		String Email = request.getParameter("email");
		
		bookAppointment appointment=new bookAppointment( doctorfirstName,doctorlastName,  specilization,  appointment_date, Location, Timeslot,  description,  Mobile,  Email);
		
		if(Databaseconnection.bookAppointment(appointment))
		{
			String to=Email;
			String subject="Doctor appointment";
			String msg=" Dear Patient,\n"
					+ "Your appointment has been confirmed.If you want to change your appointment, Feel free to contact us at silvercresthospitals@gmail.com.\n Thank you. \n - Silver crest Team";
			Mailer.send(to,subject,msg);
		response.sendRedirect("main.jsp");
		
		}
		else
		{
			response.sendRedirect("bookappointment.jsp");
		}
		
		
	}


	private void listStudents(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		ArrayList<Patientdetails> details = (ArrayList<Patientdetails>) Databaseconnection.Details(email);
		request.setAttribute("profile", details);
		
		
		String mail=null;
		ArrayList<Patientdetails> profile=(ArrayList<Patientdetails>) request.getAttribute("profile");
		
		 for(Patientdetails std: profile)
	 		{
	 			 mail=std.getEmail();
	 			 out.println("logined"+ mail);
	 			
	 		}
		 
		 request.setAttribute("mailid", mail);
		 request.getRequestDispatcher("patientprofile.jsp").forward(request, response);
		
		//RequestDispatcher rd=request.getRequestDispatcher("PatientProfile.jsp");
				//rd.forward(request, response);
		
		 
		 
	        
		
	}
	


	private void Login(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		Boolean loginConnection=false;
		String access_level=request.getParameter("access_level");
		 email=request.getParameter("username");
		String password=request.getParameter("password");
		System.out.println("accc: "+access_level);
		System.out.println("entered");
		if(access_level.equals("user"))
		{
			System.out.println("entered1");
Patientdetails patientrecord=new Patientdetails(access_level,email,password);
    loginConnection=Databaseconnection.Login(patientrecord.getAccess_level(),patientrecord.getEmail(),patientrecord.getPassword());
    out.println(loginConnection);
		}
		else
		{
			//doctorDetails doctorrecord=new doctorDetails(access_level,email,password);
			loginConnection=Databaseconnection.Login(access_level,email,password);
		}
		
		 if(loginConnection)
		 
		 {
			 HttpSession session=request.getSession();
			 
			 session.setAttribute("userid", email);
			 
			 session.setAttribute("access_level",access_level );
			 
			try {
				response.sendRedirect("main.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			try {
				System.out.println("enter");
				response.sendRedirect("login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		 
		/* try {
			response.getWriter().println(output);
			response.getWriter().println(patientrecord.getEmail());
			response.getWriter().println(patientrecord.getPassword());
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		 
		
	}


	private void addPatientdetails(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		// TODO Auto-generated method stub
		
		String patientName = request.getParameter("firstname");
		String Gender = request.getParameter("gender");
		String DOB = request.getParameter("date of birth");
		String Age = request.getParameter("age");
		String Mobile = request.getParameter("mobilenumber");
		String Email = request.getParameter("email");
		String Password = request.getParameter("password");
		String maritalstatus = request.getParameter(" marital");
		
		Patientdetails patientrecord=new Patientdetails(patientName,Gender,DOB, Age,Mobile, Email,Password, maritalstatus);
		
		if(Databaseconnection.addPatientDetails(patientrecord))
		{
		response.sendRedirect("login.jsp");
		
		}
		else
		{
			response.sendRedirect("signup.jsp");
		}
		
	}
	
	private void addDoctordetails(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
		String FirstName = request.getParameter("firstname");
		String LastName = request.getParameter("Last name");
		String Gender = request.getParameter("gender");
		String DOB = request.getParameter("date of birth");
		String Mobile = request.getParameter("mobilenumber");
		String Email = request.getParameter("email");
		String Password = request.getParameter("password");
		String Qualification = request.getParameter("Qualification");
		String speciality = request.getParameter("speciality");
		String Experience = request.getParameter("Experience");
		
		
		doctorDetails doctorrecord=new doctorDetails(FirstName,LastName,Gender,DOB,Mobile,Email,Password,Qualification,speciality,Experience);
		
	
		
		if(Databaseconnection.addDoctorDetails(doctorrecord))
		{
		response.sendRedirect("home.jsp");
		
		}
		else
		{
			response.sendRedirect("doctorRegistration.jsp");
		}
		
	}


}
