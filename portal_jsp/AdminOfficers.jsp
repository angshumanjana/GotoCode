<%@ include file="Common.jsp" %><%!
//
//   Filename: AdminOfficers.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "AdminOfficers.jsp";
              
%><%

String cSec = checkSecurity(2, session, response, request);
if ("sendRedirect".equals(cSec) ) return;
                
boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sOfficersErr = "";

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
<title>SVEC - Club Officers Administration</title>
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
<% Officers_Show(request, response, session, out, sOfficersErr, sForm, sAction, conn, stat); %>
    
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

  void Officers_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sOfficersErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException  {
  
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


 
    // Build WHERE statement
        
    // Build ORDER statement
    sOrder = " order by o.officer_id Asc";
    String sSort = getParam( request, "FormOfficers_Sorting");
    String sSorted = getParam( request, "FormOfficers_Sorted");
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
        sSortParams = "FormOfficers_Sorting=" + sSort + "&FormOfficers_Sorted=" + sSort + "&";
      }
      else {
        sSorted=sSort;
        sForm_Sorting = sSort;
        sDirection = " ASC";
        sSortParams = "FormOfficers_Sorting=" + sSort + "&FormOfficers_Sorted=" + "&";
      }
    
      if ( iSort == 1) { sOrder = " order by o.officer_name" + sDirection; }
      if ( iSort == 2) { sOrder = " order by o.officer_position" + sDirection; }
      if ( iSort == 3) { sOrder = " order by o.officer_email" + sDirection; }
    }
  

  // Build full SQL statement
  
  sSQL = "select o.officer_email as o_officer_email, " +
    "o.officer_id as o_officer_id, " +
    "o.officer_name as o_officer_name, " +
    "o.officer_position as o_officer_position " +
    " from officers o ";
  
  sSQL = sSQL + sWhere + sOrder;

  String sNoRecords = "     <tr>\n      <td colspan=\"3\" style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">No records</font></td>\n     </tr>";


  String tableHeader = "";
      tableHeader = "     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a href=\""+sFileName+"?"+formParams+"FormOfficers_Sorting=1&FormOfficers_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Name</font></a></td>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a href=\""+sFileName+"?"+formParams+"FormOfficers_Sorting=2&FormOfficers_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Position</font></a></td>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a href=\""+sFileName+"?"+formParams+"FormOfficers_Sorting=3&FormOfficers_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Email</font></a></td>\n     </tr>";
  
  
  try {
    out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
    out.println("     <tr>\n      <td style=\"background-color: #990000; text-align: Center; border-style: outset; border-width: 1\" colspan=\"3\"><a name=\"Officers\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">SVEC - Club Officers Administration</font></a></td>\n     </tr>");
    out.println(tableHeader);

  }
  catch (Exception e) {}

  
  try {
    // Select current page
    iPage = Integer.parseInt(getParam( request, "FormOfficers_Page"));
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
      String fldofficer_email = (String) rsHash.get("o_officer_email");
      String fldofficer_name = (String) rsHash.get("o_officer_name");
      String fldofficer_position = (String) rsHash.get("o_officer_position");

      out.println("     <tr>");
      
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<a href=\"EditOfficer.jsp?"+transitParams+"officer_id="+toURL((String) rsHash.get("o_officer_id"))+"&\"><font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldofficer_name)+"</font></a>");

      out.println("</td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldofficer_position)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldofficer_email)+"&nbsp;</font>");
      out.println("</td>");
      out.println("     </tr>");
    
      iCounter++;
    }
    if (iCounter == 0) {
      // Recordset is empty
      out.println(sNoRecords);
    
      out.print("     <tr>\n      <td colspan=\"3\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
      out.print("<a href=\"EditOfficer.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("</td>\n     </tr>");
    
      iCounter = RecordsPerPage+1;
      bIsScroll = false;
    }

    else {

  
    // Parse scroller
    boolean bInsert = false;
    boolean bNext = rs.next();
    if ( !bNext && iPage == 1 ) {
    
      out.print("     <tr>\n      <td colspan=\"3\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\">\n       <font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
      out.print("\n        <a href=\"EditOfficer.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("\n      </td>\n     </tr>");
    
    }
    else {
      out.print("     <tr>\n      <td colspan=\"3\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
    
      out.print("\n       <a href=\"EditOfficer.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      bInsert = true;
    
      if ( iPage == 1 ) {
        out.print("\n       <a href_=\"#\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Previous</font></a>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormOfficers_Page="+(iPage - 1)+"#Form\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Previous</font></a>");
      }
  
      out.print("\n       [ "+iPage+" ]");
  
      if (!bNext) { 
        out.print("\n       <a href_=\"#\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Next</font></a><br>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormOfficers_Page="+(iPage + 1)+"#Form\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Next</font></a><br>");
      }
    
      if ( ! bInsert ) {
        out.print("     <tr>\n      <td colspan=\"3\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
        out.print("\n        <a href=\"EditOfficer.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
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