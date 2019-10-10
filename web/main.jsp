<%--
  Created by IntelliJ IDEA.
  User: vaide
  Date: 10/9/2019
  Time: 10:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "murach";
    String userid = "root";
    String password = "Tookie@123";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>

<h1>Retrieve data from database in jsp</h1>
<table border="1">
    <tr>
        <td>ID</td>
        <td>first name</td>
        <td>last name</td>
        <td>Email</td>

    </tr>
    <%
        try{
            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
            statement=connection.createStatement();
            String sql ="select * from user";
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
    %>
    <tr>
        <td><%=resultSet.getString("UserID") %></td>
        <td><%=resultSet.getString("FirstName") %></td>
        <td><%=resultSet.getString("LastName") %></td>
        <td><%=resultSet.getString("Email") %></td>
    </tr>
    <%
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>
