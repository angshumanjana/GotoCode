<%@ include file="Common.jsp" %><%!
//
//   Filename: AdminArticles.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "AdminArticles.jsp";
              
%><%

String cSec = checkSecurity(2, session, response, request);
if ("sendRedirect".equals(cSec) ) return;
                
boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sSearchErr = "";
String sArticlesErr = "";

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
<title>SVEC - Article Administration</title>
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
<% Articles_Show(request, response, session, out, sArticlesErr, sForm, sAction, conn, stat); %>
    
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
      

      String fldsearch="";
      String fldcategory_id="";


      String sSQL="";
      String transitParams = "";
      String sQueryString = "";
      String sPage = "";
      

      out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
      out.println("     <tr>\n      <td style=\"background-color: #990000; text-align: Center; border-style: outset; border-width: 1\" colspan=\"5\"><a name=\"Search\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">Article Search</font></a></td>\n     </tr>");
      out.println("     <form method=\"get\" action=\"AdminArticles.jsp\" name=\"Search\">\n     <tr>");
      // Set variables with search parameters
      
      fldsearch = getParam( request, "search");
      fldcategory_id = getParam( request, "category_id");

      // Show fields
      

      out.println("      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Article</font></td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"search\" maxlength=\"30\" value=\""+toHTML(fldsearch)+"\" size=\"30\">");
 out.println("</td>");
      
      out.println("      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Category</font></td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); 
      out.print("<select name=\"category_id\">"+getOptions( conn, "select category_id, category_desc from categories order by 2",true,false,fldcategory_id)+"</select>");
       out.println("</td>");
      
      out.println("      <td ><input type=\"submit\" value=\"Search\"/></td>");
      out.println("     </tr>\n     </form>\n    </table>");
      out.println("");
    }
    catch (Exception e) { out.println(e.toString()); }
  }


  void Articles_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sArticlesErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException  {
  
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

      String pcategory_id="";
      String psearch="";


    transitParams = "search=" + toURL(getParam( request, "search")) + "&category_id=" + toURL(getParam( request, "category_id")) + "&";
    formParams = "search=" + toURL(getParam( request, "search")) + "&category_id=" + toURL(getParam( request, "category_id")) + "&"; 
    // Build WHERE statement
        
    //-- Check category_id parameter and create a valid sql for where clause
  
    pcategory_id = getParam( request, "category_id");
    if ( ! isNumber (pcategory_id)) {
      pcategory_id = "";
    }
    
    if (pcategory_id != null && ! pcategory_id.equals("")) {
            
        hasParam = true;
        sWhere += "a.category_id=" + pcategory_id;
    }
    
    //-- Check search parameter and create a valid sql for where clause
  
    psearch = getParam( request, "search");
    if (psearch != null && ! psearch.equals("")) {
            
      if (! sWhere.equals("")) sWhere += " and ";
        hasParam = true;
        sWhere += "a.article_desc like '%" + replace(psearch, "'", "''") + "%'";
    }
    
    if (hasParam) { sWhere = " AND (" + sWhere + ")"; }
    // Build ORDER statement
    sOrder = " order by a.article_id Asc";
    String sSort = getParam( request, "FormArticles_Sorting");
    String sSorted = getParam( request, "FormArticles_Sorted");
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
        sSortParams = "FormArticles_Sorting=" + sSort + "&FormArticles_Sorted=" + sSort + "&";
      }
      else {
        sSorted=sSort;
        sForm_Sorting = sSort;
        sDirection = " ASC";
        sSortParams = "FormArticles_Sorting=" + sSort + "&FormArticles_Sorted=" + "&";
      }
    
      if ( iSort == 1) { sOrder = " order by a.article_title" + sDirection; }
      if ( iSort == 2) { sOrder = " order by c.category_desc" + sDirection; }
      if ( iSort == 3) { sOrder = " order by a.date_posted" + sDirection; }
    }
  

  // Build full SQL statement
  
  sSQL = "select a.article_desc as a_article_desc, " +
    "a.article_id as a_article_id, " +
    "a.article_title as a_article_title, " +
    "a.category_id as a_category_id, " +
    "a.date_posted as a_date_posted, " +
    "c.category_id as c_category_id, " +
    "c.category_desc as c_category_desc " +
    " from articles a, categories c" +
    " where c.category_id=a.category_id  ";
  
  sSQL = sSQL + sWhere + sOrder;

  String sNoRecords = "     <tr>\n      <td colspan=\"4\" style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">No records</font></td>\n     </tr>";


  String tableHeader = "";
      tableHeader = "     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a &\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Edit</font></a></td>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a href=\""+sFileName+"?"+formParams+"FormArticles_Sorting=1&FormArticles_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Article</font></a></td>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a href=\""+sFileName+"?"+formParams+"FormArticles_Sorting=2&FormArticles_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Category</font></a></td>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><a href=\""+sFileName+"?"+formParams+"FormArticles_Sorting=3&FormArticles_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Date Posted</font></a></td>\n     </tr>";
  
  
  try {
    out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
    out.println("     <tr>\n      <td style=\"background-color: #990000; text-align: Center; border-style: outset; border-width: 1\" colspan=\"4\"><a name=\"Articles\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">SVEC - Article Administration</font></a></td>\n     </tr>");
    out.println(tableHeader);

  }
  catch (Exception e) {}

  
  try {
    // Select current page
    iPage = Integer.parseInt(getParam( request, "FormArticles_Page"));
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
      String fldarticle_title = (String) rsHash.get("a_article_title");
      String fldcategory_id = (String) rsHash.get("c_category_desc");
      String flddate_posted = (String) rsHash.get("a_date_posted");
      String fldarticle_id= "Edit";

      out.println("     <tr>");
      
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<a href=\"EditArticle.jsp?"+transitParams+"article_id="+toURL((String) rsHash.get("a_article_id"))+"&\"><font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldarticle_id)+"</font></a>");

      out.println("</td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldarticle_title)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldcategory_id)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(flddate_posted)+"&nbsp;</font>");
      out.println("</td>");
      out.println("     </tr>");
    
      iCounter++;
    }
    if (iCounter == 0) {
      // Recordset is empty
      out.println(sNoRecords);
    
      out.print("     <tr>\n      <td colspan=\"4\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
      out.print("<a href=\"EditArticle.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
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
      out.print("\n        <a href=\"EditArticle.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("\n      </td>\n     </tr>");
    
    }
    else {
      out.print("     <tr>\n      <td colspan=\"4\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
    
      out.print("\n       <a href=\"EditArticle.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      bInsert = true;
    
      if ( iPage == 1 ) {
        out.print("\n       <a href_=\"#\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Previous</font></a>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormArticles_Page="+(iPage - 1)+"#Form\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Previous</font></a>");
      }
  
      out.print("\n       [ "+iPage+" ]");
  
      if (!bNext) { 
        out.print("\n       <a href_=\"#\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Next</font></a><br>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormArticles_Page="+(iPage + 1)+"#Form\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Next</font></a><br>");
      }
    
      if ( ! bInsert ) {
        out.print("     <tr>\n      <td colspan=\"4\" style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">");
        out.print("\n        <a href=\"EditArticle.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
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