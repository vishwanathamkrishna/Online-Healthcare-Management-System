<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Hospital Management System</title>
<link rel="stylesheet" type="text/css" href="homestyle.css">
<style>
td
{
padding: 0px;
}
</style>
</head>

<body>

<%@include  file="header.jsp" %>

<%@include  file="navigation.jsp" %>


<section style="background-image: url('image.jpeg');background-size: cover;">

<table align = "right">
<tr>
<td><B>Contact:</B></td>
</tr>
<tr>
<td>
Address: 8800 N Tryon St, Charlotte, NC 28262
</td>
</tr>
<tr>
<td>
Phone: (704) 345-3546
</td>
</tr>
<tr>
<td>
Hours: Open 24Hours
</td>
</tr>
<tr>
<td>
Email: silvercresthospital@gmail.com
</td>
</tr>
<tr>
<td>
<form>
<b>Feedback:</b><BR> 
<textarea name="comment" form="usrform">Give Your Feedback ...</textarea><br><br>
<input type = "submit" value="submit">
</form>
</td>
</tr>
</table>

</section>


<%@include  file="footer.jsp" %>


</body>
</html>
