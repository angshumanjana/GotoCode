<%@ include file="Common.jsp" %><%!
//
//   Filename: EditNews.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "EditNews.jsp";
              
%><%

boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sEditNewsErr = "";

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
if ( sForm.equals("EditNews") ) {
  sEditNewsErr = EditNewsAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(sEditNewsErr)) return;
}

%>            
<html>
<head>
<title>SVEC - Edit News</title>
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
<% EditNews_Show(request, response, session, out, sEditNewsErr, sForm, sAction, conn, stat); %>
    <SCRIPT Language="JavaScript">
if (document.forms["EditNews"])
document.EditNews.onsubmit=delconf;
function delconf() {
if (document.EditNews.FormAction.value == 'delete')
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


  String EditNewsAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String sEditNewsErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "AdminNews.jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      String pPKnews_id = "";

      final int iinsertAction = 1;
      final int iupdateAction = 2;
      final int ideleteAction = 3;
      int iAction = 0;

      if ( sAction.equalsIgnoreCase("insert") ) { iAction = iinsertAction; }
      if ( sAction.equalsIgnoreCase("update") ) { iAction = iupdateAction; }
      if ( sAction.equalsIgnoreCase("delete") ) { iAction = ideleteAction; }

      // Create WHERE statement

      if ( iAction == iupdateAction || iAction == ideleteAction ) { 
        pPKnews_id = getParam( request, "PK_news_id");
        if ( isEmpty(pPKnews_id)) return sEditNewsErr;
        sWhere = "news_id=" + toSQL(pPKnews_id, adNumber);
      }


      String fldnews_html="";
      String fldnews_id="";

      // Load all form fields into variables
    
      fldnews_html = getParam(request, "news_html");
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if (sEditNewsErr.length() > 0 ) {
          return (sEditNewsErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into news (" + 
                "news_html)" +

                " values (" + 
                toSQL(fldnews_html, adText) + ")";
          break;
  
      case iupdateAction:
        
          sSQL = "update news set " +
                "news_html=" + toSQL(fldnews_html, adText);
          sSQL = sSQL + " where " + sWhere;
        break;
      
      case ideleteAction:
           sSQL = "delete from news where " + sWhere;
          
        break;
  
      }

      if ( sEditNewsErr.length() > 0 ) return sEditNewsErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
      }
      catch(java.sql.SQLException e) {
        sEditNewsErr = e.toString(); return (sEditNewsErr);
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
    return (sEditNewsErr);
  }

  


  void EditNews_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sEditNewsErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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
      
      String pnews_id = "";

      String fldnews_id="";
      String fldnews_html="";


      boolean bPK = true;

      if ( "".equals(sEditNewsErr)) {
        // Load primary key and form parameters
        fldnews_id = getParam( request, "news_id");
        pnews_id = getParam( request, "news_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldnews_id = getParam( request, "news_id");
        fldnews_html = getParam( request, "news_html");
        pnews_id = getParam( request, "PK_news_id");
      }

      
      if ( isEmpty(pnews_id)) { bPK = false; }
      
      sWhere += "news_id=" + toSQL(pnews_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_news_id\" value=\""+pnews_id+"\"/>";

      sSQL = "select * from news where " + sWhere;


      out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
      out.println("     <tr>\n      <td style=\"background-color: #990000; text-align: Center; border-style: outset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">SVEC - Edit News</font></td>\n     </tr>");
      if ( ! sEditNewsErr.equals("")) {
        out.println("     <tr>\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 10pt; color: #000000\">"+sEditNewsErr+"</font></td>\n     </tr>");
      }
      sEditNewsErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"EditNews\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "EditNews".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldnews_id = (String) rsHash.get("news_id");
        if ( "".equals(sEditNewsErr)) {
          // Load data from recordset when form displayed first time
          fldnews_html = (String) rsHash.get("news_html");
        }

        if (sAction.equals("") || ! "EditNews".equals(sForm)) {
      
          fldnews_id = (String) rsHash.get("news_id");
          fldnews_html = (String) rsHash.get("news_html");
        }
        
      }
      else {
        if ( "".equals(sEditNewsErr)) {
          fldnews_id = toHTML(getParam(request,"news_id"));
        }
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">News</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<textarea name=\"news_html\" cols=\"80\" rows=\"16\">"+toHTML(fldnews_html)+"</textarea>");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "EditNews".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.EditNews.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.EditNews.FormAction.value = 'delete';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"EditNews\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Insert\" onclick=\"document.EditNews.FormAction.value = 'insert';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"EditNews\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"news_id\" value=\""+toHTML(fldnews_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>