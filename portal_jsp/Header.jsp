<%@ include file="Common.jsp" %><%!
//
//   Filename: Header.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "Header.jsp";
              
%><%
boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sHeaderErr = "";

java.sql.Connection conn = null;
java.sql.Statement stat = null;
conn = cn();
stat = conn.createStatement();
%><table>
<tr>
<td><img src="images/logo.gif"></td>
<td align="center" width="100%"><b><font face="Arial">Welcome to Portal example generated using CodeCharge<br><font size="4"> SVEC - Silicon Valley Engineers Club</font></font></b>
 <table>
  <tr>
   <td valign="top">
<% Header_Show(request, response, session, out, sHeaderErr, sForm, sAction, conn, stat); %>   
   </td>
  </tr>
 </table>
</td>
</tr>
</table>
<hr size=1 color="#000000">
<%!

  void Header_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sHeaderErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
    try {
  
      out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
      
      out.print("     <tr>");
      // Set URLs
      
      String fldField3 = "Default.jsp";
      String fldField6 = "Registration.jsp";
      String fldField1 = "Events.jsp";
      String fldField4 = "Links.jsp";
      String fldField5 = "Officers.jsp";
      String fldField8 = "Members.jsp";
      String fldField7 = "Account.jsp";
      String fldField9 = "Login.jsp";
      String fldField2 = "AdminMenu.jsp";
      // Show fields
      
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField3+"\"><font style=\"font-size: 10pt; color: #000000\"><center><img border=\"0\" src=\"images/home.gif\"><br><font size=\"1\">Home</font></center></font></a></td>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField6+"\"><font style=\"font-size: 10pt; color: #000000\"><center><img border=\"0\" src=\"images/reg.gif\"><br><font size=\"1\">Registration</font></center></font></a></td>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField1+"\"><font style=\"font-size: 10pt; color: #000000\"><center><img border=\"0\" src=\"images/events.gif\"><br><font size=\"1\">Events</font></center></font></a></td>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField4+"\"><font style=\"font-size: 10pt; color: #000000\"><center><img border=\"0\" src=\"images/links.gif\"><br><font size=\"1\">Links</font></center></font></a></td>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField5+"\"><font style=\"font-size: 10pt; color: #000000\"><center><img border=\"0\" src=\"images/club.gif\"><br><font size=\"1\">Club Officers</font></center></font></a></td>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField8+"\"><font style=\"font-size: 10pt; color: #000000\"><center><img border=\"0\" src=\"images/members.gif\"><br><font size=\"1\">Members</font></center></font></a></td>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField7+"\"><font style=\"font-size: 10pt; color: #000000\"><center><img border=\"0\" src=\"images/account.gif\"><br><font size=\"1\">Account</font></center></font></a></td>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField9+"\"><font style=\"font-size: 10pt; color: #000000\"><center><img border=\"0\" src=\"images/sign.gif\"><br><font size=\"1\">Sign In</font></center></font></a></td>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField2+"\"><font style=\"font-size: 10pt; color: #000000\"><center><img border=\"0\" src=\"images/admin.gif\"><br><font size=\"1\">Administration</font></center></font></a></td>");

      out.println("\n     </tr>\n    </table>");
  
    }
    catch (Exception e) { out.println(e.toString()); }
  }
%>