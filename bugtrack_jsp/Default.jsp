<%@ include file="Common.jsp" %><%!
//
//   Filename: Default.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/2001
//

static final String sFileName = "Default.jsp";
              
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

boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sSearchErr = "";
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
<% Search_Show(request, response, session, out, sSearchErr, sForm, sAction, conn, stat); %>
    
   </td>
  </tr>
 </table>
 <table>
  <tr>
   <td valign="top">
<% Bugs_Show(request, response, session, out, sBugsErr, sForm, sAction, conn, stat); %>
    
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

  void Search_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sSearchErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
    try {
      

      String fldproject_id="";
      String fldassigned_to="";
      String fldpriority_id="";
      String fldstatus_id="";


      String sSQL="";
      String transitParams = "";
      String sQueryString = "";
      String sPage = "";
      

      out.println("    <table border=\"1\" cellspacing=\"0\" cellpadding=\"2\" bordercolorlight=\"#000000\" bordercolordark=\"#FFFFFF\">");
      out.println("     <tr>\n      <td align=\"center\" bgcolor=\"#669999\" colspan=\"9\"><a name=\"Search\"><font style=\"font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Search</font></a></td>\n     </tr>");
      out.println("     <form method=\"get\" action=\"Default.jsp\" name=\"Search\">\n     <tr>");
      // Set variables with search parameters
      
      fldproject_id = getParam( request, "project_id");
      fldassigned_to = getParam( request, "assigned_to");
      fldpriority_id = getParam( request, "priority_id");
      fldstatus_id = getParam( request, "status_id");

      // Show fields
      

      out.println("      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Project</font></td>");
      out.print("      <td bgcolor=\"#F0F0F0\">"); 
      out.print("<select name=\"project_id\">"+getOptions( conn, "select project_id, project_name from projects order by 2",true,false,fldproject_id)+"</select>");
       out.println("</td>\n     </tr>\n     <tr>");
      
      out.println("      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Assigned To</font></td>");
      out.print("      <td bgcolor=\"#F0F0F0\">"); 
      out.print("<select name=\"assigned_to\">"+getOptions( conn, "select employee_id, employee_name from employees order by 2",true,false,fldassigned_to)+"</select>");
       out.println("</td>\n     </tr>\n     <tr>");
      
      out.println("      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Priority</font></td>");
      out.print("      <td bgcolor=\"#F0F0F0\">"); 
      out.print("<select name=\"priority_id\">"+getOptions( conn, "select priority_id, priority_desc from priorities order by 2",true,false,fldpriority_id)+"</select>");
       out.println("</td>\n     </tr>\n     <tr>");
      
      out.println("      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Status</font></td>");
      out.print("      <td bgcolor=\"#F0F0F0\">"); 
      out.print("<select name=\"status_id\">"+getOptions( conn, "select status_id, status from statuses order by 2",true,false,fldstatus_id)+"</select>");
       out.println("</td>\n     </tr>\n     <tr>");
      
      out.println("      <td align=\"right\" colspan=\"3\"><input type=\"submit\" value=\"Search\"/></td>");
      out.println("     </tr>\n     </form>\n    </table>");
      out.println("");
    }
    catch (Exception e) { out.println(e.toString()); }
  }


  void Bugs_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sBugsErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException  {
  
    String sWhere = "";
    int iCounter=0;
    int iPage = 0;
    boolean bIsScroll = true;
    boolean hasParam = false;
    String sOrder = "";
    String sSQL="";
    String transitParams = "";
    String sQueryString = "";
    String sPage = "";
    int RecordsPerPage = 20;
    String sSortParams = "";
    String formParams = "";

      String passigned_to="";
      String ppriority_id="";
      String pproject_id="";
      String pstatus_id="";


    transitParams = "project_id=" + toURL(getParam( request, "project_id")) + "&assigned_to=" + toURL(getParam( request, "assigned_to")) + "&priority_id=" + toURL(getParam( request, "priority_id")) + "&status_id=" + toURL(getParam( request, "status_id")) + "&";
    formParams = "project_id=" + toURL(getParam( request, "project_id")) + "&assigned_to=" + toURL(getParam( request, "assigned_to")) + "&priority_id=" + toURL(getParam( request, "priority_id")) + "&status_id=" + toURL(getParam( request, "status_id")) + "&"; 
    // Build WHERE statement
        
    //-- Check assigned_to parameter and create a valid sql for where clause
  
    passigned_to = getParam( request, "assigned_to");
    if ( ! isNumber (passigned_to)) {
      passigned_to = "";
    }
    
    if (passigned_to != null && ! passigned_to.equals("")) {
            
        hasParam = true;
        sWhere += "b.assigned_to=" + passigned_to;
    }
    
    //-- Check priority_id parameter and create a valid sql for where clause
  
    ppriority_id = getParam( request, "priority_id");
    if ( ! isNumber (ppriority_id)) {
      ppriority_id = "";
    }
    
    if (ppriority_id != null && ! ppriority_id.equals("")) {
            
      if (! sWhere.equals("")) sWhere += " and ";
        hasParam = true;
        sWhere += "b.priority_id=" + ppriority_id;
    }
    
    //-- Check project_id parameter and create a valid sql for where clause
  
    pproject_id = getParam( request, "project_id");
    if ( ! isNumber (pproject_id)) {
      pproject_id = "";
    }
    
    if (pproject_id != null && ! pproject_id.equals("")) {
            
      if (! sWhere.equals("")) sWhere += " and ";
        hasParam = true;
        sWhere += "b.project_id=" + pproject_id;
    }
    
    //-- Check status_id parameter and create a valid sql for where clause
  
    pstatus_id = getParam( request, "status_id");
    if ( ! isNumber (pstatus_id)) {
      pstatus_id = "";
    }
    
    if (pstatus_id != null && ! pstatus_id.equals("")) {
            
      if (! sWhere.equals("")) sWhere += " and ";
        hasParam = true;
        sWhere += "b.status_id=" + pstatus_id;
    }
    
    if (hasParam) { sWhere = " AND (" + sWhere + ")"; }
    // Build ORDER statement
    String sSort = getParam( request, "FormBugs_Sorting");
    String sSorted = getParam( request, "FormBugs_Sorted");
    String sDirection = "";
    String sForm_Sorting = "";
    int iSort = 0;
    try {
      iSort = Integer.parseInt(sSort);
    }
    catch (NumberFormatException e ) {
      sSort = "";
    }
    if ( iSort == 0 ) {
      sForm_Sorting = "";
    }
    else {
      if ( sSort.equals(sSorted)) { 
        sSorted="0";
        sForm_Sorting = "";
        sDirection = " DESC";
        sSortParams = "FormBugs_Sorting=" + sSort + "&FormBugs_Sorted=" + sSort + "&";
      }
      else {
        sSorted=sSort;
        sForm_Sorting = sSort;
        sDirection = " ASC";
        sSortParams = "FormBugs_Sorting=" + sSort + "&FormBugs_Sorted=" + "&";
      }
    
      if ( iSort == 1) { sOrder = " order by b.bug_id" + sDirection; }
      if ( iSort == 2) { sOrder = " order by b.bug_name" + sDirection; }
      if ( iSort == 3) { sOrder = " order by p.project_name" + sDirection; }
      if ( iSort == 4) { sOrder = " order by p1.priority_desc" + sDirection; }
      if ( iSort == 5) { sOrder = " order by e.employee_name" + sDirection; }
      if ( iSort == 6) { sOrder = " order by s.status" + sDirection; }
    }
  

  // Build full SQL statement
  
  sSQL = "select b.assigned_to as b_assigned_to, " +
    "b.bug_id as b_bug_id, " +
    "b.bug_name as b_bug_name, " +
    "b.priority_id as b_priority_id, " +
    "b.project_id as b_project_id, " +
    "b.status_id as b_status_id, " +
    "p.project_id as p_project_id, " +
    "p.project_name as p_project_name, " +
    "p1.priority_id as p1_priority_id, " +
    "p1.priority_desc as p1_priority_desc, " +
    "e.employee_id as e_employee_id, " +
    "e.employee_name as e_employee_name, " +
    "s.status_id as s_status_id, " +
    "s.status as s_status " +
    " from bugs b, projects p, priorities p1, employees e, statuses s" +
    " where p.project_id=b.project_id and p1.priority_id=b.priority_id and e.employee_id=b.assigned_to and s.status_id=b.status_id  ";
  
  sSQL = sSQL + sWhere + sOrder;

  String sNoRecords = "     <tr>\n      <td colspan=\"6\" bgcolor=\"#F0F0F0\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">No records</font></td>\n     </tr>";


  String tableHeader = "";
      tableHeader = "     <tr>\n      <td bgcolor=\"#B3B300\"><a href=\""+sFileName+"?"+formParams+"FormBugs_Sorting=1&FormBugs_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Bug #</font></a></td>\n      <td bgcolor=\"#B3B300\"><a href=\""+sFileName+"?"+formParams+"FormBugs_Sorting=2&FormBugs_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Bug</font></a></td>\n      <td bgcolor=\"#B3B300\"><a href=\""+sFileName+"?"+formParams+"FormBugs_Sorting=3&FormBugs_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Project</font></a></td>\n      <td bgcolor=\"#B3B300\"><a href=\""+sFileName+"?"+formParams+"FormBugs_Sorting=4&FormBugs_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Priority</font></a></td>\n      <td bgcolor=\"#B3B300\"><a href=\""+sFileName+"?"+formParams+"FormBugs_Sorting=5&FormBugs_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Assigned To</font></a></td>\n      <td bgcolor=\"#B3B300\"><a href=\""+sFileName+"?"+formParams+"FormBugs_Sorting=6&FormBugs_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Status</font></a></td>\n     </tr>";
  
  
  try {
    out.println("    <table border=\"1\" cellspacing=\"0\" cellpadding=\"2\" bordercolorlight=\"#000000\" bordercolordark=\"#FFFFFF\">");
    out.println("     <tr>\n      <td align=\"center\" bgcolor=\"#669999\" colspan=\"6\"><a name=\"Bugs\"><font style=\"font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Bugs</font></a></td>\n     </tr>");
    out.println(tableHeader);

  }
  catch (Exception e) {}

  
  try {
    // Select current page
    iPage = Integer.parseInt(getParam( request, "FormBugs_Page"));
  }
  catch (NumberFormatException e ) {
    iPage = 0;
  }

  if (iPage == 0) { iPage = 1; }
  RecordsPerPage = 20;
  try {
    java.sql.ResultSet rs = null;
    // Open recordset
    rs = openrs( stat, sSQL);
    iCounter = 0;
    absolute (rs, (iPage-1)*RecordsPerPage+1);
    java.util.Hashtable rsHash = new java.util.Hashtable();
    String[] aFields = getFieldsName( rs );

    // Show main table based on recordset
    while ( (iCounter < RecordsPerPage) && rs.next() ) {

      getRecordToHash( rs, rsHash, aFields );
      String fldassigned_to = (String) rsHash.get("e_employee_name");
      String fldbug_id = (String) rsHash.get("b_bug_id");
      String fldbug_name = (String) rsHash.get("b_bug_name");
      String fldpriority_id = (String) rsHash.get("p1_priority_desc");
      String fldproject_id = (String) rsHash.get("p_project_name");
      String fldstatus_id = (String) rsHash.get("s_status");

      out.println("     <tr>");
      
      out.print("      <td bgcolor=\"#F0F0F0\">"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldbug_id)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td bgcolor=\"#F0F0F0\">"); out.print("<a href=\"BugRecord.jsp?"+transitParams+"bug_id="+toURL((String) rsHash.get("b_bug_id"))+"&\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldbug_name)+"</font></a>");

      out.println("</td>");
      out.print("      <td bgcolor=\"#F0F0F0\">"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldproject_id)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td bgcolor=\"#F0F0F0\">"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+fldpriority_id+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td bgcolor=\"#F0F0F0\">"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldassigned_to)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td bgcolor=\"#F0F0F0\">"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldstatus_id)+"&nbsp;</font>");
      out.println("</td>");
      out.println("     </tr>");
    
      iCounter++;
    }
    if (iCounter == 0) {
      // Recordset is empty
      out.println(sNoRecords);
    
      out.print("     <tr>\n      <td colspan=\"6\" bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">");
      out.print("<a href=\"BugRecord.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Add New Bug</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("</td>\n     </tr>");
    
      iCounter = RecordsPerPage+1;
      bIsScroll = false;
    }

    else {

  
    // Parse scroller
    boolean bInsert = false;
    boolean bNext = rs.next();
    if ( !bNext && iPage == 1 ) {
    
      out.print("     <tr>\n      <td colspan=\"6\" bgcolor=\"#B3B300\">\n       <font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">");
      out.print("\n        <a href=\"BugRecord.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Add New Bug</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("\n      </td>\n     </tr>");
    
    }
    else {
      out.print("     <tr>\n      <td colspan=\"6\" bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">");
    
      out.print("\n       <a href=\"BugRecord.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Add New Bug</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      bInsert = true;
    
      if ( iPage == 1 ) {
        out.print("\n       <a href_=\"#\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Previous</font></a>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormBugs_Page="+(iPage - 1)+"#Form\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Previous</font></a>");
      }
  
      out.print("\n       [ "+iPage+" ]");
  
      if (!bNext) { 
        out.print("\n       <a href_=\"#\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Next</font></a><br>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormBugs_Page="+(iPage + 1)+"#Form\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Next</font></a><br>");
      }
    
      if ( ! bInsert ) {
        out.print("     <tr>\n      <td colspan=\"6\" bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">");
        out.print("\n        <a href=\"BugRecord.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Add New Bug</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      }
    
      out.println("</td>\n     </tr>");
    }
  
    }

    if ( rs != null ) rs.close();
    out.println("    </table>");
    
  }
  catch (Exception e) { out.println(e.toString()); }
}
%>