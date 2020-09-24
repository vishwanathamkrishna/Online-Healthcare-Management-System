<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	response.sendRedirect("login.jsp");
}

%>
<%@include  file="header.jsp" %>

<%@include  file="navigation.jsp" %>
<section class="img">

<form action="Hospitalmanagement" method="GET">
<input type="hidden" name="command" value="ADDDoctor" />
  <div class="container">
    <h1>Doctor Details</h1>
    <p>Please fill in this form to create an account.</p>


   <br> <label for="First Name"><b>First name</b><br></label>
    <input type="text" placeholder="First name" name="firstname" style="background: #A8A8A8;" required><br>
    
     <br> <label for="Last name"><b>Last name</b><br></label>
    <input type="text" placeholder="Last name" name="Last name"  style="background: #A8A8A8;" required><br>

    <label for="Gender"><b>Gender</b><br></label>
    <input type="text" placeholder="Gender" name="gender" minlength="1" maxlength="6"  style="background: #A8A8A8;"><br>
    
    <label for="Date of birth"><b>Date of birth</b><br></label>
    <input type="date" placeholder="Date of birth" name="date of birth"   style="background: #A8A8A8;" required><br><br>
    
    <label for="Mobile"><b>Mobile</b><br></label>
    <input type="text" placeholder="Mobile" name="mobilenumber"  style="background: #A8A8A8;" required><br>
    
    <label for="Email"><b>Email</b><br></label>
    <input type="email" placeholder="Email ID" name="email"   style="background: #A8A8A8;" required><br>
    
    <label for="password"><b>Password</b><br></label>
    <input type="password" placeholder="Password" name="password"   style="background: #A8A8A8;" required><br>
    
    <label for="Qualification"><b>Qualification</b><br></label>
    <input type="text" placeholder="Education" name="Qualification"  style="background: #A8A8A8;" required><br>
    
    <label for="speciality"><b>Specialization</b><br></label>
    <input type="text" placeholder="speciality" name="speciality"  style="background: #A8A8A8;" required><br>
    
     <label for="Experience"><b>Experience</b><br></label>
    <input type="text" placeholder="Experience" name="Experience"  style="background: #A8A8A8;" required><br>
    
    <button type="submit" value="submit"  style="background: rgb(61,55,103);" class="registerbtn">Register</button>
  </div>
  
</form>
</section>

<%@include  file="footer.jsp" %>
</body>
</html>