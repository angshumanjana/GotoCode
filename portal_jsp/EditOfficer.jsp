<%@ include file="Common.jsp" %><%!
//
//   Filename: EditOfficer.jsp
//   Generated with CodeCharge  v.1.1.19
//   JSP.ccp build 04/20/2001
//

static final String sFileName = "EditOfficer.jsp";
              
%><%

boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sEditOfficerErr = "";

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
if ( sForm.equals("EditOfficer") ) {
  sEditOfficerErr = EditOfficerAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(sEditOfficerErr)) return;
}

%>            
<html>
<head>
<title>SVEC - Edit Officer</title>
<meta name="GENERATOR" content="YesSoftware CodeCharge v.1.1.19 / JSP.ccp build 04/20/2001"/>
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
<% EditOfficer_Show(request, response, session, out, sEditOfficerErr, sForm, sAction, conn, stat); %>
    <SCRIPT Language="JavaScript">
if (document.forms["EditOfficer"])
document.EditOfficer.onsubmit=delconf;
function delconf() {
if (document.EditOfficer.FormAction.value == 'delete')
  return confirm('Delete record?');
}
</SCRIPT>
   </td>
  </tr>
 </table>

<jsp:include page="Footer.jsp" flush="true"/>
<center><font face="Arial"><small>This dynamic site was generated with <a href="http://www.codecharge.com">CodeCharge</a></small></font></center>
</body>
</html>

<%
if ( stat != null ) stat.close();
if ( conn != null ) conn.close();
%>
<%!


  String EditOfficerAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String sEditOfficerErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "AdminOfficers.jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      String pPKofficer_id = "";

      final int iinsertAction = 1;
      final int iupdateAction = 2;
      final int ideleteAction = 3;
      int iAction = 0;

      if ( sAction.equalsIgnoreCase("insert") ) { iAction = iinsertAction; }
      if ( sAction.equalsIgnoreCase("update") ) { iAction = iupdateAction; }
      if ( sAction.equalsIgnoreCase("delete") ) { iAction = ideleteAction; }

    


      String fldofficer_depid="";
      String fldofficer_position="";
      String fldofficer_phno="";
      String fldofficer_id="";

      // Load all form fields into variables
      fldofficer_id = getParam(request, "officer_id");
      fldofficer_depid = getParam(request, "officer_depid");
      fldofficer_position = getParam(request, "officer_position");
      fldofficer_phno = getParam(request, "officer_phno");
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( isEmpty(fldofficer_id) ) {
          sEditOfficerErr = sEditOfficerErr + "The value in field ID is required.<br>";
        }
        if ( isEmpty(fldofficer_position) ) {
          sEditOfficerErr = sEditOfficerErr + "The value in field Position is required.<br>";
        }
        if (sEditOfficerErr.length() > 0 ) {
          return (sEditOfficerErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into officers (" + "officer_id" + ",officer_depid," + "officer_position," + "officer_phno)" + " values (" + fldofficer_id + "," + fldofficer_depid + "," + fldofficer_position + "," + fldofficer_email + ")";
          break;
  
      case iupdateAction:
        
          sSQL = "update officers set " + "officer_id=" + fldofficer_id + ",officer_depid=" + fldofficer_depid + ",officer_position=" + fldofficer_position + ",officer_phno=" + fldofficer_phno " where officer_id =" + sWhere;
        break;
      
      case ideleteAction:
           sSQL = "delete from officers where officer_id = " + sWhere;
          
        break;
  
      }

      if ( sEditOfficerErr.length() > 0 ) return sEditOfficerErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);

        stat.executeUpdate("delete from officers where officer_position <=1");
       
        stat.executeUpdate("update officers set officer_position = officer_position + 1 where officer_position >=1");

        java.sql.ResultSet rs = null;

        rs = openrs( stat, "SELECT officer_position From officers where officer_position >=1");




         File file = new File("/users/mkyong/filename.txt");

			// if file doesnt exists, then create it
			if (!file.exists()) {
				file.createNewFile();
			}

			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			



       while (rs.next()){
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        
        fldofficer_position = (String) rsHash.get("officer_position");
        bw.write(fldofficer_position);  
       
       }
       rs.close();

       }
      catch(java.sql.SQLException e) {
        sEditOfficerErr = e.toString(); return (sEditOfficerErr);
      }
  
      try {
        if ( stat != null ) stat.close();
        if ( conn != null ) conn.close();
      }
      catch ( java.sql.SQLException ignore ) {}
      response.sendRedirect (sActionFileName);

      return "sendRedirect";
    }
    catch (Exception e) {out.println(e.toString()); }
    return (sEditOfficerErr);
  }

  


  void EditOfficer_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sEditOfficerErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
    try {

      String sSQL="";
      String sQueryString = "";
      String sPage = "";
      String sWhere = "";
      String transitParams = "";
      String transitParamsHidden = "";
      String requiredParams = "";
      String primaryKeyParams ="";
      java.util.Hashtable rsHash = new java.util.Hashtable();
      
      String pofficer_id = "";

      String fldofficer_id="";
      String fldofficer_depid="";
      String fldofficer_position="";
      String fldofficer_phno="";


      boolean bPK = true;

      if ( "".equals(sEditOfficerErr)) {
        // Load primary key and form parameters
        fldofficer_id = getParam( request, "officer_id");
        pofficer_id = getParam( request, "officer_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldofficer_id = getParam( request, "officer_id");
        fldofficer_depid = getParam( request, "officer_depid");
        fldofficer_position = getParam( request, "officer_position");
        fldofficer_phno = getParam( request, "officer_phno");
        pofficer_id = getParam( request, "PK_officer_id");
      }

      
      if ( isEmpty(pofficer_id)) { bPK = false; }
      
      sWhere = pofficer_id ;
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_officer_id\" value=\""+pofficer_id+"\"/>";

      sSQL = "select * from officers where officer_id = " + sWhere;


      out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
      out.println("     <tr>\n      <td style=\"background-color: #990000; text-align: Center; border-style: outset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">SVEC - Edit Officer</font></td>\n     </tr>");
      if ( ! sEditOfficerErr.equals("")) {
        out.println("     <tr>\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 10pt; color: #000000\">"+sEditOfficerErr+"</font></td>\n     </tr>");
      }
      sEditOfficerErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"EditOfficer\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "EditOfficer".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldofficer_id = (String) rsHash.get("officer_id");
        if ( "".equals(sEditOfficerErr)) {
          // Load data from recordset when form displayed first time
          fldofficer_depid = (String) rsHash.get("officer_depid");
          fldofficer_position = (String) rsHash.get("officer_position");
          fldofficer_phno = (String) rsHash.get("officer_phno");
        }

        if (sAction.equals("") || ! "EditOfficer".equals(sForm)) {
      
          fldofficer_id = (String) rsHash.get("officer_id");
          fldofficer_depid = (String) rsHash.get("officer_depid");
          fldofficer_position = (String) rsHash.get("officer_position");
          fldofficer_phno = (String) rsHash.get("officer_phno");
        }
        
      }
      else {
        if ( "".equals(sEditOfficerErr)) {
          fldofficer_id = toHTML(getParam(request,"officer_id"));
        }
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Name</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"officer_name\" maxlength=\"40\" value=\""+toHTML(fldofficer_name)+"\" size=\"40\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Position</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"officer_position\" maxlength=\"40\" value=\""+toHTML(fldofficer_position)+"\" size=\"40\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Email</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"officer_email\" maxlength=\"20\" value=\""+toHTML(fldofficer_email)+"\" size=\"20\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "EditOfficer".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.EditOfficer.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.EditOfficer.FormAction.value = 'delete';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"EditOfficer\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Insert\" onclick=\"document.EditOfficer.FormAction.value = 'insert';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"EditOfficer\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"officer_id\" value=\""+toHTML(fldofficer_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %><%
stat.close();
conn.close();
%>