<%@ include file="Common.jsp" %><%!
//
//   Filename: EditLink.jsp
//   Generated with CodeCharge  v.1.1.19
//   JSP.ccp build 04/20/2001
//

static final String sFileName = "EditLink.jsp";
              
%><%

boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String slinksErr = "";

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
if ( sForm.equals("links") ) {
  slinksErr = linksAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(slinksErr)) return;
}

%>            
<html>
<head>
<title>SVEC - Silicon Valley Engineers Club</title>
<meta name="GENERATOR" content="YesSoftware CodeCharge v.1.1.19 / JSP.ccp build 04/20/2001"/>
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
<% links_Show(request, response, session, out, slinksErr, sForm, sAction, conn, stat); %>
    <SCRIPT Language="JavaScript">
if (document.forms["links"])
document.links.onsubmit=delconf;
function delconf() {
if (document.links.FormAction.value == 'delete')
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

<%
if ( stat != null ) stat.close();
if ( conn != null ) conn.close();
%>
<%!


  String linksAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String slinksErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "AdminLinks.jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      String pPKlink_id = "";
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
        pPKlink_id = getParam( request, "PK_link_id");
        if ( isEmpty(pPKlink_id)) return slinksErr;
        sWhere = "link_id=" + toSQL(pPKlink_id, adNumber);
      }


      String fldUserID="";
      String fldlink_name="";
      String fldlink_url="";
      String flddate_added="";
      String fldaddress="";
      String fldapproved="";
      String fldapproved_by="";
      String fldcategory_id="";
      String flddate_approved="";
      String fldlink_desc="";
      String fldlink_id="";
      String fldadded_by="";

      // Load all form fields into variables
    
      fldUserID = (String) session.getAttribute("UserID");
      fldlink_name = getParam(request, "link_name");
      fldlink_url = getParam(request, "link_url");
      flddate_added = getParam(request, "date_added");
      fldaddress = getParam(request, "address");
      fldapproved = getCheckBoxValue(getParam( request, "approved"), "1", "0", adNumber);
      fldapproved_by = getParam(request, "approved_by");
      fldcategory_id = getParam(request, "category_id");
      flddate_approved = getParam(request, "date_approved");
      fldlink_desc = getParam(request, "link_desc");
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( isEmpty(fldlink_name) ) {
          slinksErr = slinksErr + "The value in field Name is required.<br>";
        }
        if ( isEmpty(fldlink_url) ) {
          slinksErr = slinksErr + "The value in field URL is required.<br>";
        }
        if ( isEmpty(fldcategory_id) ) {
          slinksErr = slinksErr + "The value in field Category is required.<br>";
        }
        if ( ! isNumber(fldapproved_by)) {
          slinksErr = slinksErr + "The value in field Approved By is incorrect.<br>";
        }
        if ( ! isNumber(fldcategory_id)) {
          slinksErr = slinksErr + "The value in field Category is incorrect.<br>";
        }
        if (slinksErr.length() > 0 ) {
          return (slinksErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into links (" + 
                "added_by," + 
                "link_name," +
                "link_url," +
                "date_added," +
                "address," +
                "approved," +
                "approved_by," +
                "category_id," +
                "date_approved," +
                "link_desc)" +

                " values (" + 
                toSQL(fldUserID, adNumber) + "," +
                toSQL(fldlink_name, adText) + "," +
                toSQL(fldlink_url, adText) + "," +
                toSQL(flddate_added, adDate) + "," +
                toSQL(fldaddress, adText) + "," +
                fldapproved + "," +
                toSQL(fldapproved_by, adNumber) + "," +
                toSQL(fldcategory_id, adNumber) + "," +
                toSQL(flddate_approved, adDate) + "," +
                toSQL(fldlink_desc, adText) + ")";
          break;
  
      case iupdateAction:
        
          sSQL = "update links set " +
                "link_name=" + toSQL(fldlink_name, adText) +
                ",link_url=" + toSQL(fldlink_url, adText) +
                ",date_added=" + toSQL(flddate_added, adDate) +
                ",address=" + toSQL(fldaddress, adText) +
                ",approved=" + fldapproved +
                ",approved_by=" + toSQL(fldapproved_by, adNumber) +
                ",category_id=" + toSQL(fldcategory_id, adNumber) +
                ",date_approved=" + toSQL(flddate_approved, adDate) +
                ",link_desc=" + toSQL(fldlink_desc, adText);
          sSQL = sSQL + " where " + sWhere;
        break;
      
      case ideleteAction:
           sSQL = "delete from links where " + sWhere;
          
        break;
  
      }

      if ( slinksErr.length() > 0 ) return slinksErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
        
      }
      catch(java.sql.SQLException e) {
        slinksErr = e.toString(); return (slinksErr);
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
    return (slinksErr);
  }

  


  void links_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String slinksErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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

      String fldadded_by="";
      String fldlink_id="";
      String fldUserID="";
      String fldlink_name="";
      String fldlink_url="";
      String flddate_added="";
      String fldaddress="";
      String fldapproved="";
      String fldapproved_by="";
      String fldcategory_id="";
      String flddate_approved="";
      String fldlink_desc="";


      boolean bPK = true;

      if ( "".equals(slinksErr)) {
        // Load primary key and form parameters
        fldlink_id = getParam( request, "link_id");
        plink_id = getParam( request, "link_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldlink_id = getParam( request, "link_id");
        fldlink_name = getParam( request, "link_name");
        fldlink_url = getParam( request, "link_url");
        flddate_added = getParam( request, "date_added");
        fldaddress = getParam( request, "address");
        fldapproved = getParam( request, "approved");
        fldapproved_by = getParam( request, "approved_by");
        fldcategory_id = getParam( request, "category_id");
        flddate_approved = getParam( request, "date_approved");
        fldlink_desc = getParam( request, "link_desc");
        plink_id = getParam( request, "PK_link_id");
        fldadded_by = (String) session.getAttribute("UserID");
      }

      
      if ( isEmpty(plink_id)) { bPK = false; }
      
      sWhere += "link_id=" + toSQL(plink_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_link_id\" value=\""+plink_id+"\"/>";

      sSQL = "select * from links where " + sWhere;


      out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
      out.println("     <tr>\n      <td style=\"background-color: #990000; text-align: Center; border-style: outset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">links</font></td>\n     </tr>");
      if ( ! slinksErr.equals("")) {
        out.println("     <tr>\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 10pt; color: #000000\">"+slinksErr+"</font></td>\n     </tr>");
      }
      slinksErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"links\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "links".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldlink_id = (String) rsHash.get("link_id");
        fldadded_by = (String) rsHash.get("added_by");
        if ( "".equals(slinksErr)) {
          // Load data from recordset when form displayed first time
          fldlink_name = (String) rsHash.get("link_name");
          fldlink_url = (String) rsHash.get("link_url");
          flddate_added = (String) rsHash.get("date_added");
          fldaddress = (String) rsHash.get("address");
          fldapproved = (String) rsHash.get("approved");
          fldapproved_by = (String) rsHash.get("approved_by");
          fldcategory_id = (String) rsHash.get("category_id");
          flddate_approved = (String) rsHash.get("date_approved");
          fldlink_desc = (String) rsHash.get("link_desc");
        }

        if (sAction.equals("") || ! "links".equals(sForm)) {
      
          fldlink_id = (String) rsHash.get("link_id");
          fldlink_name = (String) rsHash.get("link_name");
          fldlink_url = (String) rsHash.get("link_url");
          flddate_added = (String) rsHash.get("date_added");
          fldaddress = (String) rsHash.get("address");
          fldapproved = (String) rsHash.get("approved");
          fldadded_by = (String) rsHash.get("added_by");
          fldapproved_by = (String) rsHash.get("approved_by");
          fldcategory_id = (String) rsHash.get("category_id");
          flddate_approved = (String) rsHash.get("date_approved");
          fldlink_desc = (String) rsHash.get("link_desc");
        }
        else {
          fldlink_id = (String) rsHash.get("link_id");
          fldadded_by = (String) rsHash.get("added_by");
        }
        
      }
      else {
        if ( "".equals(slinksErr)) {
          fldlink_id = toHTML(getParam(request,"link_id"));
          fldadded_by = toHTML((String) session.getAttribute("UserID"));
        }
flddate_added= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
      }
      
      // Set lookup fields
          fldadded_by = dLookUp( stat, "members", "member_login", "member_id=" + toSQL(fldadded_by, adNumber));


      // Show form field
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Name</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"link_name\" maxlength=\"50\" value=\""+toHTML(fldlink_name)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">URL</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"link_url\" maxlength=\"50\" value=\""+toHTML(fldlink_url)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Date Added</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"date_added\" maxlength=\"10\" value=\""+toHTML(flddate_added)+"\" size=\"10\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Address</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"address\" maxlength=\"50\" value=\""+toHTML(fldaddress)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Approved</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); 
      if ( fldapproved.equalsIgnoreCase("1") ) {
        out.print("<input checked type=\"checkbox\" name=\"approved\" value=\"1\">");
      }
      else {
        out.print("<input type=\"checkbox\" name=\"approved\" value=\"1\">");
      }
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Added By</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldadded_by)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Approved By</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); 
      out.print("<select name=\"approved_by\">"+getOptions( conn, "select member_id, member_login from members order by 2",false,false,fldapproved_by)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Category</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); 
      out.print("<select name=\"category_id\">"+getOptions( conn, "select category_id, category_desc from categories order by 2",false,true,fldcategory_id)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Date Approved</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"date_approved\" maxlength=\"10\" value=\""+toHTML(flddate_approved)+"\" size=\"10\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Description</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<textarea name=\"link_desc\" cols=\"50\" rows=\"3\">"+toHTML(fldlink_desc)+"</textarea>");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "links".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.links.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.links.FormAction.value = 'delete';\">");out.print("<input type=\"submit\" value=\"Cancel\" onclick=\"document.links.FormAction.value = 'cancel';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"links\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Insert\" onclick=\"document.links.FormAction.value = 'insert';\">");out.print("<input type=\"submit\" value=\"Cancel\" onclick=\"document.links.FormAction.value = 'cancel';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"links\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"link_id\" value=\""+toHTML(fldlink_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %><%
stat.close();
conn.close();
%>