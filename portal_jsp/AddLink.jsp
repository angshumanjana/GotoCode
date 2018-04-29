<%@ include file="Common.jsp" %><%!
//
//   Filename: AddLink.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "AddLink.jsp";
              
%><%

String cSec = checkSecurity(1, session, response, request);
if ("sendRedirect".equals(cSec) ) return;
                
boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
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
if ( sForm.equals("Links") ) {
  sLinksErr = LinksAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(sLinksErr)) return;
}

%>            
<html>
<head>
<title>SVEC - Add Link</title>
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


  String LinksAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String sLinksErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "AddLink.jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      String pPKlink_id = "";

      final int iinsertAction = 1;
      final int iupdateAction = 2;
      final int ideleteAction = 3;
      int iAction = 0;

      if ( sAction.equalsIgnoreCase("insert") ) { iAction = iinsertAction; }
      if ( sAction.equalsIgnoreCase("update") ) { iAction = iupdateAction; }
      if ( sAction.equalsIgnoreCase("delete") ) { iAction = ideleteAction; }

      // Create WHERE statement


      String fldUserID="";
      String fldlink_name="";
      String fldlink_desc="";
      String fldaddress="";
      String fldlink_url="";
      String fldcategory_id="";
      String flddate_added="";
      String fldlink_id="";

      // Load all form fields into variables
    
      fldUserID = (String) session.getAttribute("UserID");
      fldlink_name = getParam(request, "link_name");
      fldlink_desc = getParam(request, "link_desc");
      fldaddress = getParam(request, "address");
      fldlink_url = getParam(request, "link_url");
      fldcategory_id = getParam(request, "category_id");
      flddate_added = getParam(request, "date_added");
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( isEmpty(fldcategory_id) ) {
          sLinksErr = sLinksErr + "The value in field Category is required.<br>";
        }
        if ( ! isNumber(fldcategory_id)) {
          sLinksErr = sLinksErr + "The value in field Category is incorrect.<br>";
        }
        if (sLinksErr.length() > 0 ) {
          return (sLinksErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into links (" + 
                "added_by," + 
                "link_name," +
                "link_desc," +
                "address," +
                "link_url," +
                "category_id," +
                "date_added)" +

                " values (" + 
                toSQL(fldUserID, adNumber) + "," +
                toSQL(fldlink_name, adText) + "," +
                toSQL(fldlink_desc, adText) + "," +
                toSQL(fldaddress, adText) + "," +
                toSQL(fldlink_url, adText) + "," +
                toSQL(fldcategory_id, adNumber) + "," +
                toSQL(flddate_added, adDate) + ")";
          break;
  
      }

      if ( sLinksErr.length() > 0 ) return sLinksErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
      }
      catch(java.sql.SQLException e) {
        sLinksErr = e.toString(); return (sLinksErr);
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
    return (sLinksErr);
  }

  


  void Links_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sLinksErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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
      
      String plink_id = "";

      String fldUserID="";
      String fldlink_id="";
      String fldlink_name="";
      String fldlink_desc="";
      String fldaddress="";
      String fldlink_url="";
      String fldcategory_id="";
      String flddate_added="";


      boolean bPK = true;

      if ( "".equals(sLinksErr)) {
        // Load primary key and form parameters
        plink_id = getParam( request, "link_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldlink_id = getParam( request, "link_id");
        fldlink_name = getParam( request, "link_name");
        fldlink_desc = getParam( request, "link_desc");
        fldaddress = getParam( request, "address");
        fldlink_url = getParam( request, "link_url");
        fldcategory_id = getParam( request, "category_id");
        flddate_added = getParam( request, "date_added");
        plink_id = getParam( request, "PK_link_id");
      }

      
      if ( isEmpty(plink_id)) { bPK = false; }
      
      sWhere += "link_id=" + toSQL(plink_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_link_id\" value=\""+plink_id+"\"/>";

      sSQL = "select * from links where " + sWhere;


      out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
      out.println("     <tr>\n      <td style=\"background-color: #990000; text-align: Center; border-style: outset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">SVEC - Add Link</font></td>\n     </tr>");
      if ( ! sLinksErr.equals("")) {
        out.println("     <tr>\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 10pt; color: #000000\">"+sLinksErr+"</font></td>\n     </tr>");
      }
      sLinksErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"Links\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "Links".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldlink_id = (String) rsHash.get("link_id");
        if ( "".equals(sLinksErr)) {
          // Load data from recordset when form displayed first time
          fldlink_name = (String) rsHash.get("link_name");
          fldlink_desc = (String) rsHash.get("link_desc");
          fldaddress = (String) rsHash.get("address");
          fldlink_url = (String) rsHash.get("link_url");
          fldcategory_id = (String) rsHash.get("category_id");
          flddate_added = (String) rsHash.get("date_added");
        }

        if (sAction.equals("") || ! "Links".equals(sForm)) {
      
          fldlink_id = (String) rsHash.get("link_id");
          fldlink_name = (String) rsHash.get("link_name");
          fldlink_desc = (String) rsHash.get("link_desc");
          fldaddress = (String) rsHash.get("address");
          fldlink_url = (String) rsHash.get("link_url");
          fldcategory_id = (String) rsHash.get("category_id");
          flddate_added = (String) rsHash.get("date_added");
        }
        
      }
      else {
flddate_added= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Link Name</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"link_name\" maxlength=\"50\" value=\""+toHTML(fldlink_name)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Link Description</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"link_desc\" maxlength=\"50\" value=\""+toHTML(fldlink_desc)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Street Address</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<textarea name=\"address\" cols=\"50\" rows=\"2\">"+toHTML(fldaddress)+"</textarea>");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">URL</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"link_url\" maxlength=\"50\" value=\""+toHTML(fldlink_url)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Category</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); 
      out.print("<select name=\"category_id\">"+getOptions( conn, "select category_id, category_desc from categories order by 2",false,true,fldcategory_id)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Date Added</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"date_added\" maxlength=\"20\" value=\""+toHTML(flddate_added)+"\" size=\"20\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "Links".equals(sForm))) {
        
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"Links\"><input type=\"hidden\" value=\"\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Insert\" onclick=\"document.Links.FormAction.value = 'insert';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"Links\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"link_id\" value=\""+toHTML(fldlink_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>