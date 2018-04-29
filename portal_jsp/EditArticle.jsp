<%@ include file="Common.jsp" %><%!
//
//   Filename: EditArticle.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "EditArticle.jsp";
              
%><%

boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sEditArticleErr = "";

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
if ( sForm.equals("EditArticle") ) {
  sEditArticleErr = EditArticleAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(sEditArticleErr)) return;
}

%>            
<html>
<head>
<title>SVEC - Edit Article</title>
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
<% EditArticle_Show(request, response, session, out, sEditArticleErr, sForm, sAction, conn, stat); %>
    <SCRIPT Language="JavaScript">
if (document.forms["EditArticle"])
document.EditArticle.onsubmit=delconf;
function delconf() {
if (document.EditArticle.FormAction.value == 'delete')
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
<%%>
<%
if ( stat != null ) stat.close();
if ( conn != null ) conn.close();
%>
<%!


  String EditArticleAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String sEditArticleErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "AdminArticles.jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      String pPKarticle_id = "";

      final int iinsertAction = 1;
      final int iupdateAction = 2;
      final int ideleteAction = 3;
      int iAction = 0;

      if ( sAction.equalsIgnoreCase("insert") ) { iAction = iinsertAction; }
      if ( sAction.equalsIgnoreCase("update") ) { iAction = iupdateAction; }
      if ( sAction.equalsIgnoreCase("delete") ) { iAction = ideleteAction; }

      // Create WHERE statement

      if ( iAction == iupdateAction || iAction == ideleteAction ) { 
        pPKarticle_id = getParam( request, "PK_article_id");
        if ( isEmpty(pPKarticle_id)) return sEditArticleErr;
        sWhere = "article_id=" + toSQL(pPKarticle_id, adNumber);
      }


      String fldarticle_title="";
      String fldcategory_id="";
      String fldarticle_desc="";
      String flddate_posted="";
      String flddate_expire="";
      String fldarticle_id="";

      // Load all form fields into variables
    
      fldarticle_title = getParam(request, "article_title");
      fldcategory_id = getParam(request, "category_id");
      fldarticle_desc = getParam(request, "article_desc");
      flddate_posted = getParam(request, "date_posted");
      flddate_expire = getParam(request, "date_expire");
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( isEmpty(fldcategory_id) ) {
          sEditArticleErr = sEditArticleErr + "The value in field Category is required.<br>";
        }
        if ( ! isNumber(fldcategory_id)) {
          sEditArticleErr = sEditArticleErr + "The value in field Category is incorrect.<br>";
        }
        if (sEditArticleErr.length() > 0 ) {
          return (sEditArticleErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into articles (" + 
                "article_title," +
                "category_id," +
                "article_desc," +
                "date_posted," +
                "date_expire)" +

                " values (" + 
                toSQL(fldarticle_title, adText) + "," +
                toSQL(fldcategory_id, adNumber) + "," +
                toSQL(fldarticle_desc, adText) + "," +
                toSQL(flddate_posted, adDate) + "," +
                toSQL(flddate_expire, adText) + ")";
          break;
  
      case iupdateAction:
        
          sSQL = "update articles set " +
                "article_title=" + toSQL(fldarticle_title, adText) +
                ",category_id=" + toSQL(fldcategory_id, adNumber) +
                ",article_desc=" + toSQL(fldarticle_desc, adText) +
                ",date_posted=" + toSQL(flddate_posted, adDate) +
                ",date_expire=" + toSQL(flddate_expire, adText);
          sSQL = sSQL + " where " + sWhere;
        break;
      
      case ideleteAction:
           sSQL = "delete from articles where " + sWhere;
          
        break;
  
      }

      if ( sEditArticleErr.length() > 0 ) return sEditArticleErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
      }
      catch(java.sql.SQLException e) {
        sEditArticleErr = e.toString(); return (sEditArticleErr);
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
    return (sEditArticleErr);
  }

  


  void EditArticle_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sEditArticleErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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
      
      String particle_id = "";

      String flddate_expire="";
      String fldarticle_id="";
      String fldarticle_title="";
      String fldcategory_id="";
      String fldarticle_desc="";
      String flddate_posted="";


      boolean bPK = true;

      if ( "".equals(sEditArticleErr)) {
        // Load primary key and form parameters
        fldarticle_id = getParam( request, "article_id");
        particle_id = getParam( request, "article_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldarticle_id = getParam( request, "article_id");
        fldarticle_title = getParam( request, "article_title");
        fldcategory_id = getParam( request, "category_id");
        fldarticle_desc = getParam( request, "article_desc");
        flddate_posted = getParam( request, "date_posted");
        flddate_expire = getParam( request, "date_expire");
        particle_id = getParam( request, "PK_article_id");
      }

      
      if ( isEmpty(particle_id)) { bPK = false; }
      
      sWhere += "article_id=" + toSQL(particle_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_article_id\" value=\""+particle_id+"\"/>";

      sSQL = "select * from articles where " + sWhere;


      out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
      out.println("     <tr>\n      <td style=\"background-color: #990000; text-align: Center; border-style: outset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">SVEC - Edit Article</font></td>\n     </tr>");
      if ( ! sEditArticleErr.equals("")) {
        out.println("     <tr>\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 10pt; color: #000000\">"+sEditArticleErr+"</font></td>\n     </tr>");
      }
      sEditArticleErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"EditArticle\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "EditArticle".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldarticle_id = (String) rsHash.get("article_id");
        if ( "".equals(sEditArticleErr)) {
          // Load data from recordset when form displayed first time
          fldarticle_title = (String) rsHash.get("article_title");
          fldcategory_id = (String) rsHash.get("category_id");
          fldarticle_desc = (String) rsHash.get("article_desc");
          flddate_posted = (String) rsHash.get("date_posted");
          flddate_expire = (String) rsHash.get("date_expire");
        }

        if (sAction.equals("") || ! "EditArticle".equals(sForm)) {
      
          fldarticle_id = (String) rsHash.get("article_id");
          fldarticle_title = (String) rsHash.get("article_title");
          fldcategory_id = (String) rsHash.get("category_id");
          fldarticle_desc = (String) rsHash.get("article_desc");
          flddate_posted = (String) rsHash.get("date_posted");
          flddate_expire = (String) rsHash.get("date_expire");
        }
        
      }
      else {
        if ( "".equals(sEditArticleErr)) {
          fldarticle_id = toHTML(getParam(request,"article_id"));
        }
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Title</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<textarea name=\"article_title\" cols=\"70\" rows=\"2\">"+toHTML(fldarticle_title)+"</textarea>");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Category</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); 
      out.print("<select name=\"category_id\">"+getOptions( conn, "select category_id, category_desc from categories order by 2",false,true,fldcategory_id)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Description</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<textarea name=\"article_desc\" cols=\"70\" rows=\"8\">"+toHTML(fldarticle_desc)+"</textarea>");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Date Posted</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"date_posted\" maxlength=\"20\" value=\""+toHTML(flddate_posted)+"\" size=\"20\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Expiration Date</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"date_expire\" maxlength=\"20\" value=\""+toHTML(flddate_expire)+"\" size=\"20\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "EditArticle".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.EditArticle.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.EditArticle.FormAction.value = 'delete';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"EditArticle\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Insert\" onclick=\"document.EditArticle.FormAction.value = 'insert';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"EditArticle\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"article_id\" value=\""+toHTML(fldarticle_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>