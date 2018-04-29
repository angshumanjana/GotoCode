<%@ include file="Common.jsp" %><%!
//
//   Filename: Header.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "Header.jsp";
              
static final String PageBODY = "bgcolor=\"#ffffff\"";
static final String FormTABLE = "bgcolor=\"#FFFFFF\" border=\"0\"";
static final String FormHeaderTD = "bgcolor=\"#cccccc\" align=\"center\"";
static final String FormHeaderFONT = "face=\"arial\" style=\"font:bold\"";
static final String FieldCaptionTD = "bgcolor=\"#336699\"";
static final String FieldCaptionFONT = "face=\"arial\" size=\"2\" color=\"#FFFFFF\"";
static final String DataTD = "bgcolor=\"#eeeecc\"";
static final String DataFONT = "face=\"arial\" size=\"2\"";
static final String ColumnFONT = "face=\"arial\" size=\"2\" color=\"#FFFFFF\"";
static final String ColumnTD = "bgcolor=\"#336699\"";
%><%
boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sHeaderErr = "";

java.sql.Connection conn = null;
java.sql.Statement stat = null;
conn = cn();
stat = conn.createStatement();
%><img src="images/logo.gif">
<hr color="#000000" size="1">
 <table>
  <tr>
   <td valign="top">
<% Header_Show(request, response, session, out, sHeaderErr, sForm, sAction, conn, stat); %>   
   </td>
  </tr>
 </table>

<%!

  void Header_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sHeaderErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
    try {
  
      out.println("    <table bgcolor=\"#FFFFFF\" border=\"0\">");
      
      out.print("     <tr>");
      // Set URLs
      
      // Show fields
      

      out.println("\n     </tr>\n    </table>");
  
    }
    catch (Exception e) { out.println(e.toString()); }
  }
%>