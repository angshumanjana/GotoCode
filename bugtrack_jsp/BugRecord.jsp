<%@ include file="Common.jsp" %><%!
//
//   Filename: BugRecord.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/2001
//

static final String sFileName = "BugRecord.jsp";
              
static final String PageBODY = "bgcolor=\"#F3F2E6\" text=\"#000000\" link=\"#800000\" vlink=\"#000080\" alink=\"#0000FF\"";
static final String FormTABLE = "border=\"1\" cellspacing=\"0\" cellpadding=\"2\" bordercolorlight=\"#000000\" bordercolordark=\"#FFFFFF\"";
static final String FormHeaderTD = "align=\"center\" bgcolor=\"#669999\"";
static final String FormHeaderFONT = "style=\"font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\"";
static final String FieldCaptionTD = "bgcolor=\"#B3B300\"";
static final String FieldCaptionFONT = "style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\"";
static final String DataTD = "bgcolor=\"#F0F0F0\"";
static final String DataFONT = "style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\"";
static final String ColumnFONT = "style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\"";
static final String ColumnTD = "bgcolor=\"#B3B300\"";
%><%

String cSec = checkSecurity(1, session, response, request);
if ("sendRedirect".equals(cSec) ) return;
                
boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sBugsErr = "";

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
if ( sForm.equals("Bugs") ) {
  sBugsErr = BugsAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(sBugsErr)) return;
}

%>            
<html>
<head>
<title>Bug Management</title>
<meta name="GENERATOR" content="YesSoftware CodeCharge v.1.2.0 / JSP.ccp build 05/21/2001"/>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body bgcolor="#F3F2E6" text="#000000" link="#800000" vlink="#000080" alink="#0000FF">
<jsp:include page="Header.jsp" flush="true"/>
 <table>
  <tr>
   
   <td valign="top">
<% Bugs_Show(request, response, session, out, sBugsErr, sForm, sAction, conn, stat); %>
    <SCRIPT Language="JavaScript">
if (document.forms["Bugs"])
document.Bugs.onsubmit=delconf;
function delconf() {
if (document.Bugs.FormAction.value == 'delete')
  return confirm('Delete record?');
}
</SCRIPT>
   </td>
  </tr>
 </table>


<center><font face="Arial"><small>This dynamic site was generated with <a href="http://www.codecharge.com">CodeCharge</a></small></font></center>
</body>
</html>
<%%>
<%
if ( stat != null ) stat.close();
if ( conn != null ) conn.close();
%>
<%!


  String BugsAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String sBugsErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "Default.jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      String pPKbug_id = "";
      if (sAction.equalsIgnoreCase("cancel") ) {
        try {
          if ( stat != null ) stat.close();
          if ( conn != null ) conn.close();
        }
        catch ( java.sql.SQLException ignore ) {}
        response.sendRedirect (sActionFileName);
        return "sendRedirect";
      }

      final int iinsertAction = 1;
      final int iupdateAction = 2;
      final int ideleteAction = 3;
      int iAction = 0;

      if ( sAction.equalsIgnoreCase("insert") ) { iAction = iinsertAction; }
      if ( sAction.equalsIgnoreCase("update") ) { iAction = iupdateAction; }
      if ( sAction.equalsIgnoreCase("delete") ) { iAction = ideleteAction; }

      // Create WHERE statement

      if ( iAction == iupdateAction || iAction == ideleteAction ) { 
        pPKbug_id = getParam( request, "PK_bug_id");
        if ( isEmpty(pPKbug_id)) return sBugsErr;
        sWhere = "bug_id=" + toSQL(pPKbug_id, adNumber);
      }


      String fldUserID="";
      String fldbug_name="";
      String fldbug_desc="";
      String fldproject_id="";
      String fldpriority_id="";
      String fldassigned_to="";
      String flddate_assigned="";
      String fldstatus_id="";
      String flddate_resolved="";
      String fldresolution="";
      String fldbug_id="";
      String fldassigned_by="";

      // Load all form fields into variables
    
      fldUserID = (String) session.getAttribute("UserID");
      fldbug_name = getParam(request, "bug_name");
      fldbug_desc = getParam(request, "bug_desc");
      fldproject_id = getParam(request, "project_id");
      fldpriority_id = getParam(request, "priority_id");
      fldassigned_to = getParam(request, "assigned_to");
      flddate_assigned = getParam(request, "date_assigned");
      fldstatus_id = getParam(request, "status_id");
      flddate_resolved = getParam(request, "date_resolved");
      fldresolution = getParam(request, "resolution");
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( isEmpty(fldbug_name) ) {
          sBugsErr = sBugsErr + "The value in field Bug Name is required.<br>";
        }
        if ( isEmpty(fldproject_id) ) {
          sBugsErr = sBugsErr + "The value in field Project is required.<br>";
        }
        if ( isEmpty(fldpriority_id) ) {
          sBugsErr = sBugsErr + "The value in field Priority is required.<br>";
        }
        if ( isEmpty(fldassigned_to) ) {
          sBugsErr = sBugsErr + "The value in field Assigned To is required.<br>";
        }
        if ( isEmpty(fldstatus_id) ) {
          sBugsErr = sBugsErr + "The value in field Status is required.<br>";
        }
        if ( ! isNumber(fldproject_id)) {
          sBugsErr = sBugsErr + "The value in field Project is incorrect.<br>";
        }
        if ( ! isNumber(fldpriority_id)) {
          sBugsErr = sBugsErr + "The value in field Priority is incorrect.<br>";
        }
        if ( ! isNumber(fldassigned_to)) {
          sBugsErr = sBugsErr + "The value in field Assigned To is incorrect.<br>";
        }
        if ( ! isNumber(fldstatus_id)) {
          sBugsErr = sBugsErr + "The value in field Status is incorrect.<br>";
        }
        if (sBugsErr.length() > 0 ) {
          return (sBugsErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into bugs (" + 
                "assigned_by," + 
                "bug_name," +
                "bug_desc," +
                "project_id," +
                "priority_id," +
                "assigned_to," +
                "date_assigned," +
                "status_id," +
                "date_resolved," +
                "resolution)" +

                " values (" + 
                toSQL(fldUserID, adNumber) + "," +
                toSQL(fldbug_name, adText) + "," +
                toSQL(fldbug_desc, adText) + "," +
                toSQL(fldproject_id, adNumber) + "," +
                toSQL(fldpriority_id, adNumber) + "," +
                toSQL(fldassigned_to, adNumber) + "," +
                toSQL(flddate_assigned, adText) + "," +
                toSQL(fldstatus_id, adNumber) + "," +
                toSQL(flddate_resolved, adText) + "," +
                toSQL(fldresolution, adText) + ")";
          break;
  
      case iupdateAction:
        
          sSQL = "update bugs set " +
                "bug_name=" + toSQL(fldbug_name, adText) +
                ",bug_desc=" + toSQL(fldbug_desc, adText) +
                ",project_id=" + toSQL(fldproject_id, adNumber) +
                ",priority_id=" + toSQL(fldpriority_id, adNumber) +
                ",assigned_to=" + toSQL(fldassigned_to, adNumber) +
                ",date_assigned=" + toSQL(flddate_assigned, adText) +
                ",status_id=" + toSQL(fldstatus_id, adNumber) +
                ",date_resolved=" + toSQL(flddate_resolved, adText) +
                ",resolution=" + toSQL(fldresolution, adText);
          sSQL = sSQL + " where " + sWhere;
        break;
      
      case ideleteAction:
           sSQL = "delete from bugs where " + sWhere;
          
        break;
  
      }

      if ( sBugsErr.length() > 0 ) return sBugsErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
      }
      catch(java.sql.SQLException e) {
        sBugsErr = e.toString(); return (sBugsErr);
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
    return (sBugsErr);
  }

  


  void Bugs_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sBugsErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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
      
      String pbug_id = "";

      String fldassigned_by="";
      String fldbug_id="";
      String fldUserID="";
      String fldbug_name="";
      String fldbug_desc="";
      String fldproject_id="";
      String fldpriority_id="";
      String fldassigned_to="";
      String flddate_assigned="";
      String fldstatus_id="";
      String flddate_resolved="";
      String fldresolution="";


      boolean bPK = true;

      if ( "".equals(sBugsErr)) {
        // Load primary key and form parameters
        fldbug_id = getParam( request, "bug_id");
        pbug_id = getParam( request, "bug_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldbug_id = getParam( request, "bug_id");
        fldbug_name = getParam( request, "bug_name");
        fldbug_desc = getParam( request, "bug_desc");
        fldproject_id = getParam( request, "project_id");
        fldpriority_id = getParam( request, "priority_id");
        fldassigned_to = getParam( request, "assigned_to");
        flddate_assigned = getParam( request, "date_assigned");
        fldstatus_id = getParam( request, "status_id");
        flddate_resolved = getParam( request, "date_resolved");
        fldresolution = getParam( request, "resolution");
        pbug_id = getParam( request, "PK_bug_id");
        fldassigned_by = (String) session.getAttribute("UserID");
      }

      
      if ( isEmpty(pbug_id)) { bPK = false; }
      
      sWhere += "bug_id=" + toSQL(pbug_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_bug_id\" value=\""+pbug_id+"\"/>";

      sSQL = "select * from bugs where " + sWhere;


      out.println("    <table border=\"1\" cellspacing=\"0\" cellpadding=\"2\" bordercolorlight=\"#000000\" bordercolordark=\"#FFFFFF\">");
      out.println("     <tr>\n      <td align=\"center\" bgcolor=\"#669999\" colspan=\"2\"><font style=\"font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Add/Edit Bug</font></td>\n     </tr>");
      if ( ! sBugsErr.equals("")) {
        out.println("     <tr>\n      <td bgcolor=\"#F0F0F0\" colspan=\"2\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+sBugsErr+"</font></td>\n     </tr>");
      }
      sBugsErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"Bugs\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "Bugs".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldbug_id = (String) rsHash.get("bug_id");
        fldassigned_by = (String) rsHash.get("assigned_by");
        if ( "".equals(sBugsErr)) {
          // Load data from recordset when form displayed first time
          fldbug_name = (String) rsHash.get("bug_name");
          fldbug_desc = (String) rsHash.get("bug_desc");
          fldproject_id = (String) rsHash.get("project_id");
          fldpriority_id = (String) rsHash.get("priority_id");
          fldassigned_to = (String) rsHash.get("assigned_to");
          flddate_assigned = (String) rsHash.get("date_assigned");
          fldstatus_id = (String) rsHash.get("status_id");
          flddate_resolved = (String) rsHash.get("date_resolved");
          fldresolution = (String) rsHash.get("resolution");
        }

        if (sAction.equals("") || ! "Bugs".equals(sForm)) {
      
          fldbug_id = (String) rsHash.get("bug_id");
          fldbug_name = (String) rsHash.get("bug_name");
          fldbug_desc = (String) rsHash.get("bug_desc");
          fldproject_id = (String) rsHash.get("project_id");
          fldpriority_id = (String) rsHash.get("priority_id");
          fldassigned_by = (String) rsHash.get("assigned_by");
          fldassigned_to = (String) rsHash.get("assigned_to");
          flddate_assigned = (String) rsHash.get("date_assigned");
          fldstatus_id = (String) rsHash.get("status_id");
          flddate_resolved = (String) rsHash.get("date_resolved");
          fldresolution = (String) rsHash.get("resolution");
        }
        else {
          fldbug_id = (String) rsHash.get("bug_id");
          fldassigned_by = (String) rsHash.get("assigned_by");
        }
        
      }
      else {
        if ( "".equals(sBugsErr)) {
          fldbug_id = toHTML(getParam(request,"bug_id"));
          fldassigned_by = toHTML((String) session.getAttribute("UserID"));
          fldpriority_id= "3";
          fldstatus_id= "1";
        }
flddate_assigned= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
      }
      
      // Set lookup fields
          fldassigned_by = dLookUp( stat, "employees", "employee_name", "employee_id=" + toSQL(fldassigned_by, adNumber));


      // Show form field
      
      out.print("     <tr>\n      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Bug Name</font></td><td bgcolor=\"#F0F0F0\">"); out.print("<input type=\"text\"  name=\"bug_name\" maxlength=\"80\" value=\""+toHTML(fldbug_name)+"\" size=\"80\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Bug Desc</font></td><td bgcolor=\"#F0F0F0\">"); out.print("<textarea name=\"bug_desc\" cols=\"60\" rows=\"3\">"+toHTML(fldbug_desc)+"</textarea>");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Project</font></td><td bgcolor=\"#F0F0F0\">"); 
      out.print("<select name=\"project_id\">"+getOptions( conn, "select project_id, project_name from projects order by 2",false,true,fldproject_id)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Priority</font></td><td bgcolor=\"#F0F0F0\">"); 
      out.print("<select name=\"priority_id\">"+getOptions( conn, "select priority_id, priority_desc from priorities order by 2",false,true,fldpriority_id)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Assigned By</font></td><td bgcolor=\"#F0F0F0\">"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldassigned_by)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Assigned To</font></td><td bgcolor=\"#F0F0F0\">"); 
      out.print("<select name=\"assigned_to\">"+getOptions( conn, "select employee_id, employee_name from employees order by 2",false,true,fldassigned_to)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Date Assigned</font></td><td bgcolor=\"#F0F0F0\">"); out.print("<input type=\"text\"  name=\"date_assigned\" maxlength=\"25\" value=\""+toHTML(flddate_assigned)+"\" size=\"25\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Status</font></td><td bgcolor=\"#F0F0F0\">"); 
      out.print("<select name=\"status_id\">"+getOptions( conn, "select status_id, status from statuses order by 2",false,true,fldstatus_id)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Date Resolved</font></td><td bgcolor=\"#F0F0F0\">"); out.print("<input type=\"text\"  name=\"date_resolved\" maxlength=\"25\" value=\""+toHTML(flddate_resolved)+"\" size=\"25\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Resolution</font></td><td bgcolor=\"#F0F0F0\">"); out.print("<textarea name=\"resolution\" cols=\"60\" rows=\"3\">"+toHTML(fldresolution)+"</textarea>");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "Bugs".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.Bugs.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.Bugs.FormAction.value = 'delete';\">");out.print("<input type=\"submit\" value=\"Cancel\" onclick=\"document.Bugs.FormAction.value = 'cancel';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"Bugs\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Insert\" onclick=\"document.Bugs.FormAction.value = 'insert';\">");out.print("<input type=\"submit\" value=\"Cancel\" onclick=\"document.Bugs.FormAction.value = 'cancel';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"Bugs\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"bug_id\" value=\""+toHTML(fldbug_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>