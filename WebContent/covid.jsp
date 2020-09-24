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
.table1, th, td {
  border: 3px solid rgb(61,55,103);
  padding: 1px;
  color:black;
  text-align: center;
  margin-top: 2%;
  margin-left: 35%;
  margin-right: 37%;
  margin-bottom: 1%;
}
input[type=text] {
  width: 30%;
  box-sizing: border-box;
  padding: 15px;
  margin: 5px 0 22px 0;
  background: #FFFFFF;
  border: 2px solid black ;

}
</style>
<body>

<%@include  file="header.jsp" %>

<%@include  file="navigation.jsp" %>
<section style="background-image: url('blue.png');background-repeat: no-repeat; background-size:100% 100%; ">
<br><marquee><b>Emergency Contact : (+1)(987)-(654)-3210</b></marquee>

<form action="Hospitalmanagement" method="GET">
<input type="hidden" name="command" value="COVID" />
  <div class="table1">
  
  <table >
  <tr>
  <td >
    <h1>Covid self assement</h1>
</td>
</tr>
<tr>
<td>
    <br><label for="Name"><b>Complete Name</b></label><br><br>
    <input type="text" value="name" name="name" size="50" required>
</td>
</tr>
<tr>
<td>
   <br> <label for="Gender"><b>Gender</b><br><br></label>
    <select name="marital">
    <option>Female</option>
    <option>Male</option>
    </select>
<br><br>
</td>
</tr>

<tr>
<td> 
   <br> <label for="Age"><b>Age</b><br><br></label>
    <input type="text" placeholder="Age" name="Age"style= height:8px required><br><br>
    </td>
</tr>
<tr>
<td >
   <br><label for="Gender"><b>Current Body Temperature</b><br><br></label>
    <select name="body temperature">
    <option>Normal</option>
    <option>High temperature</option>
    <option>H</option>
    </select>
    <br><br>
  </td>
</tr> 
<tr>
<td> 
   <br> <label for="symptoms"><b>Are you experiencing an symptoms</b><br><br></label>
    <select name="symptoms">
    <option>Dry cough</option>
    <option>Fever</option>
    <option>shortness of breathe</option>
    <option>cold</option>
    <option>sore throat</option>
     <option>None of these</option>
    </select>
    <br><br>
  </td>
  </tr>
  <tr>
<td>  
   <br> <label for="smoking"><b>Smoking History</b><br><br></label>
    <select name="smoking">
    <option>yes</option>
    <option>No</option>
    <option>occasionally</option>
    </select>
    <br><br>
  </td>
  </tr>
  <tr>
<td>  
    <br> <label for="travel"><b>Any travel exposure</b><br><br></label>
    <select name="travel">
    <option></option>
    <option>No travel History</option>
    <option>History of travel in a affected geographical area</option>
    <option>No contact with affected people</option>
    <option>close contact with affected people</option>
    </select>
    <br><br>
 </td>
 </tr>
 <tr>
<td>   
    <br><label>Choose any history of these condition</label><br>
   <br> <input type="checkbox"  name="Diabetes" value="Diabetes">
    <label for="coding">Diabetes</label><br>
    <input type="checkbox" name="bp" value="High blood pressure">
    <label for="music">High blood pressure</label><br>
    <input type="checkbox" name="Respiratory illness" value="Respiratory illness">
    <label for="music">Respiratory illness</label><br>
    <input type="checkbox" name="Heart Diseases" value="Heart Diseases">
    <label for="music">Heart Diseases</label><br>
     <input type="checkbox" name="none of these" value="Heart Diseases">
    <label for="music">None of these</label><br>
     <br></br>
     </td>
     </tr>
     <tr>
<td>
   <br> <button type="submit" value="submit" class="registerbtn">Register</button>
    </td>
    </tr>
  </table>
  </div>
  
</form>
</section>

<%@include  file="footer.jsp" %>
</body>
</html>
</head>
<body>

