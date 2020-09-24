
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
<style>
td{
padding: 10px;
}
</style>
</head>


   
<body>

<%@include  file="header.jsp" %>

<%@include  file="navigation.jsp" %>


<section>



<% String name = (String)request.getAttribute("mailid"); %>

<%
String sql;
ResultSet resultset =null;
PreparedStatement myStmt = null;
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hospitalmanagement","root","spandana14"); 
     
       
  
       sql = "select pd.*,ba.* from  patientdetails pd left join bookappointment ba using(Email) where Email=?";
      
       

   
       myStmt = con.prepareStatement(sql);
      	myStmt.setString(1, name);
	
	//System.out.println(myStmt.executeQuery());
	// execute query
	resultset = myStmt.executeQuery();


 while(resultset.next()) {%>
              
            <table border="2px" align="center">
 <tr>
 <td>
 <B>PATIENT DETAILS OF Mr/Mrs : <%=resultset.getString("patientName")%></B>
 </td>
 </tr>
 </table>
 
 <br>
 <table border="2px" align="center">
 <tr>
 <td>
 <B>Patient Name</B>
 </td>
 <td>
 <%=resultset.getString("patientName")%>
 </td>
 <td>
 <B>Doctor First Name</B>
 </td>
 <td>
 <%=resultset.getString("Doctor_First_Name")%>
 </td>
 </tr>
 
  <tr>
 <td>
 <B>Gender</B>
 </td>
 <td>
 <%=resultset.getString("Gender")%>
 </td>
 <td>
 <B>Doctor Last Name</B>
 </td>
 <td>
 <%=resultset.getString("Doctor_Last_Name")%>
 </td>
 </tr>
 
  <tr>
 <td>
 <B>DOB</B>
 </td>
 <td><%=resultset.getString("DOB")%></td>
 <td>
 <B>Speciality</B>
 </td>
 <td>
 <%=resultset.getString("Speciality")%>
 </td>
 </tr>
 
  <tr>
 <td>
 <B>Mobile</B>
 </td>
 <td>
 <%=resultset.getString("Mobile")%>
 </td>
 <td>
 <B>Location</B>
 </td>
 <td>
 <%=resultset.getString("Location")%>
 </td>
 </tr>
 
  <tr>
 <td>
 <B>Appoinment Id</B>
 </td>
 <td>
 <%=resultset.getString("Appointment_id")%>
 </td>
 <td>
 <B>Time-Slot</B>
 </td>
 <td>
 <%=resultset.getString("Timeslot")%>
 </td>
 </tr>
 </table>
 <br>
 
  <table border="2px" align="center">
 <tr>
 <td>
 <B>Description</B>
 </td>
 <td>
 <%=resultset.getString("Description")%>
 </td>
 </tr>
 </table>
						
			<% }%>
			
</table>

</section>
<%@include  file="footer.jsp" %>
</body>
</html>

