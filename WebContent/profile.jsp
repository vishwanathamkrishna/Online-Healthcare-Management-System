
    <%@ page import="java.util.*" %>
      <%@ page import="com.luv2code.servletdemo.Patientdetails" %>
      <%@ page import="com.luv2code.servletdemo.*" %>
      <%@ page import="com.luv2code.servletdemo.Hospitalmanagement" %>
       <%@ page import="java.util.*,com.luv2code.servletdemo.*" %>
       <%@ page import="java.sql.*" %>
     
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>student tracker app</title>
<link rel="stylesheet" type="text/css" href="homestyle.css">
</head>
<style>
th{
padding: 5px;
}
section{
background-size: 100% 500px; 
text-align: center;
 
}

.img{
background-color: #E0EEEE;
}
</style>

   
<body>

<%@include  file="header.jsp" %>

<%@include  file="navigation.jsp" %>


<section class="img">

<h2><b>PATIENT RECORDS</b></h2>

<table border="2px">
		

<tr>
<th>Patient Name</th>
<th>Gender</th>
<th>DOB</th>
<th>Age</th>
<th>Mobile</th>
<th>Appointment_id</th>
<th>Doctor First Name</th>
<th>Doctor Last Name</th>
<th>Speciality</th>
<th>Appointment Date</th>
<th>Location</th>
<th>Time-slot</th>
<th>Description</th>
</tr>

<% String name = (String)request.getAttribute("mailid"); %>

<%
String sql;
ResultSet resultset =null;
PreparedStatement myStmt = null;
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hospitalmanagement","root","spandana14"); 
     
       
  
       sql = "select pd.*,ba.* from  patientdetails pd left join bookappointment ba using(Email)";
      
       

   
       myStmt = con.prepareStatement(sql);
      	
	
	//System.out.println(myStmt.executeQuery());
	// execute query
	resultset = myStmt.executeQuery();


 while(resultset.next()) {%>
              <tr>
              <td><%=resultset.getString("patientName")%></td>
				<td><%=resultset.getString("Gender")%></td>
				<td><%=resultset.getString("DOB")%></td> 
                  <td><%=resultset.getString("Age")%></td>
                  <td><%=resultset.getString("Mobile")%></td>
    
                  <td><%=resultset.getString("Appointment_id")%></td>
                  <td><%=resultset.getString("Doctor_First_Name")%></td>
                  <td><%=resultset.getString("Doctor_Last_Name")%></td>
                  <td><%=resultset.getString("Speciality")%></td>
                  <td><%=resultset.getString("Appointment_Date")%></td>
                  <td><%=resultset.getString("Location")%></td>
                  <td><%=resultset.getString("Timeslot")%></td>
                  <td><%=resultset.getString("Description")%></td>
                  </tr>
						
			<% }%>
			
</table>

</section>

<%@include  file="footer.jsp" %>
</body>
</html>