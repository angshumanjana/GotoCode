<%@ include file="Common.jsp" %><%!
//
//   Filename: StatusMaint.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/2001
//

static final String sFileName = "StatusMaint.jsp";
              
static final String PageBODY = "bgcolor=\"#F3F2E6\" text=\"#000000\" link=\"#800000\" vlink=\"#000080\" alink=\"#0000FF\"";
static final String FormTABLE = "border=\"1\" cellspacing=\"0\" cellpadding=\"2\" bordercolorlight=\"#000000\" bordercolordark=\"#FFFFFF\"";
static final String FormHeaderTD = "align=\"center\" bgcolor=\"#669999\"";
static final String FormHeaderFONT = "style=\"font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\"";
static final String FieldCaptionTD = "bgcolor=\"#B3B300\"";
static final String FieldCaptionFONT = "style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\"";
static final String DataTD = "bgcolor=\"#F0F0F0\"";
static final String DataFONT = "style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\"";
static final String ColumnFONT = "style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\"";
static final String ColumnTD = "bgcolor=\"#B3B300\"";
%><%

String cSec = checkSecurity(3, session, response, request);
if ("sendRedirect".equals(cSec) ) return;
                
boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sStatusMaintErr = "";

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
if ( sForm.equals("StatusMaint") ) {
  sStatusMaintErr = StatusMaintAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(sStatusMaintErr)) return;
}

%>            
<html>
<head>
<title>Bug Management - Status Maintenance</title>
<meta name="GENERATOR" content="YesSoftware CodeCharge v.1.2.0 / JSP.ccp build 05/21/2001"/>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body bgcolor="#F3F2E6" text="#000000" link="#800000" vlink="#000080" alink="#0000FF">
<jsp:include page="Header.jsp" flush="true"/>
 <table>
  <tr>
   
   <td valign="top">
<% StatusMaint_Show(request, response, session, out, sStatusMaintErr, sForm, sAction, conn, stat); %>
    
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


  String StatusMaintAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String sStatusMaintErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "StatusList.jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      String pPKstatus_id = "";

      final int iinsertAction = 1;
      final int iupdateAction = 2;
      final int ideleteAction = 3;
      int iAction = 0;

      if ( sAction.equalsIgnoreCase("insert") ) { iAction = iinsertAction; }
      if ( sAction.equalsIgnoreCase("update") ) { iAction = iupdateAction; }
      if ( sAction.equalsIgnoreCase("delete") ) { iAction = ideleteAction; }

      // Create WHERE statement

      if ( iAction == iupdateAction || iAction == ideleteAction ) { 
        pPKstatus_id = getParam( request, "PK_status_id");
        if ( isEmpty(pPKstatus_id)) return sStatusMaintErr;
        sWhere = "status_id=" + toSQL(pPKstatus_id, adNumber);
      }


      String fldstatus="";
      String fldstatus_id="";

      // Load all form fields into variables
    
      fldstatus = getParam(request, "status");
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( isEmpty(fldstatus) ) {
          sStatusMaintErr = sStatusMaintErr + "The value in field Status is required.<br>";
        }
        if (sStatusMaintErr.length() > 0 ) {
          return (sStatusMaintErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into statuses (" + 
                "status)" +

                " values (" + 
                toSQL(fldstatus, adText) + ")";
          break;
  
      case iupdateAction:
        
          sSQL = "update statuses set " +
                "status=" + toSQL(fldstatus, adText);
          sSQL = sSQL + " where " + sWhere;
        break;
      
      case ideleteAction:
           sSQL = "delete from statuses where " + sWhere;
          
        break;
  
      }

      if ( sStatusMaintErr.length() > 0 ) return sStatusMaintErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
      }
      catch(java.sql.SQLException e) {
        sStatusMaintErr = e.toString(); return (sStatusMaintErr);
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
    return (sStatusMaintErr);
  }

  


  void StatusMaint_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sStatusMaintErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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
      
      String pstatus_id = "";

      String fldstatus_id="";
      String fldstatus="";


      boolean bPK = true;

      if ( "".equals(sStatusMaintErr)) {
        // Load primary key and form parameters
        pstatus_id = getParam( request, "status_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldstatus_id = getParam( request, "status_id");
        fldstatus = getParam( request, "status");
        pstatus_id = getParam( request, "PK_status_id");
      }

      
      if ( isEmpty(pstatus_id)) { bPK = false; }
      
      sWhere += "status_id=" + toSQL(pstatus_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_status_id\" value=\""+pstatus_id+"\"/>";

      sSQL = "select * from statuses where " + sWhere;


      out.println("    <table border=\"1\" cellspacing=\"0\" cellpadding=\"2\" bordercolorlight=\"#000000\" bordercolordark=\"#FFFFFF\">");
      out.println("     <tr>\n      <td align=\"center\" bgcolor=\"#669999\" colspan=\"2\"><font style=\"font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Add/Edit Status</font></td>\n     </tr>");
      if ( ! sStatusMaintErr.equals("")) {
        out.println("     <tr>\n      <td bgcolor=\"#F0F0F0\" colspan=\"2\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+sStatusMaintErr+"</font></td>\n     </tr>");
      }
      sStatusMaintErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"StatusMaint\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "StatusMaint".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldstatus_id = (String) rsHash.get("status_id");
        if ( "".equals(sStatusMaintErr)) {
          // Load data from recordset when form displayed first time
          fldstatus = (String) rsHash.get("status");
        }

        if (sAction.equals("") || ! "StatusMaint".equals(sForm)) {
      
          fldstatus_id = (String) rsHash.get("status_id");
          fldstatus = (String) rsHash.get("status");
        }
        
      }
      else {
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td bgcolor=\"#B3B300\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Status</font></td><td bgcolor=\"#F0F0F0\">"); out.print("<input type=\"text\"  name=\"status\" maxlength=\"15\" value=\""+toHTML(fldstatus)+"\" size=\"15\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "StatusMaint".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.StatusMaint.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.StatusMaint.FormAction.value = 'delete';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"StatusMaint\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Add\" onclick=\"document.StatusMaint.FormAction.value = 'insert';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"StatusMaint\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"status_id\" value=\""+toHTML(fldstatus_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>