<%@ include file="Common.jsp" %><%!
//
//   Filename: AdminCategoriesRecord.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "AdminCategoriesRecord.jsp";
              
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
String scategoriesErr = "";

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
if ( sForm.equals("categories") ) {
  scategoriesErr = categoriesAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(scategoriesErr)) return;
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
<% categories_Show(request, response, session, out, scategoriesErr, sForm, sAction, conn, stat); %>
    
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


  String categoriesAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String scategoriesErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "AdminCategoriesGrid.jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      String pPKcategory_id = "";
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
        pPKcategory_id = getParam( request, "PK_category_id");
        if ( isEmpty(pPKcategory_id)) return scategoriesErr;
        sWhere = "category_id=" + toSQL(pPKcategory_id, adNumber);
      }


      String fldcategory_desc="";
      String fldcategory_id="";

      // Load all form fields into variables
    
      fldcategory_desc = getParam(request, "category_desc");
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if (scategoriesErr.length() > 0 ) {
          return (scategoriesErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into categories (" + 
                "category_desc)" +

                " values (" + 
                toSQL(fldcategory_desc, adText) + ")";
          break;
  
      case iupdateAction:
        
          sSQL = "update categories set " +
                "category_desc=" + toSQL(fldcategory_desc, adText);
          sSQL = sSQL + " where " + sWhere;
        break;
      
      case ideleteAction:
           sSQL = "delete from categories where " + sWhere;
          
        break;
  
      }

      if ( scategoriesErr.length() > 0 ) return scategoriesErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
      }
      catch(java.sql.SQLException e) {
        scategoriesErr = e.toString(); return (scategoriesErr);
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
    return (scategoriesErr);
  }

  


  void categories_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String scategoriesErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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
      
      String pcategory_id = "";

      String fldcategory_id="";
      String fldcategory_desc="";


      boolean bPK = true;

      if ( "".equals(scategoriesErr)) {
        // Load primary key and form parameters
        fldcategory_id = getParam( request, "category_id");
        pcategory_id = getParam( request, "category_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldcategory_id = getParam( request, "category_id");
        fldcategory_desc = getParam( request, "category_desc");
        pcategory_id = getParam( request, "PK_category_id");
      }

      
      if ( isEmpty(pcategory_id)) { bPK = false; }
      
      sWhere += "category_id=" + toSQL(pcategory_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_category_id\" value=\""+pcategory_id+"\"/>";

      sSQL = "select * from categories where " + sWhere;


      out.println("    <table border=\"0\" cellspacing=\"1\" cellpadding=\"2\">");
      out.println("     <tr>\n      <td align=\"center\" bgcolor=\"#0033CC\" colspan=\"2\"><font style=\"font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Category</font></td>\n     </tr>");
      if ( ! scategoriesErr.equals("")) {
        out.println("     <tr>\n      <td  colspan=\"2\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+scategoriesErr+"</font></td>\n     </tr>");
      }
      scategoriesErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"categories\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "categories".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldcategory_id = (String) rsHash.get("category_id");
        if ( "".equals(scategoriesErr)) {
          // Load data from recordset when form displayed first time
          fldcategory_desc = (String) rsHash.get("category_desc");
        }

        if (sAction.equals("") || ! "categories".equals(sForm)) {
      
          fldcategory_id = (String) rsHash.get("category_id");
          fldcategory_desc = (String) rsHash.get("category_desc");
        }
        
      }
      else {
        if ( "".equals(scategoriesErr)) {
          fldcategory_id = toHTML(getParam(request,"category_id"));
        }
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Name</font></td><td >"); out.print("<input type=\"text\"  name=\"category_desc\" maxlength=\"50\" value=\""+toHTML(fldcategory_desc)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "categories".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.categories.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.categories.FormAction.value = 'delete';\">");out.print("<input type=\"submit\" value=\"Cancel\" onclick=\"document.categories.FormAction.value = 'cancel';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"categories\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Insert\" onclick=\"document.categories.FormAction.value = 'insert';\">");out.print("<input type=\"submit\" value=\"Cancel\" onclick=\"document.categories.FormAction.value = 'cancel';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"categories\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"category_id\" value=\""+toHTML(fldcategory_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>