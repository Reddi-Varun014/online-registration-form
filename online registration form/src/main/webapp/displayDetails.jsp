<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Details</title>
</head>
<body>
    <h2>Registration Details</h2>
    
    <%
    // Save data to file
    String filePath = application.getRealPath("/") + "registrations.txt";
    try (PrintWriter writer = new PrintWriter(new FileWriter(filePath, true))) {
        writer.println("New Registration:");
        writer.println("First Name: " + request.getParameter("firstName"));
        writer.println("Last Name: " + request.getParameter("lastName"));
        writer.println("Email: " + request.getParameter("email"));
        writer.println("Gender: " + request.getParameter("gender"));
        writer.println("Date of Birth: " + request.getParameter("dob"));
        writer.println("Phone: " + request.getParameter("phone"));
        
        String[] interests = request.getParameterValues("interests");
        writer.print("Interests: ");
        if (interests != null) {
            for (String interest : interests) {
                writer.print(interest + " ");
            }
        }
        writer.println("\n----------------------------------");
    } catch (IOException e) {
        e.printStackTrace();
    }
    %>
    
    <table border="1">
        <tr>
            <th>Field</th>
            <th>Value</th>
        </tr>
        <tr>
            <td>First Name</td>
            <td><%= request.getParameter("firstName") %></td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><%= request.getParameter("lastName") %></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><%= request.getParameter("email") %></td>
        </tr>
        <tr>
            <td>Password</td>
            <td>*****</td>
        </tr>
        <tr>
            <td>Gender</td>
            <td><%= request.getParameter("gender") %></td>
        </tr>
        <tr>
            <td>Date of Birth</td>
            <td><%= request.getParameter("dob") %></td>
        </tr>
        <tr>
            <td>Phone Number</td>
            <td><%= request.getParameter("phone") %></td>
        </tr>
        <tr>
            <td>Interests</td>
            <td>
                <%
                    String[] interests = request.getParameterValues("interests");
                    if (interests != null) {
                        for (String interest : interests) {
                            out.print(interest + " ");
                        }
                    } else {
                        out.print("None selected");
                    }
                %>
            </td>
        </tr>
    </table>
    
    <br>
    <p>
        <a href="register.jsp">Back to Registration Form</a> | 
        <a href="view.jsp">View All Registrations</a>
    </p>
</body>
</html>