<%@ include file="Common.jsp" %><%!
//
//   Filename: EditEvent.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "EditEvent.jsp";
              
%><%

boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sEditEventErr = "";

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
if ( sForm.equals("EditEvent") ) {
  sEditEventErr = EditEventAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(sEditEventErr)) return;
}

%>            
<html>
<head>
<title>SVEC - Edit Event</title>
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
<% EditEvent_Show(request, response, session, out, sEditEventErr, sForm, sAction, conn, stat); %>
    <SCRIPT Language="JavaScript">
if (document.forms["EditEvent"])
document.EditEvent.onsubmit=delconf;
function delconf() {
if (document.EditEvent.FormAction.value == 'delete')
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


  String EditEventAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String sEditEventErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "AdminEvents.jsp";
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

      if ( iAction == iupdateAction || iAction == ideleteAction ) { 
        pPKevent_id = getParam( request, "PK_event_id");
        if ( isEmpty(pPKevent_id)) return sEditEventErr;
        sWhere = "event_id=" + toSQL(pPKevent_id, adNumber);
      }


      String flddate_start="";
      String fldevent_name="";
      String fldevent_desc="";
      String fldlocation="";
      String fldpresenter="";
      String flduser_added="";
      String fldevent_id="";

      // Load all form fields into variables
    
      flddate_start = getParam(request, "date_start");
      fldevent_name = getParam(request, "event_name");
      fldevent_desc = getParam(request, "event_desc");
      fldlocation = getParam(request, "location");
      fldpresenter = getParam(request, "presenter");
      flduser_added = getParam(request, "user_added");
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( ! isNumber(flduser_added)) {
          sEditEventErr = sEditEventErr + "The value in field User Added is incorrect.<br>";
        }
        if (sEditEventErr.length() > 0 ) {
          return (sEditEventErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into events (" + 
                "date_start," +
                "event_name," +
                "event_desc," +
                "location," +
                "presenter," +
                "user_added)" +

                " values (" + 
                toSQL(flddate_start, adText) + "," +
                toSQL(fldevent_name, adText) + "," +
                toSQL(fldevent_desc, adText) + "," +
                toSQL(fldlocation, adText) + "," +
                toSQL(fldpresenter, adText) + "," +
                toSQL(flduser_added, adNumber) + ")";
          break;
  
      case iupdateAction:
        
          sSQL = "update events set " +
                "date_start=" + toSQL(flddate_start, adText) +
                ",event_name=" + toSQL(fldevent_name, adText) +
                ",event_desc=" + toSQL(fldevent_desc, adText) +
                ",location=" + toSQL(fldlocation, adText) +
                ",presenter=" + toSQL(fldpresenter, adText) +
                ",user_added=" + toSQL(flduser_added, adNumber);
          sSQL = sSQL + " where " + sWhere;
        break;
      
      case ideleteAction:
           sSQL = "delete from events where " + sWhere;
          
        break;
  
      }

      if ( sEditEventErr.length() > 0 ) return sEditEventErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
      }
      catch(java.sql.SQLException e) {
        sEditEventErr = e.toString(); return (sEditEventErr);
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
    return (sEditEventErr);
  }

  


  void EditEvent_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sEditEventErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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
      String flddate_start="";
      String fldevent_name="";
      String fldevent_desc="";
      String fldlocation="";
      String fldpresenter="";
      String flduser_added="";


      boolean bPK = true;

      if ( "".equals(sEditEventErr)) {
        // Load primary key and form parameters
        fldevent_id = getParam( request, "event_id");
        pevent_id = getParam( request, "event_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldevent_id = getParam( request, "event_id");
        flddate_start = getParam( request, "date_start");
        fldevent_name = getParam( request, "event_name");
        fldevent_desc = getParam( request, "event_desc");
        fldlocation = getParam( request, "location");
        fldpresenter = getParam( request, "presenter");
        flduser_added = getParam( request, "user_added");
        pevent_id = getParam( request, "PK_event_id");
      }

      
      if ( isEmpty(pevent_id)) { bPK = false; }
      
      sWhere += "event_id=" + toSQL(pevent_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_event_id\" value=\""+pevent_id+"\"/>";

      sSQL = "select * from events where " + sWhere;


      out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
      out.println("     <tr>\n      <td style=\"background-color: #990000; text-align: Center; border-style: outset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">Edit Event</font></td>\n     </tr>");
      if ( ! sEditEventErr.equals("")) {
        out.println("     <tr>\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 10pt; color: #000000\">"+sEditEventErr+"</font></td>\n     </tr>");
      }
      sEditEventErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"EditEvent\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "EditEvent".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldevent_id = (String) rsHash.get("event_id");
        if ( "".equals(sEditEventErr)) {
          // Load data from recordset when form displayed first time
          flddate_start = (String) rsHash.get("date_start");
          fldevent_name = (String) rsHash.get("event_name");
          fldevent_desc = (String) rsHash.get("event_desc");
          fldlocation = (String) rsHash.get("location");
          fldpresenter = (String) rsHash.get("presenter");
          flduser_added = (String) rsHash.get("user_added");
        }

        if (sAction.equals("") || ! "EditEvent".equals(sForm)) {
      
          fldevent_id = (String) rsHash.get("event_id");
          flddate_start = (String) rsHash.get("date_start");
          fldevent_name = (String) rsHash.get("event_name");
          fldevent_desc = (String) rsHash.get("event_desc");
          fldlocation = (String) rsHash.get("location");
          fldpresenter = (String) rsHash.get("presenter");
          flduser_added = (String) rsHash.get("user_added");
        }
        
      }
      else {
        if ( "".equals(sEditEventErr)) {
          fldevent_id = toHTML(getParam(request,"event_id"));
        }
flddate_start= new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new java.util.Date());
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Date</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"date_start\" maxlength=\"20\" value=\""+toHTML(flddate_start)+"\" size=\"20\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Title</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<textarea name=\"event_name\" cols=\"70\" rows=\"2\">"+toHTML(fldevent_name)+"</textarea>");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Description</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<textarea name=\"event_desc\" cols=\"70\" rows=\"8\">"+toHTML(fldevent_desc)+"</textarea>");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Location</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<textarea name=\"location\" cols=\"70\" rows=\"2\">"+toHTML(fldlocation)+"</textarea>");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Presenter</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"presenter\" maxlength=\"50\" value=\""+toHTML(fldpresenter)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">User Added</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); 
      out.print("<select name=\"user_added\">"+getOptions( conn, "select member_id, member_login from members order by 2",false,false,flduser_added)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "EditEvent".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.EditEvent.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.EditEvent.FormAction.value = 'delete';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"EditEvent\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Insert\" onclick=\"document.EditEvent.FormAction.value = 'insert';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"EditEvent\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"event_id\" value=\""+toHTML(fldevent_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>