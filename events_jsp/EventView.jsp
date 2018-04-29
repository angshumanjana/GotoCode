<%@ include file="Common.jsp" %><%!
//
//   Filename: EventView.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "EventView.jsp";
              
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

boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sViewErr = "";

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
if ( sForm.equals("View") ) {
  sViewErr = ViewAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(sViewErr)) return;
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
<% View_Show(request, response, session, out, sViewErr, sForm, sAction, conn, stat); %>
    
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


  String ViewAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String sViewErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = ".jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      String pPKevent_id = "";

      final int iinsertAction = 1;
      final int iupdateAction = 2;
      final int ideleteAction = 3;
      int iAction = 0;

      if ( sAction.equalsIgnoreCase("insert") ) { iAction = iinsertAction; }
      if ( sAction.equalsIgnoreCase("update") ) { iAction = iupdateAction; }
      if ( sAction.equalsIgnoreCase("delete") ) { iAction = ideleteAction; }

      // Create WHERE statement


      String fldevent_id="";
      String fldcategory_id="";

      // Load all form fields into variables
    

      sSQL = "";
      // Create SQL statement

      if ( sViewErr.length() > 0 ) return sViewErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
      }
      catch(java.sql.SQLException e) {
        sViewErr = e.toString(); return (sViewErr);
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
    return (sViewErr);
  }

  


  void View_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sViewErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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
      
      String pevent_id = "";

      String fldcategory_id="";
      String fldevent_id="";
      String fldname="";
      String fldlocation="";
      String flddate_start="";
      String flddate_end="";
      String fldpresenter="";
      String flddescription="";


      boolean bPK = true;

      if ( "".equals(sViewErr)) {
        // Load primary key and form parameters
        pevent_id = getParam( request, "event_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldevent_id = getParam( request, "event_id");
        pevent_id = getParam( request, "PK_event_id");
      }

      
      if ( isEmpty(pevent_id)) { bPK = false; }
      
      sWhere += "event_id=" + toSQL(pevent_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_event_id\" value=\""+pevent_id+"\"/>";

      sSQL = "select * from events where " + sWhere;


      out.println("    <table border=\"0\" cellspacing=\"1\" cellpadding=\"2\">");
      out.println("     <tr>\n      <td align=\"center\" bgcolor=\"#0033CC\" colspan=\"2\"><font style=\"font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Event</font></td>\n     </tr>");
      if ( ! sViewErr.equals("")) {
        out.println("     <tr>\n      <td  colspan=\"2\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+sViewErr+"</font></td>\n     </tr>");
      }
      sViewErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"View\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "View".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldevent_id = (String) rsHash.get("event_id");
        fldname = (String) rsHash.get("name");
        fldcategory_id = (String) rsHash.get("category_id");
        fldlocation = (String) rsHash.get("location");
        flddate_start = (String) rsHash.get("date_start");
        flddate_end = (String) rsHash.get("date_end");
        fldpresenter = (String) rsHash.get("presenter");
        flddescription = (String) rsHash.get("description");

        if (sAction.equals("") || ! "View".equals(sForm)) {
      
          fldevent_id = (String) rsHash.get("event_id");
          fldname = (String) rsHash.get("name");
          fldcategory_id = (String) rsHash.get("category_id");
          fldlocation = (String) rsHash.get("location");
          flddate_start = (String) rsHash.get("date_start");
          flddate_end = (String) rsHash.get("date_end");
          fldpresenter = (String) rsHash.get("presenter");
          flddescription = (String) rsHash.get("description");
        }
        else {
          fldevent_id = (String) rsHash.get("event_id");
          fldname = (String) rsHash.get("name");
          fldcategory_id = (String) rsHash.get("category_id");
          fldlocation = (String) rsHash.get("location");
          flddate_start = (String) rsHash.get("date_start");
          flddate_end = (String) rsHash.get("date_end");
          fldpresenter = (String) rsHash.get("presenter");
          flddescription = (String) rsHash.get("description");
        }
        
      }
      else {
      }
      
      // Set lookup fields
          fldcategory_id = dLookUp( stat, "categories", "category_desc", "category_id=" + toSQL(fldcategory_id, adNumber));


      // Show form field
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Name</font></td><td >"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldname)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Category</font></td><td >"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldcategory_id)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Location</font></td><td >"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldlocation)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Date Start</font></td><td >"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(flddate_start)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Date End</font></td><td >"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(flddate_end)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Presenter</font></td><td >"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldpresenter)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Description</font></td><td >"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(flddescription)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "View".equals(sForm))) {
        
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"View\"><input type=\"hidden\" value=\"\" name=\"FormAction\">");
      }
      out.print("<input type=\"hidden\" name=\"event_id\" value=\""+toHTML(fldevent_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>