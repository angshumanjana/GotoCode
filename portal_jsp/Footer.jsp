<%@ include file="Common.jsp" %><%!
//
//   Filename: Footer.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "Footer.jsp";
              
%><%
boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sFooterErr = "";

java.sql.Connection conn = null;
java.sql.Statement stat = null;
conn = cn();
stat = conn.createStatement();
%><hr width=60%>
<center>
 <table>
  <tr>
   <td valign="top">
<% Footer_Show(request, response, session, out, sFooterErr, sForm, sAction, conn, stat); %>    </td>
   
  </tr>
 </table>
 </center>
<%!

  void Footer_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sFooterErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
    try {
  
      out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
      
      out.print("     <tr>");
      // Set URLs
      
      String fldField3 = "Default.jsp";
      String fldField2 = "Events.jsp";
      String fldField1 = "Links.jsp";
      String fldField4 = "Officers.jsp";
      String fldField6 = "Members.jsp";
      String fldField5 = "AdminMenu.jsp";
      // Show fields
      
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField3+"\"><font style=\"font-size: 10pt; color: #000000\">Home</font></a></td>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField2+"\"><font style=\"font-size: 10pt; color: #000000\">Events</font></a></td>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField1+"\"><font style=\"font-size: 10pt; color: #000000\">Links</font></a></td>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField4+"\"><font style=\"font-size: 10pt; color: #000000\">Club Officers</font></a></td>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField6+"\"><font style=\"font-size: 10pt; color: #000000\">Members</font></a></td>");
      out.print("\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><a href=\""+fldField5+"\"><font style=\"font-size: 10pt; color: #000000\">Administration</font></a></td>");

      out.println("\n     </tr>\n    </table>");
  
    }
    catch (Exception e) { out.println(e.toString()); }
  }
%>