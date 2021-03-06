<%@ include file="Common.jsp" %><%!
//
//   Filename: AdminEventsGrid.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "AdminEventsGrid.jsp";
              
static final String PageBODY = "bgcolor=\"#FFFFFF\" text=\"#000000\" link=\"#000080\" vlink=\"#000080\" alink=\"#000080\" background=\"images/bg.gif\" style=\"background-repeat: no-repeat\"";
static final String FormTABLE = "border=\"0\" cellspacing=\"1\" cellpadding=\"2\"";
static final String FormHeaderTD = "align=\"center\" bgcolor=\"#0033CC\"";
static final String FormHeaderFONT = "style=\"font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\"";
static final String FieldCaptionTD = "bgcolor=\"#0066FF\"";
static final String FieldCaptionFONT = "style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\"";
static final String DataTD = "";
static final String DataFONT = "style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\"";
static final String ColumnFONT = "style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\"";
static final String ColumnTD = "bgcolor=\"#0066FF\"";
%><%

String cSec = checkSecurity( session, response, request );
if ("sendRedirect".equals(cSec) ) return;

boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sEventsErr = "";
String sSearchErr = "";

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
<title>Events</title>
<meta name="GENERATOR" content="YesSoftware CodeCharge v.1.2.0 / JSP.ccp build 05/21/01"/>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body bgcolor="#FFFFFF" text="#000000" link="#000080" vlink="#000080" alink="#000080" background="images/bg.gif" style="background-repeat: no-repeat">
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
<% Events_Show(request, response, session, out, sEventsErr, sForm, sAction, conn, stat); %>
    
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

  void Events_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sEventsErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException  {
  
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

      String papproved="";
      String pcategory_id="";
      String pname="";


    transitParams = "approved=" + toURL(getParam( request, "approved")) + "&name=" + toURL(getParam( request, "name")) + "&category_id=" + toURL(getParam( request, "category_id")) + "&";
    formParams = "approved=" + toURL(getParam( request, "approved")) + "&name=" + toURL(getParam( request, "name")) + "&category_id=" + toURL(getParam( request, "category_id")) + "&"; 
    // Build WHERE statement
        
    //-- Check approved parameter and create a valid sql for where clause
  
    papproved = getParam( request, "approved");
    if ( ! isNumber (papproved)) {
      papproved = "";
    }
    
    if (papproved != null && ! papproved.equals("")) {
            
        hasParam = true;
        sWhere += "e.approved=" + papproved;
    }
    
    //-- Check category_id parameter and create a valid sql for where clause
  
    pcategory_id = getParam( request, "category_id");
    if ( ! isNumber (pcategory_id)) {
      pcategory_id = "";
    }
    
    if (pcategory_id != null && ! pcategory_id.equals("")) {
            
      if (! sWhere.equals("")) sWhere += " and ";
        hasParam = true;
        sWhere += "e.category_id=" + pcategory_id;
    }
    
    //-- Check name parameter and create a valid sql for where clause
  
    pname = getParam( request, "name");
    if (pname != null && ! pname.equals("")) {
            
      if (! sWhere.equals("")) sWhere += " and ";
        hasParam = true;
        sWhere += "e.name like '%" + replace(pname, "'", "''") + "%'";
    }
    
    if (hasParam) { sWhere = " AND (" + sWhere + ")"; }
    // Build ORDER statement
    String sSort = getParam( request, "FormEvents_Sorting");
    String sSorted = getParam( request, "FormEvents_Sorted");
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
        sSortParams = "FormEvents_Sorting=" + sSort + "&FormEvents_Sorted=" + sSort + "&";
      }
      else {
        sSorted=sSort;
        sForm_Sorting = sSort;
        sDirection = " ASC";
        sSortParams = "FormEvents_Sorting=" + sSort + "&FormEvents_Sorted=" + "&";
      }
    
      if ( iSort == 1) { sOrder = " order by e.name" + sDirection; }
      if ( iSort == 2) { sOrder = " order by e.date_start" + sDirection; }
      if ( iSort == 3) { sOrder = " order by c.category_desc" + sDirection; }
      if ( iSort == 4) { sOrder = " order by e.approved" + sDirection; }
    }
  

  // Build full SQL statement
  
  sSQL = "select e.approved as e_approved, " +
    "e.category_id as e_category_id, " +
    "e.date_start as e_date_start, " +
    "e.event_id as e_event_id, " +
    "e.name as e_name, " +
    "c.category_id as c_category_id, " +
    "c.category_desc as c_category_desc " +
    " from events e, categories c" +
    " where c.category_id=e.category_id  ";
  
  sSQL = sSQL + sWhere + sOrder;

  String sNoRecords = "     <tr>\n      <td colspan=\"5\" ><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">No records</font></td>\n     </tr>";


  String tableHeader = "";
      tableHeader = "     <tr>\n      <td bgcolor=\"#0066FF\"><a &\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Edit</font></a></td>\n      <td bgcolor=\"#0066FF\"><a href=\""+sFileName+"?"+formParams+"FormEvents_Sorting=1&FormEvents_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Name</font></a></td>\n      <td bgcolor=\"#0066FF\"><a href=\""+sFileName+"?"+formParams+"FormEvents_Sorting=2&FormEvents_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Date Start</font></a></td>\n      <td bgcolor=\"#0066FF\"><a href=\""+sFileName+"?"+formParams+"FormEvents_Sorting=3&FormEvents_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Category</font></a></td>\n      <td bgcolor=\"#0066FF\"><a href=\""+sFileName+"?"+formParams+"FormEvents_Sorting=4&FormEvents_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Approved</font></a></td>\n     </tr>";
  
  
  try {
    out.println("    <table border=\"0\" cellspacing=\"1\" cellpadding=\"2\">");
    
    out.println(tableHeader);

  }
  catch (Exception e) {}

  
  try {
    // Select current page
    iPage = Integer.parseInt(getParam( request, "FormEvents_Page"));
  }
  catch (NumberFormatException e ) {
    iPage = 0;
  }

  if (iPage == 0) { iPage = 1; }
  RecordsPerPage = 10;
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
      String fldapproved = (String) rsHash.get("e_approved");
      String fldcategory_id = (String) rsHash.get("c_category_desc");
      String flddate_start = (String) rsHash.get("e_date_start");
      String fldname = (String) rsHash.get("e_name");
      String fldField1= "Edit";

      out.println("     <tr>");
      
      out.print("      <td >"); out.print("<a href=\"AdminEventsRecord.jsp?"+transitParams+"event_id="+toURL((String) rsHash.get("e_event_id"))+"&\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldField1)+"</font></a>");

      out.println("</td>");
      out.print("      <td >"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldname)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td >"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(flddate_start)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td >"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldcategory_id)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td >"); 
        fldapproved = getValFromLOV(fldapproved, "0;No;1;Yes");out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldapproved)+"&nbsp;</font>");
      out.println("</td>");
      out.println("     </tr>");
    
      iCounter++;
    }
    if (iCounter == 0) {
      // Recordset is empty
      out.println(sNoRecords);
    
      out.print("     <tr>\n      <td colspan=\"5\" bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">");
      out.print("<a href=\"AdminEventsRecord.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("</td>\n     </tr>");
    
      iCounter = RecordsPerPage+1;
      bIsScroll = false;
    }

    else {

  
    // Parse scroller
    boolean bInsert = false;
    boolean bNext = rs.next();
    if ( !bNext && iPage == 1 ) {
    
      out.print("     <tr>\n      <td colspan=\"5\" bgcolor=\"#0066FF\">\n       <font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">");
      out.print("\n        <a href=\"AdminEventsRecord.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("\n      </td>\n     </tr>");
    
    }
    else {
      out.print("     <tr>\n      <td colspan=\"5\" bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">");
    
      out.print("\n       <a href=\"AdminEventsRecord.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      bInsert = true;
    
      if ( iPage == 1 ) {
        out.print("\n       <a href_=\"#\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Previous</font></a>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormEvents_Page="+(iPage - 1)+"#Form\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Previous</font></a>");
      }
  
      out.print("\n       [ "+iPage+" ]");
  
      if (!bNext) { 
        out.print("\n       <a href_=\"#\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Next</font></a><br>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormEvents_Page="+(iPage + 1)+"#Form\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Next</font></a><br>");
      }
    
      if ( ! bInsert ) {
        out.print("     <tr>\n      <td colspan=\"5\" bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">");
        out.print("\n        <a href=\"AdminEventsRecord.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      }
    
      out.println("</td>\n     </tr>");
    }
  
    }

    if ( rs != null ) rs.close();
    out.println("    </table>");
    
  }
  catch (Exception e) { out.println(e.toString()); }
}


  void Search_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sSearchErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
    try {
      

      String fldcategory_id="";
      String fldname="";
      String fldapproved="";


      String sSQL="";
      String transitParams = "";
      String sQueryString = "";
      String sPage = "";
      

      out.println("    <table border=\"0\" cellspacing=\"1\" cellpadding=\"2\">");
      out.println("     <tr>\n      <td align=\"center\" bgcolor=\"#0033CC\" colspan=\"7\"><a name=\"Search\"><font style=\"font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Search</font></a></td>\n     </tr>");
      out.println("     <form method=\"get\" action=\"AdminEventsGrid.jsp\" name=\"Search\">\n     <tr>");
      // Set variables with search parameters
      
      fldcategory_id = getParam( request, "category_id");
      fldname = getParam( request, "name");
      fldapproved = getParam( request, "approved");

      // Show fields
      

      out.println("      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Category</font></td>");
      out.print("      <td >"); 
      out.print("<select name=\"category_id\">"+getOptions( conn, "select category_id, category_desc from categories order by 2",true,false,fldcategory_id)+"</select>");
       out.println("</td>\n     </tr>\n     <tr>");
      
      out.println("      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Name</font></td>");
      out.print("      <td >"); out.print("<input type=\"text\"  name=\"name\" maxlength=\"20\" value=\""+toHTML(fldname)+"\" size=\"20\">");
 out.println("</td>\n     </tr>\n     <tr>");
      
      out.println("      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Approved</font></td>");
      out.print("      <td >"); 
      out.print("<select name=\"approved\">"+getOptionsLOV(";;1;Yes;0;No",true,false,fldapproved)+"</select>");
       out.println("</td>\n     </tr>\n     <tr>");
      
      out.println("      <td align=\"right\" colspan=\"3\"><input type=\"submit\" value=\"Search\"/></td>");
      out.println("     </tr>\n     </form>\n    </table>");
      out.println("");
    }
    catch (Exception e) { out.println(e.toString()); }
  }
%>