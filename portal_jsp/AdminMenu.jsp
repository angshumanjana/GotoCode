<%@ include file="Common.jsp" %><%!
//
//   Filename: AdminMenu.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "AdminMenu.jsp";
              
%><%

String cSec = checkSecurity(2, session, response, request);
if ("sendRedirect".equals(cSec) ) return;
                
boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sAdminMenuErr = "";

java.sql.Connection conn = null;
java.sql.Statement stat = null;
String sErr = loadDriver();
conn = cn();
stat = conn.createStatement();
if ( ! sErr.equals("") ) {
 try {
   out.println(sErr);
 }
 catch (Exception e) {}
}

%>            
<html>
<head>
<title>SVEC - Administration Menu</title>
<meta name="GENERATOR" content="YesSoftware CodeCharge v.1.2.0 / JSP.ccp build 05/21/01"/>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body style="background-color: #FFFFFF; color: #000000; font-family: Arial, Tahoma, Verdana, Helveticabackground-color: #FFFFFF; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">
<jsp:include page="Header.jsp" flush="true"/>
 <table>
  <tr>
   
   <td valign="top">
<% AdminMenu_Show(request, response, session, out, sAdminMenuErr, sForm, sAction, conn, stat); %>
    
   </td>
  </tr>
 </table>

<jsp:include page="Footer.jsp" flush="true"/>
<center><font face="Arial"><small>This dynamic site was generated with <a href="http://www.codecharge.com">CodeCharge</a></small></font></center>
</body>
</html>
<%%>
<%
if ( stat != null ) stat.close();
if ( conn != null ) conn.close();
%>
<%!

  void AdminMenu_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAdminMenuErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
    try {
  
      out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
      out.println("     <tr>\n      <td  style=\"background-color: #990000; text-align: Center; border-style: outset; border-width: 1\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">SVEC - Administration Menu</font></td>\n     </tr>");
      out.print("     <tr>");
      // Set URLs
      
      String fldField2 = "AdminArticles.jsp";
      String fldField1 = "AdminEvents.jsp";
      String fldField3 = "AdminOfficers.jsp";
      String fldField4 = "AdminLinks.jsp";
      String fldField5 = "AdminMembers.jsp";
      String fldField6 = "AdminNews.jsp";
      // Show fields
      
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField2+"\"><font style=\"font-size: 10pt; color: #000000\">Articles (Main Content)</font></a></td>\n\n      </tr>\n\n      <tr>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField1+"\"><font style=\"font-size: 10pt; color: #000000\">Events</font></a></td>\n\n      </tr>\n\n      <tr>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField3+"\"><font style=\"font-size: 10pt; color: #000000\">Club Officers</font></a></td>\n\n      </tr>\n\n      <tr>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField4+"\"><font style=\"font-size: 10pt; color: #000000\">Links</font></a></td>\n\n      </tr>\n\n      <tr>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField5+"\"><font style=\"font-size: 10pt; color: #000000\">Members</font></a></td>\n\n      </tr>\n\n      <tr>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField6+"\"><font style=\"font-size: 10pt; color: #000000\">News</font></a></td>");

      out.println("\n     </tr>\n    </table>");
  
    }
    catch (Exception e) { out.println(e.toString()); }
  }
%>