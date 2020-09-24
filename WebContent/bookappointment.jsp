<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,com.luv2code.servletdemo.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="homestyle.css">
<link rel="stylesheet" type="text/css" href="registration.css">
</head>
<style>
section{
background-size: 100% 500px; 
text-align: center;
 
}

.img{
background-image: url('signup-image.jpg');
}
</style>
<body>

<% 
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("main.jsp");
}

%>

<%@include  file="header.jsp" %>

<%@include  file="navigation.jsp" %>

<% ResultSet resultset =null;%>


<% 
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hospitalmanagement","root","spandana14"); 
       Statement statement = con.createStatement() ;

       resultset =statement.executeQuery("select concat(FirstName,\" \",LastName) as names, specilization from doctordetails") ; %>

<section class="img">

<form action="Hospitalmanagement" method="GET">
<input type="hidden" name="command" value="BOOKAPPOINTMENT" />
  <div class="container">
    <h1>Book Appointment</h1>

   <br> <label for="DoctorName"><b>Doctor name</b><br></label>
    
       <select name="doctorname" style="font-size: 15px; width: 400px;height:50px;background: #D3D3D3;">
       <option>select</option>
         <%  while(resultset.next()){ %>
         <option><%= resultset.getString(1)+":"+resultset.getString(2)%></option>
        <% } %>
        </select><br><br>

    
    <label for="appointment date"><b> Choose Date</b><br></label>
    <input type="date" style="font-size: 15px; width: 370px;background: #D3D3D3;height:30px" placeholder="appointment date" name="appointmemt date" required><br>
    
    <br><label for="location"><b>Location</b><br></label>
     <select name="location" style="font-size: 15px; width: 400px;background: #D3D3D3;height:50px">
         <option>select</option>
         <option>BALLANTYNE</option>
         <option>BALLANMORE</option>
          <option>PINEVILLE</option>
          <option>NASHVILLE</option>
        </select><br><br>
        
        <br><label for="Timeslot"><b>choose Time</b><br></label>
     <select name="Timeslot" style="font-size: 15px; width: 400px;background: #D3D3D3;height:50px">

         <option>select</option>
         <option>9:00AM</option>
         <option>11:30AM</option>
         <option>2:30PM</option>
         <option>5:00PM</option>
         <option>7:00PM</option>
        </select><br><br>
    
     <label for="description"><b>Description</b><br></label>
    <input type="text" placeholder="description" name="description" required><br>
    
    <label for="Mobile"><b>Mobile</b><br></label>
    <input type="text" placeholder="Mobile" name="mobilenumber" required><br>
    
    <label for="Email"><b>Email</b><br></label>
    <input type="email" placeholder="Email ID" name="email" required><br>
    
<!--  <br><br> -->
    <button type="submit" value="submit" class="registerbtn">Register</button>
  </div>
  
</form>
</section>

<%@include  file="footer.jsp" %>
</body>
</html>