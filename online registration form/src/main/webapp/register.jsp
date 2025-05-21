<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Registration</title>
</head>
<body>
<h2>Registration Form</h2>
<form action="displayDetails.jsp" method="post">
First Name: <input type="text" name="firstName" required><br><br>
Last Name: <input type="text" name="lastName" required><br><br>
Email: <input type="email" name="email" required><br><br>
Password: <input type="password" name="password" required><br><br>
Gender: 
<select name="gender">
<option value="male">Male</option>
<option value="female">Female</option>
<option value="other">Other</option>
</select><br><br>  
Date of Birth: <input type="text" name="dob" placeholder="YYYY-MM-DD"><br><br>
Phone Number: <input type="text" name="phone"><br><br>
Interests:
<input type="checkbox" name="interests" value="Sports">Sports
<input type="checkbox" name="interests" value="Music">Music
<input type="checkbox" name="interests" value="Reading">Reading<br><br>
<input type="submit" value="Register">
</form>
</body>
</html>