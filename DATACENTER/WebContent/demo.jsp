<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/JavaScript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FORM FOR MOVIE</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%! String ans1,ans2,ans3,ans4,ans5; 
int marks=0;


public boolean compareResultSets(ResultSet resultSet1, ResultSet resultSet2) throws SQLException{
    while (resultSet1.next()) {
        resultSet2.next();
        ResultSetMetaData resultSetMetaData = resultSet1.getMetaData();
        int count = resultSetMetaData.getColumnCount();
        for (int i = 1; i <= count; i++) {
            if (!resultSet1.getObject(i).equals(resultSet2.getObject(i))) {
                return false;
            }
        }
    }
    return true;
}

%>
<%
String url = "jdbc:mysql://localhost:3306/"; 
String dbName = "movie"; 
String driver = "com.mysql.jdbc.Driver"; 
String user = "root";  
String password = ""; 
try {
  Class.forName(driver).newInstance(); 
  Connection con = null;
  con=DriverManager.getConnection(url+dbName, user, password);
  Statement st1= con.createStatement();
  Statement st2= con.createStatement();
  Statement st3= con.createStatement();
  Statement st4= con.createStatement();
  Statement st5= con.createStatement();
  Statement st6= con.createStatement();
  Statement st7= con.createStatement();
  Statement st8= con.createStatement();
  Statement st9= con.createStatement();
  Statement st10= con.createStatement();
  ResultSet rs1,rs2,rs3,rs4,rs5,sol1,sol2,sol3,sol4,sol5; 
  ans1=request.getParameter("answer1");
  ans2=request.getParameter("answer2");
  ans3=request.getParameter("answer3");
  ans4=request.getParameter("answer4");
  ans5=request.getParameter("answer5");
  System.out.println("Done reading");
  if(ans1.equals("")||ans2.equals("")||ans3.equals("")||ans4.equals("")||ans5.equals("")){System.out.println("null query"); %>
  <script language="javascript">alert("SQL ERROR :query cannot be null"); window.location.href="front1.html";</script> <% }
  //out.println("1st ans "+ans1+"\n");
  //out.println("2nd ans " +ans2+"\n");
  //out.println("3rd ans "+ans3+"\n");
  rs1=st1.executeQuery("SELECT movieID,title,year,director FROM movieT WHERE director= 'GIANCARLO'");
  //out.println("checked one_");
  rs2=st2.executeQuery("SELECT ratingDate FROM rating WHERE stars>3 ORDER BY stars");
  //out.println("checked two_");
  rs3=st3.executeQuery("SELECT title FROM movieT M,rating R WHERE R.movieId=M.movieID AND R.stars=2");
  rs4=st4.executeQuery("SELECT reviewID FROM rating WHERE ratingDate like '%2019%'");
  rs5=st5.executeQuery("SELECT reviewId,title FROM movieT as M, rating as R WHERE M.movieID = R.movieId ORDER BY title ASC");
  System.out.println("done executiong correct queries");
  //out.println("checked three_");
  //String f1,f2;      
  /*String query="insert into emp values(?,?,?)";
  PreparedStatement pstmt=con.prepareStatement(query);
  pstmt.setString(1,name);
  pstmt.setString(2,email);
  pstmt.setString(3,company);
  pstmt.execute();*/
  //out.println("starting executing");
  System.out.println("starting executing");
  sol1=st6.executeQuery(ans1); 
  System.out.println("starting executing 1");
  sol2=st7.executeQuery(ans2);
  System.out.println("starting executing 2");
  sol3=st8.executeQuery(ans3);
  System.out.println("starting executing 3");
  sol4=st9.executeQuery(ans4);
  System.out.println("starting executing 4");
  sol5=st10.executeQuery(ans5);
  System.out.println("done executing new queries");
  //out.println("done executing");
  if(compareResultSets(rs1,sol1)){marks=marks+2;}
  //out.println("checked one");
  if(compareResultSets(rs2,sol2)){marks=marks+2;}
  //out.println("checked two");
  if(compareResultSets(rs3,sol3)){marks=marks+2;}
  //out.println("check three , calling message");
  if(compareResultSets(rs4,sol4)){marks=marks+2;}
  if(compareResultSets(rs5,sol5)){marks=marks+2;}
  System.out.println("Done comparing");
  //out.println("<br><br>marks=<br><br>"+marks);
  %> <script language="javascript"> 
  var s=<%=marks%>;alert("YOUR MARKS ARE = "+s); window.location.href ="_front.html";</script><%
  /*out.println("<TABLE CELLSPACING=\"0\" CELLPADDING=\"3\" BORDER=\"1\">");
  out.println("<TR><TH>movieID</TH><TH>title</TH><TH>year</TH><TH>director</TH></TR>");

  //Loop through results of query.
  while(rs.next())
  {
    out.println("<TR>");
    out.println("  <TD>" + rs.getString("movieID") + "</TD>");
    out.println("  <TD>" + rs.getString("title") + "</TD>");
    out.println("  <TD>" + rs.getString("year") + "</TD>");
    out.println("  <TD>" + rs.getString("director") + "</TD>");
    out.println("</TR>");
  }
out.println("</TABLE>");*/
marks=0;
rs1.close();rs2.close();rs3.close();rs4.close();rs5.close();sol1.close();sol2.close();sol3.close();sol4.close();sol5.close();
st1.close();st2.close();st3.close();st4.close(); st5.close();st6.close();st7.close();st8.close();st9.close();st10.close();
con.close();
 }
  catch(SQLException e) {
	  String txt = e.getMessage();
	  //e.printStackTrace();
  //out.println("SQLException: " + e.getMessage() + "<BR>");
  while((e = e.getNextException()) != null)
  {e.printStackTrace();
     %> <script language="javascript"> var s=<%=txt%>;alert("SQL ERROR : " +txt); window.location.href="front.html";</script> <%}
  }
catch(ClassNotFoundException e) {
	String txt = e.getMessage();
	//e.printStackTrace();
  //out.println("ClassNotFoundException: " + e.getMessage() + "<BR>");
  %> <script language="javascript"> var s=<%=txt%>;alert("SQL ERROR : " +txt); window.location.href="front.html";</script> <%
  }

 %>
</body>
</html>