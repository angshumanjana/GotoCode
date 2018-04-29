<%@ include file="Common.jsp" %><%!
//
//   Filename: AdminLinks.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "AdminLinks.jsp";
              
%><%

boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sSearchErr = "";
String sLinksErr = "";

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
<title>SVEC - Silicon Valley Engineers Club</title>
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
<% Search_Show(request, response, session, out, sSearchErr, sForm, sAction, conn, stat); %>
    
   </td>
  </tr>
 </table>
 <table>
  <tr>
   <td valign="top">
<% Links_Show(request, response, session, out, sLinksErr, sForm, sAction, conn, stat); %>
    
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

  void Search_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sSearchErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
    try {
      

      String fldlink_name="";
      String fldlink_url="";
      String fldapproved="";


      String sSQL="";
      String transitParams = "";
      String sQueryString = "";
      String sPage = "";
      

      out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
      
      out.println("     <form method=\"get\" action=\"AdminLinks.jsp\" name=\"Search\">\n     <tr>");
      // Set variables with search parameters
      
      fldlink_name = getParam( request, "link_name");
      fldlink_url = getParam( request, "link_url");
      fldapproved = getParam( request, "approved");

      // Show fields
      

      out.println("      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Name</font></td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"link_name\" maxlength=\"10\" value=\""+toHTML(fldlink_name)+"\" size=\"10\">");
 out.println("</td>");
      
      out.println("      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">URL</font></td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"link_url\" maxlength=\"10\" value=\""+toHTML(fldlink_url)+"\" size=\"10\">");
 out.println("</td>");
      
      out.println("      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Approved</font></td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); 
      out.print("<select name=\"approved\">"+getOptionsLOV(";;1;Yes;0;No",true,false,fldapproved)+"</select>");
       out.println("</td>");
      
      out.println("      <td ><input type=\"submit\" value=\"Search\"/></td>");
      out.println("     </tr>\n     </form>\n    </table>");
      out.println("");
    }
    catch (Exception e) { out.println(e.toString()); }
  }


  void Links_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sLinksErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException  {
  
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
      String plink_name="";
      String plink_url="";


    transitParams = "link_name=" + toURL(getParam( request, "link_name")) + "&link_url=" + toURL(getParam( request, "link_url")) + "&approved=" + toURL(getParam( request, "approved")) + "&";
    formParams = "link_name=" + toURL(getParam( request, "link_name")) + "&link_url=" + toURL(getParam( request, "link_url")) + "&approved=" + toURL(getParam( request, "approved")) + "&"; 
    // Build WHERE statement
        
    //-- Check approved parameter and create a valid sql for where clause
  
    papproved = getParam( request, "approved");
    if ( ! isNumber (papproved)) {
      papproved = "";
    }
    
    if (papproved != null && ! papproved.equals("")) {
            
        hasParam = true;
        sWhere += "l.approved=" + papproved;
    }
    
    //-- Check link_name parameter and create a valid sql for where clause
  
    plink_name = getParam( request, "link_name");
    if (plink_name != null && ! plink_name.equals("")) {
            
      if (! sWhere.equals("")) sWhere += " and ";
        hasParam = true;
        sWhere += "l.link_name like '%" + replace(plink_name, "'", "''") + "%'";
    }
    
    //-- Check link_url parameter and create a valid sql for where clause
  
    plink_url = getParam( request, "link_url");
    if (plink_url != null && ! plink_url.equals("")) {
            
      if (! sWhere.equals("")) sWhere += " and ";
        hasParam = true;
        sWhere += "l.link_url like '%" + replace(plink_url, "'", "''") + "%'";
    }
    
    if (hasParam) { sWhere = " WHERE (" + sWhere + ")"; }
    // Build ORDER statement
    sOrder = " order by l.date_added Desc";
    String sSort = getParam( request, "FormLinks_Sorting");
    String sSorted = getParam( request, "FormLinks_Sorted");
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
        sSortParams = "FormLinks_Sorting=" + sSort + "&FormLinks_Sorted=" + sSort + "&";
      }
      else {
        sSorted=sSort;
        sForm_Sorting = sSort;
        sDirection = " ASC";
        sSortParams = "FormLinks_Sorting=" + sSort + "&FormLinks_Sorted=" + "&";
      }
    
      if ( iSort == 1) { sOrder = " order by l.date_added" + sDirection; }
      if ( iSort == 2) { sOrder = " order by l.link_name" + sDirection; }
      if ( iSort == 3) { sOrder = " order by l.link_url" + sDirection; }
      if ( iSort == 4) { sOrder = " order by l.approved" + sDirection; }
    }
  

  // Build full SQL statement
  
  sSQL = "select l.approved as l_approved, " +
    "l.date_added as l_date_added, " +
    "l.link_id as l_link_id, " +
    "l.link_name as l_link_name, " +
    "l.link_url as l_link_url " +
    " from links l ";
  
  sSQL = sSQL + sWhere + sOrder;

  String sNoRecords = "     <tr>\n      <td colspan=\"4\" style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">No records</font></td>\n     </tr>";


  String tableHeader = "";
      tableHeader = "     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a href=\""+sFileName+"?"+formParams+"FormLinks_Sorting=1&FormLinks_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Date Added</font></a></td>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a href=\""+sFileName+"?"+formParams+"FormLinks_Sorting=2&FormLinks_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Name</font></a></td>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a href=\""+sFileName+"?"+formParams+"FormLinks_Sorting=3&FormLinks_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">URL</font></a></td>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a href=\""+sFileName+"?"+formParams+"FormLinks_Sorting=4&FormLinks_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Approved</font></a></td>\n     </tr>";
  
  
  try {
    out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
    out.println("     <tr>\n      <td style=\"background-color: #990000; text-align: Center; border-style: outset; border-width: 1\" colspan=\"4\"><a name=\"Links\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">Links</font></a></td>\n     </tr>");
    out.println(tableHeader);

  }
  catch (Exception e) {}

  
  try {
    // Select current page
    iPage = Integer.parseInt(getParam( request, "FormLinks_Page"));
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
      String fldapproved = (String) rsHash.get("l_approved");
      String flddate_added = (String) rsHash.get("l_date_added");
      String fldlink_name = (String) rsHash.get("l_link_name");
      String fldlink_url = (String) rsHash.get("l_link_url");

      out.println("     <tr>");
      
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(flddate_added)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<a href=\"EditLink.jsp?"+transitParams+"link_id="+toURL((String) rsHash.get("l_link_id"))+"&\"><font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldlink_name)+"</font></a>");

      out.println("</td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<a href=\""+(String) rsHash.get("l_link_url")+"\"><font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldlink_url)+"</font></a>");

      out.println("</td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); 
        fldapproved = getValFromLOV(fldapproved, "0;No;1;Yes");out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldapproved)+"&nbsp;</font>");
      out.println("</td>");
      out.println("     </tr>");
    
      iCounter++;
    }
    if (iCounter == 0) {
      // Recordset is empty
      out.println(sNoRecords);
    
      out.print("     <tr>\n      <td colspan=\"4\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
      out.print("<a href=\"EditLink.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("</td>\n     </tr>");
    
      iCounter = RecordsPerPage+1;
      bIsScroll = false;
    }

    else {

  
    // Parse scroller
    boolean bInsert = false;
    boolean bNext = rs.next();
    if ( !bNext && iPage == 1 ) {
    
      out.print("     <tr>\n      <td colspan=\"4\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\">\n       <font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
      out.print("\n        <a href=\"EditLink.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("\n      </td>\n     </tr>");
    
    }
    else {
      out.print("     <tr>\n      <td colspan=\"4\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
    
      out.print("\n       <a href=\"EditLink.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      bInsert = true;
    
      if ( iPage == 1 ) {
        out.print("\n       <a href_=\"#\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Previous</font></a>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormLinks_Page="+(iPage - 1)+"#Form\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Previous</font></a>");
      }
  
      out.print("\n       [ "+iPage+" ]");
  
      if (!bNext) { 
        out.print("\n       <a href_=\"#\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Next</font></a><br>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormLinks_Page="+(iPage + 1)+"#Form\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Next</font></a><br>");
      }
    
      if ( ! bInsert ) {
        out.print("     <tr>\n      <td colspan=\"4\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
        out.print("\n        <a href=\"EditLink.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
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