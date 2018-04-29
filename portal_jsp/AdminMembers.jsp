<%@ include file="Common.jsp" %><%!
//
//   Filename: AdminMembers.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "AdminMembers.jsp";
              
%><%

String cSec = checkSecurity(3, session, response, request);
if ("sendRedirect".equals(cSec) ) return;
                
boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sSearchErr = "";
String smembersErr = "";

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
<% members_Show(request, response, session, out, smembersErr, sForm, sAction, conn, stat); %>
    
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
      

      String fldmember_login="";
      String fldfirst_name="";
      String fldlast_name="";
      String fldsecurity_level_id="";


      String sSQL="";
      String transitParams = "";
      String sQueryString = "";
      String sPage = "";
      

      out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
      
      out.println("     <form method=\"get\" action=\"AdminMembers.jsp\" name=\"Search\">\n     <tr>");
      // Set variables with search parameters
      
      fldmember_login = getParam( request, "member_login");
      fldfirst_name = getParam( request, "first_name");
      fldlast_name = getParam( request, "last_name");
      fldsecurity_level_id = getParam( request, "security_level_id");

      // Show fields
      

      out.println("      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Login</font></td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"member_login\" maxlength=\"15\" value=\""+toHTML(fldmember_login)+"\" size=\"\">");
 out.println("</td>\n     </tr>\n     <tr>");
      
      out.println("      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">First Name</font></td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"first_name\" maxlength=\"20\" value=\""+toHTML(fldfirst_name)+"\" size=\"20\">");
 out.println("</td>\n     </tr>\n     <tr>");
      
      out.println("      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Last Name</font></td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"last_name\" maxlength=\"20\" value=\""+toHTML(fldlast_name)+"\" size=\"\">");
 out.println("</td>\n     </tr>\n     <tr>");
      
      out.println("      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Security Level</font></td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); 
      out.print("<select name=\"security_level_id\">"+getOptionsLOV(";;0;New;1;Member;3;Admin",true,false,fldsecurity_level_id)+"</select>");
       out.println("</td>\n     </tr>\n     <tr>");
      
      out.println("      <td align=\"right\" colspan=\"3\"><input type=\"submit\" value=\"Search\"/></td>");
      out.println("     </tr>\n     </form>\n    </table>");
      out.println("");
    }
    catch (Exception e) { out.println(e.toString()); }
  }


  void members_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String smembersErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException  {
  
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

      String pfirst_name="";
      String plast_name="";
      String pmember_login="";
      String psecurity_level_id="";


    transitParams = "first_name=" + toURL(getParam( request, "first_name")) + "&last_name=" + toURL(getParam( request, "last_name")) + "&member_login=" + toURL(getParam( request, "member_login")) + "&security_level_id=" + toURL(getParam( request, "security_level_id")) + "&";
    formParams = "first_name=" + toURL(getParam( request, "first_name")) + "&last_name=" + toURL(getParam( request, "last_name")) + "&member_login=" + toURL(getParam( request, "member_login")) + "&security_level_id=" + toURL(getParam( request, "security_level_id")) + "&"; 
    // Build WHERE statement
        
    //-- Check first_name parameter and create a valid sql for where clause
  
    pfirst_name = getParam( request, "first_name");
    if (pfirst_name != null && ! pfirst_name.equals("")) {
            
        hasParam = true;
        sWhere += "m.first_name like '%" + replace(pfirst_name, "'", "''") + "%'";
    }
    
    //-- Check last_name parameter and create a valid sql for where clause
  
    plast_name = getParam( request, "last_name");
    if (plast_name != null && ! plast_name.equals("")) {
            
      if (! sWhere.equals("")) sWhere += " and ";
        hasParam = true;
        sWhere += "m.last_name like '%" + replace(plast_name, "'", "''") + "%'";
    }
    
    //-- Check member_login parameter and create a valid sql for where clause
  
    pmember_login = getParam( request, "member_login");
    if (pmember_login != null && ! pmember_login.equals("")) {
            
      if (! sWhere.equals("")) sWhere += " and ";
        hasParam = true;
        sWhere += "m.member_login like '%" + replace(pmember_login, "'", "''") + "%'";
    }
    
    //-- Check security_level_id parameter and create a valid sql for where clause
  
    psecurity_level_id = getParam( request, "security_level_id");
    if ( ! isNumber (psecurity_level_id)) {
      psecurity_level_id = "";
    }
    
    if (psecurity_level_id != null && ! psecurity_level_id.equals("")) {
            
      if (! sWhere.equals("")) sWhere += " and ";
        hasParam = true;
        sWhere += "m.security_level_id=" + psecurity_level_id;
    }
    
    if (hasParam) { sWhere = " WHERE (" + sWhere + ")"; }
    // Build ORDER statement
    sOrder = " order by m.member_login Asc";
    String sSort = getParam( request, "Formmembers_Sorting");
    String sSorted = getParam( request, "Formmembers_Sorted");
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
        sSortParams = "Formmembers_Sorting=" + sSort + "&Formmembers_Sorted=" + sSort + "&";
      }
      else {
        sSorted=sSort;
        sForm_Sorting = sSort;
        sDirection = " ASC";
        sSortParams = "Formmembers_Sorting=" + sSort + "&Formmembers_Sorted=" + "&";
      }
    
      if ( iSort == 1) { sOrder = " order by m.member_login" + sDirection; }
      if ( iSort == 2) { sOrder = " order by m.first_name" + sDirection; }
      if ( iSort == 3) { sOrder = " order by m.last_name" + sDirection; }
      if ( iSort == 4) { sOrder = " order by m.security_level_id" + sDirection; }
    }
  

  // Build full SQL statement
  
  sSQL = "select m.first_name as m_first_name, " +
    "m.last_name as m_last_name, " +
    "m.member_id as m_member_id, " +
    "m.member_login as m_member_login, " +
    "m.security_level_id as m_security_level_id " +
    " from members m ";
  
  sSQL = sSQL + sWhere + sOrder;

  String sNoRecords = "     <tr>\n      <td colspan=\"5\" style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">No records</font></td>\n     </tr>";


  String tableHeader = "";
      tableHeader = "     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a &\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Edit</font></a></td>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a href=\""+sFileName+"?"+formParams+"Formmembers_Sorting=1&Formmembers_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Login</font></a></td>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a href=\""+sFileName+"?"+formParams+"Formmembers_Sorting=2&Formmembers_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">First Name</font></a></td>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a href=\""+sFileName+"?"+formParams+"Formmembers_Sorting=3&Formmembers_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Last Name</font></a></td>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a href=\""+sFileName+"?"+formParams+"Formmembers_Sorting=4&Formmembers_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Security Level</font></a></td>\n     </tr>";
  
  
  try {
    out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
    out.println("     <tr>\n      <td style=\"background-color: #990000; text-align: Center; border-style: outset; border-width: 1\" colspan=\"5\"><a name=\"members\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">Members</font></a></td>\n     </tr>");
    out.println(tableHeader);

  }
  catch (Exception e) {}

  
  try {
    // Select current page
    iPage = Integer.parseInt(getParam( request, "Formmembers_Page"));
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
      String fldfirst_name = (String) rsHash.get("m_first_name");
      String fldlast_name = (String) rsHash.get("m_last_name");
      String fldmember_login = (String) rsHash.get("m_member_login");
      String fldsecurity_level_id = (String) rsHash.get("m_security_level_id");
      String fldmember_id= "Edit";

      out.println("     <tr>");
      
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<a href=\"EditMembers.jsp?"+transitParams+"member_id="+toURL((String) rsHash.get("m_member_id"))+"&\"><font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldmember_id)+"</font></a>");

      out.println("</td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldmember_login)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldfirst_name)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldlast_name)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); 
        fldsecurity_level_id = getValFromLOV(fldsecurity_level_id, "0;New;1;Member;3;Admin");out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldsecurity_level_id)+"&nbsp;</font>");
      out.println("</td>");
      out.println("     </tr>");
    
      iCounter++;
    }
    if (iCounter == 0) {
      // Recordset is empty
      out.println(sNoRecords);
    
      out.print("     <tr>\n      <td colspan=\"5\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
      out.print("<a href=\"EditMembers.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("</td>\n     </tr>");
    
      iCounter = RecordsPerPage+1;
      bIsScroll = false;
    }

    else {

  
    // Parse scroller
    boolean bInsert = false;
    boolean bNext = rs.next();
    if ( !bNext && iPage == 1 ) {
    
      out.print("     <tr>\n      <td colspan=\"5\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\">\n       <font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
      out.print("\n        <a href=\"EditMembers.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("\n      </td>\n     </tr>");
    
    }
    else {
      out.print("     <tr>\n      <td colspan=\"5\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
    
      out.print("\n       <a href=\"EditMembers.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      bInsert = true;
    
      if ( iPage == 1 ) {
        out.print("\n       <a href_=\"#\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Previous</font></a>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"Formmembers_Page="+(iPage - 1)+"#Form\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Previous</font></a>");
      }
  
      out.print("\n       [ "+iPage+" ]");
  
      if (!bNext) { 
        out.print("\n       <a href_=\"#\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Next</font></a><br>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"Formmembers_Page="+(iPage + 1)+"#Form\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Next</font></a><br>");
      }
    
      if ( ! bInsert ) {
        out.print("     <tr>\n      <td colspan=\"5\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
        out.print("\n        <a href=\"EditMembers.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
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