<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    String dbUrl = "jdbc:mysql://" + System.getenv("DBENDPOINT") + ":3306/jwt";
    Connection con = DriverManager.getConnection(dbUrl,System.getenv("DBUSER"), System.getenv("DBPASS"));
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from USER where userName='" +userName + "' and password='" +password + "'");
    if (rs.next()) {
        session.setAttribute("userName", userName);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
