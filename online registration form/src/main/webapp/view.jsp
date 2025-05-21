<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIEW</title>
</head>
<body>
<h2> VIEW </h2>
<table border="1">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Gender</th>
            <th>DOB</th>
            <th>Phone</th>
            <th>Interests</th>
        </tr>
        <%
        String filePath = application.getRealPath("/") + "registrations.txt";
        BufferedReader reader = null;
        
        try {
            reader = new BufferedReader(new FileReader(filePath));
            String line;
            HashMap<String, String> record = new HashMap<>();
            
            while ((line = reader.readLine()) != null) {
                if (line.startsWith("First Name:")) {
                    record.put("First Name", line.substring("First Name:".length()).trim());
                } else if (line.startsWith("Last Name:")) {
                    record.put("Last Name", line.substring("Last Name:".length()).trim());
                } else if (line.startsWith("Email:")) {
                    record.put("Email", line.substring("Email:".length()).trim());
                } else if (line.startsWith("Gender:")) {
                    record.put("Gender", line.substring("Gender:".length()).trim());
                } else if (line.startsWith("Date of Birth:")) {
                    record.put("DOB", line.substring("Date of Birth:".length()).trim());
                } else if (line.startsWith("Phone:")) {
                    record.put("Phone", line.substring("Phone:".length()).trim());
                } else if (line.startsWith("Interests:")) {
                    record.put("Interests", line.substring("Interests:".length()).trim());
                } else if (line.equals("----------------------------------")) {
                    if (!record.isEmpty()) {
        %>
                        <tr>
                            <td><%= record.get("First Name") %></td>
                            <td><%= record.get("Last Name") %></td>
                            <td><%= record.get("Email") %></td>
                            <td><%= record.get("Gender") %></td>
                            <td><%= record.get("DOB") %></td>
                            <td><%= record.get("Phone") %></td>
                            <td><%= record.get("Interests") %></td>
                        </tr>
        <%
                        record.clear();
                    }
                }
            }
        } catch (FileNotFoundException e) {
            out.println("<tr><td colspan='7'>No registrations found</td></tr>");
        } catch (IOException e) {
            out.println("<tr><td colspan='7'>Error reading registrations</td></tr>");
        } finally {
            if (reader != null) {
                try { reader.close(); } catch (IOException e) {}
            }
        }
        %>
    </table>
    <br>
    <a href="register.jsp">Back to Registration Form</a>
</body>
</html>