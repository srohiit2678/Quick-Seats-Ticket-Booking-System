<%-- 
    Document   : showbus
    Created on : 30-Mar-2024, 10:02:18 pm
    Author     : DEVANSH GOYAL
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bookings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            background-image: url('Images/Bg.png');
            margin: 0;
            padding: 0;
        }
        
        .navbar {
            background-color: #444;
            overflow: hidden;
        }
        
        .navbar a {
            float: right;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        
        th {
            background-color: #f2f2f2;
            
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        .error-message {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
            padding: 10px;
            margin-top: 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="Logout">Log Out</a>
        <a href="showbus.jsp">Schedule</a>
        <a href="addbus.jsp">Add Bus</a>
        <a href="agencieshome.jsp">Home</a>
    </div>
    <% 
        String bid = request.getParameter("id");
        int id = Integer.parseInt(bid);
    
    %>
    <table>
        <tr>
            <th>S no.</th>
            <th>User name</th>
            <th>User Email</th>
            <th>Seats Booked</th>
            <th>Amount Paid</th>
            
        </tr>
        
        <% 
        int i = 0;
        String agency_email = (String)session.getAttribute("agency_email");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking","root","Dev_123goyal");
            Statement smt = cn.createStatement();
            ResultSet rs = smt.executeQuery("select * from Book where id="+id);
        
            while (rs.next()) {
                
        %>
            <tr>
                <td><%= ++i %></td>
                <td><%= rs.getString("user_name") %></td>
                <td><%= rs.getString("user_email") %></td>
                <td><%= rs.getString("seats") %></td>
                <td><%= rs.getString("amt") %></td>
             </tr>
            <% }
            rs.close();
            cn.close();
        } catch(Exception e) { %>
        <tr>
            <td colspan="11">
                <div class="error-message">
                    <p>Something went wrong! Please try again.</p>
                </div>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
