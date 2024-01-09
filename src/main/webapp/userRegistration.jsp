<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    String dbUrl = "jdbc:mysql://" + System.getenv("DBENDPOINT") + ":3306/jwt";
    Connection con = DriverManager.getConnection(dbUrl, System.getenv("DBUSER"), System.getenv("DBPASS"));
    PreparedStatement ps = con.prepareStatement("insert into USER(first_name, last_name, email, username, password, regdate) values (?, ?, ?, ?, ?, CURDATE())");
    ps.setString(1, firstName);
    ps.setString(2, lastName);
    ps.setString(3, email);
    ps.setString(4, userName);
    ps.setString(5, password);
    int i = ps.executeUpdate();
    if (i > 0) {
        response.sendRedirect("welcome.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }
%>
