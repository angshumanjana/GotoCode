<%@ include file="Common.jsp" %><%!
//
//   Filename: AdminEventsRecord.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "AdminEventsRecord.jsp";
              
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
String seventErr = "";

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
if ( sForm.equals("event") ) {
  seventErr = eventAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(seventErr)) return;
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
<% event_Show(request, response, session, out, seventErr, sForm, sAction, conn, stat); %>
    <SCRIPT Language="JavaScript">
document.event.onsubmit=delconf;
function delconf() {
if (document.event.FormAction.value == 'delete')
  return confirm('Delete record?');
}
</SCRIPT>
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


  String eventAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String seventErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "AdminEventsGrid.jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      String pPKevent_id = "";
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
        pPKevent_id = getParam( request, "PK_event_id");
        if ( isEmpty(pPKevent_id)) return seventErr;
        sWhere = "event_id=" + toSQL(pPKevent_id, adNumber);
      }


      String fldname="";
      String fldcategory_id="";
      String fldlocation="";
      String flddate_start="";
      String flddate_end="";
      String fldpresenter="";
      String flddescription="";
      String fldapproved="";
      String fldevent_id="";

      // Load all form fields into variables
    
      fldname = getParam(request, "name");
      fldcategory_id = getParam(request, "category_id");
      fldlocation = getParam(request, "location");
      flddate_start = getParam(request, "date_start");
      flddate_end = getParam(request, "date_end");
      fldpresenter = getParam(request, "presenter");
      flddescription = getParam(request, "description");
      fldapproved = getCheckBoxValue(getParam( request, "approved"), "1", "0", adNumber);
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( isEmpty(fldname) ) {
          seventErr = seventErr + "The value in field Name* is required.<br>";
        }
        if ( isEmpty(fldcategory_id) ) {
          seventErr = seventErr + "The value in field Category* is required.<br>";
        }
        if ( isEmpty(fldlocation) ) {
          seventErr = seventErr + "The value in field Location* is required.<br>";
        }
        if ( isEmpty(flddate_start) ) {
          seventErr = seventErr + "The value in field Date Start* is required.<br>";
        }
        if ( ! isNumber(fldcategory_id)) {
          seventErr = seventErr + "The value in field Category* is incorrect.<br>";
        }
        if (seventErr.length() > 0 ) {
          return (seventErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into events (" + 
                "name," +
                "category_id," +
                "location," +
                "date_start," +
                "date_end," +
                "presenter," +
                "description," +
                "approved)" +

                " values (" + 
                toSQL(fldname, adText) + "," +
                toSQL(fldcategory_id, adNumber) + "," +
                toSQL(fldlocation, adText) + "," +
                toSQL(flddate_start, adText) + "," +
                toSQL(flddate_end, adText) + "," +
                toSQL(fldpresenter, adText) + "," +
                toSQL(flddescription, adText) + "," +
                fldapproved + ")";
          break;
  
      case iupdateAction:
        
          sSQL = "update events set " +
                "name=" + toSQL(fldname, adText) +
                ",category_id=" + toSQL(fldcategory_id, adNumber) +
                ",location=" + toSQL(fldlocation, adText) +
                ",date_start=" + toSQL(flddate_start, adText) +
                ",date_end=" + toSQL(flddate_end, adText) +
                ",presenter=" + toSQL(fldpresenter, adText) +
                ",description=" + toSQL(flddescription, adText) +
                ",approved=" + fldapproved;
          sSQL = sSQL + " where " + sWhere;
        break;
      
      case ideleteAction:
           sSQL = "delete from events where " + sWhere;
          
        break;
  
      }

      if ( seventErr.length() > 0 ) return seventErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
      }
      catch(java.sql.SQLException e) {
        seventErr = e.toString(); return (seventErr);
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
    return (seventErr);
  }

  


  void event_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String seventErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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

      String fldevent_id="";
      String fldname="";
      String fldcategory_id="";
      String fldlocation="";
      String flddate_start="";
      String flddate_end="";
      String fldpresenter="";
      String flddescription="";
      String fldapproved="";


      boolean bPK = true;

      if ( "".equals(seventErr)) {
        // Load primary key and form parameters
        pevent_id = getParam( request, "event_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldevent_id = getParam( request, "event_id");
        fldname = getParam( request, "name");
        fldcategory_id = getParam( request, "category_id");
        fldlocation = getParam( request, "location");
        flddate_start = getParam( request, "date_start");
        flddate_end = getParam( request, "date_end");
        fldpresenter = getParam( request, "presenter");
        flddescription = getParam( request, "description");
        fldapproved = getParam( request, "approved");
        pevent_id = getParam( request, "PK_event_id");
      }

      
      if ( isEmpty(pevent_id)) { bPK = false; }
      
      sWhere += "event_id=" + toSQL(pevent_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_event_id\" value=\""+pevent_id+"\"/>";

      sSQL = "select * from events where " + sWhere;


      out.println("    <table border=\"0\" cellspacing=\"1\" cellpadding=\"2\">");
      out.println("     <tr>\n      <td align=\"center\" bgcolor=\"#0033CC\" colspan=\"2\"><font style=\"font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Event</font></td>\n     </tr>");
      if ( ! seventErr.equals("")) {
        out.println("     <tr>\n      <td  colspan=\"2\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+seventErr+"</font></td>\n     </tr>");
      }
      seventErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"event\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "event".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldevent_id = (String) rsHash.get("event_id");
        if ( "".equals(seventErr)) {
          // Load data from recordset when form displayed first time
          fldname = (String) rsHash.get("name");
          fldcategory_id = (String) rsHash.get("category_id");
          fldlocation = (String) rsHash.get("location");
          flddate_start = (String) rsHash.get("date_start");
          flddate_end = (String) rsHash.get("date_end");
          fldpresenter = (String) rsHash.get("presenter");
          flddescription = (String) rsHash.get("description");
          fldapproved = (String) rsHash.get("approved");
        }

        if (sAction.equals("") || ! "event".equals(sForm)) {
      
          fldevent_id = (String) rsHash.get("event_id");
          fldname = (String) rsHash.get("name");
          fldcategory_id = (String) rsHash.get("category_id");
          fldlocation = (String) rsHash.get("location");
          flddate_start = (String) rsHash.get("date_start");
          flddate_end = (String) rsHash.get("date_end");
          fldpresenter = (String) rsHash.get("presenter");
          flddescription = (String) rsHash.get("description");
          fldapproved = (String) rsHash.get("approved");
        }
        
      }
      else {
flddate_start= new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new java.util.Date());
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Name*</font></td><td >"); out.print("<input type=\"text\"  name=\"name\" maxlength=\"50\" value=\""+toHTML(fldname)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Category*</font></td><td >"); 
      out.print("<select name=\"category_id\">"+getOptions( conn, "select category_id, category_desc from categories order by 2",false,true,fldcategory_id)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Location*</font></td><td >"); out.print("<textarea name=\"location\" cols=\"50\" rows=\"3\">"+toHTML(fldlocation)+"</textarea>");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Date Start*</font></td><td >"); out.print("<input type=\"text\"  name=\"date_start\" maxlength=\"20\" value=\""+toHTML(flddate_start)+"\" size=\"20\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Date End</font></td><td >"); out.print("<input type=\"text\"  name=\"date_end\" maxlength=\"15\" value=\""+toHTML(flddate_end)+"\" size=\"15\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Presenter</font></td><td >"); out.print("<input type=\"text\"  name=\"presenter\" maxlength=\"50\" value=\""+toHTML(fldpresenter)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Description</font></td><td >"); out.print("<textarea name=\"description\" cols=\"50\" rows=\"5\">"+toHTML(flddescription)+"</textarea>");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#0066FF\"><font style=\"font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica\">Approved</font></td><td >"); 
      if ( fldapproved.equalsIgnoreCase("1") ) {
        out.print("<input checked type=\"checkbox\" name=\"approved\" value=\"1\">");
      }
      else {
        out.print("<input type=\"checkbox\" name=\"approved\" value=\"1\">");
      }
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "event".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.event.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.event.FormAction.value = 'delete';\">");out.print("<input type=\"submit\" value=\"Cancel\" onclick=\"document.event.FormAction.value = 'cancel';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"event\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Insert\" onclick=\"document.event.FormAction.value = 'insert';\">");out.print("<input type=\"submit\" value=\"Cancel\" onclick=\"document.event.FormAction.value = 'cancel';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"event\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"event_id\" value=\""+toHTML(fldevent_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>