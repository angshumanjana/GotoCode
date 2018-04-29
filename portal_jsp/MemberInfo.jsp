<%@ include file="Common.jsp" %><%!
//
//   Filename: MemberInfo.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "MemberInfo.jsp";
              
%><%

boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sFormErr = "";

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
if ( sForm.equals("Form") ) {
  sFormErr = FormAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(sFormErr)) return;
}

%>            
<html>
<head>
<title>SVEC - Silicon Valley Engineers Club</title>
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
<% Form_Show(request, response, session, out, sFormErr, sForm, sAction, conn, stat); %>
    
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


  String FormAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String sFormErr ="";
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

  
      String pPKmember_id = "";

      final int iinsertAction = 1;
      final int iupdateAction = 2;
      final int ideleteAction = 3;
      int iAction = 0;

      if ( sAction.equalsIgnoreCase("insert") ) { iAction = iinsertAction; }
      if ( sAction.equalsIgnoreCase("update") ) { iAction = iupdateAction; }
      if ( sAction.equalsIgnoreCase("delete") ) { iAction = ideleteAction; }

      // Create WHERE statement


      String fldmember_id="";
      String fldcountry_id="";

      // Load all form fields into variables
    

      sSQL = "";
      // Create SQL statement

      if ( sFormErr.length() > 0 ) return sFormErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
      }
      catch(java.sql.SQLException e) {
        sFormErr = e.toString(); return (sFormErr);
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
    return (sFormErr);
  }

  


  void Form_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sFormErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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
      
      String pmember_id = "";

      String fldstate_id="";
      String fldcountry_id="";
      String fldmember_id="";
      String fldmember_login="";
      String fldfirst_name="";
      String fldlast_name="";
      String fldemail="";
      String fldcity="";
      String fldphone_day="";
      String fldphone_evn="";


      boolean bPK = true;

      if ( "".equals(sFormErr)) {
        // Load primary key and form parameters
        pmember_id = getParam( request, "member_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldmember_id = getParam( request, "member_id");
        pmember_id = getParam( request, "PK_member_id");
      }

      
      if ( isEmpty(pmember_id)) { bPK = false; }
      
      sWhere += "member_id=" + toSQL(pmember_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_member_id\" value=\""+pmember_id+"\"/>";

      sSQL = "select * from members where " + sWhere;


      out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
      out.println("     <tr>\n      <td style=\"background-color: #990000; text-align: Center; border-style: outset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">Member Info</font></td>\n     </tr>");
      if ( ! sFormErr.equals("")) {
        out.println("     <tr>\n      <td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 10pt; color: #000000\">"+sFormErr+"</font></td>\n     </tr>");
      }
      sFormErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"Form\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "Form".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldmember_id = (String) rsHash.get("member_id");
        fldmember_login = (String) rsHash.get("member_login");
        fldfirst_name = (String) rsHash.get("first_name");
        fldlast_name = (String) rsHash.get("last_name");
        fldemail = (String) rsHash.get("email");
        fldcity = (String) rsHash.get("city");
        fldstate_id = (String) rsHash.get("state_id");
        fldcountry_id = (String) rsHash.get("country_id");
        fldphone_day = (String) rsHash.get("phone_day");
        fldphone_evn = (String) rsHash.get("phone_evn");

        if (sAction.equals("") || ! "Form".equals(sForm)) {
      
          fldmember_id = (String) rsHash.get("member_id");
          fldmember_login = (String) rsHash.get("member_login");
          fldfirst_name = (String) rsHash.get("first_name");
          fldlast_name = (String) rsHash.get("last_name");
          fldemail = (String) rsHash.get("email");
          fldcity = (String) rsHash.get("city");
          fldstate_id = (String) rsHash.get("state_id");
          fldcountry_id = (String) rsHash.get("country_id");
          fldphone_day = (String) rsHash.get("phone_day");
          fldphone_evn = (String) rsHash.get("phone_evn");
        }
        else {
          fldmember_id = (String) rsHash.get("member_id");
          fldmember_login = (String) rsHash.get("member_login");
          fldfirst_name = (String) rsHash.get("first_name");
          fldlast_name = (String) rsHash.get("last_name");
          fldemail = (String) rsHash.get("email");
          fldcity = (String) rsHash.get("city");
          fldstate_id = (String) rsHash.get("state_id");
          fldcountry_id = (String) rsHash.get("country_id");
          fldphone_day = (String) rsHash.get("phone_day");
          fldphone_evn = (String) rsHash.get("phone_evn");
        }
        
      }
      else {
      }
      
      // Set lookup fields
          fldstate_id = dLookUp( stat, "lookup_states", "state_desc", "state_id=" + toSQL(fldstate_id, adText));
          fldcountry_id = dLookUp( stat, "lookup_countries", "country_desc", "country_id=" + toSQL(fldcountry_id, adNumber));


      // Show form field
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Login</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldmember_login)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">First Name</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldfirst_name)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Last Name</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldlast_name)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Email</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldemail)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">City</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldcity)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">State</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldstate_id)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Country</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldcountry_id)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Phone Day</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldphone_day)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Phone Evn</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<font style=\"font-size: 10pt; color: #000000\">"+toHTML(fldphone_evn)+"&nbsp;</font>");
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "Form".equals(sForm))) {
        
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"Form\"><input type=\"hidden\" value=\"\" name=\"FormAction\">");
      }
      out.print("<input type=\"hidden\" name=\"member_id\" value=\""+toHTML(fldmember_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>