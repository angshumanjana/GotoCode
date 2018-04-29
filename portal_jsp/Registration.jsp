<%@ include file="Common.jsp" %><%!
//
//   Filename: Registration.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "Registration.jsp";
              
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
<jsp:include page="Header.jsp" flush="true"/><center>
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
      String sActionFileName = "Default.jsp";
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


      String fldmember_login="";
      String fldmember_password="";
      String fldfirst_name="";
      String fldlast_name="";
      String fldemail="";
      String fldaddress1="";
      String fldaddress2="";
      String fldaddress3="";
      String fldcity="";
      String fldstate_id="";
      String fldzip="";
      String fldcountry_id="";
      String fldphone_day="";
      String fldphone_evn="";
      String fldfax="";
      String fldmember_id="";

      // Load all form fields into variables
    
      fldmember_login = getParam(request, "member_login");
      fldmember_password = getParam(request, "member_password");
      fldfirst_name = getParam(request, "first_name");
      fldlast_name = getParam(request, "last_name");
      fldemail = getParam(request, "email");
      fldaddress1 = getParam(request, "address1");
      fldaddress2 = getParam(request, "address2");
      fldaddress3 = getParam(request, "address3");
      fldcity = getParam(request, "city");
      fldstate_id = getParam(request, "state_id");
      fldzip = getParam(request, "zip");
      fldcountry_id = getParam(request, "country_id");
      fldphone_day = getParam(request, "phone_day");
      fldphone_evn = getParam(request, "phone_evn");
      fldfax = getParam(request, "fax");
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( isEmpty(fldmember_login) ) {
          sFormErr = sFormErr + "The value in field Login* is required.<br>";
        }
        if ( isEmpty(fldmember_password) ) {
          sFormErr = sFormErr + "The value in field Password* is required.<br>";
        }
        if ( isEmpty(fldfirst_name) ) {
          sFormErr = sFormErr + "The value in field First Name* is required.<br>";
        }
        if ( isEmpty(fldlast_name) ) {
          sFormErr = sFormErr + "The value in field Last Name* is required.<br>";
        }
        if ( isEmpty(fldemail) ) {
          sFormErr = sFormErr + "The value in field Email* is required.<br>";
        }
        if ( ! isNumber(fldcountry_id)) {
          sFormErr = sFormErr + "The value in field Country is incorrect.<br>";
        }
        if ( ! isEmpty(fldmember_login)) {
          iCount = 0;
          if ( iAction == iinsertAction ) {
            iCount = dCountRec(stat, "members", "member_login=" + toSQL(fldmember_login, adText));
          }
          else {
            if ( iAction == iupdateAction ) {
              iCount = dCountRec( stat, "members", "member_login=" + toSQL(fldmember_login, adText) + " and not(" + sWhere + ")");
            }
          }
          if (iCount > 0) {
            sFormErr = sFormErr + "The value in field Login* is already in database.<br>";
          }
        }
        if (sFormErr.length() > 0 ) {
          return (sFormErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into members (" + 
                "member_login," +
                "member_password," +
                "first_name," +
                "last_name," +
                "email," +
                "address1," +
                "address2," +
                "address3," +
                "city," +
                "state_id," +
                "zip," +
                "country_id," +
                "phone_day," +
                "phone_evn," +
                "fax)" +

                " values (" + 
                toSQL(fldmember_login, adText) + "," +
                toSQL(fldmember_password, adText) + "," +
                toSQL(fldfirst_name, adText) + "," +
                toSQL(fldlast_name, adText) + "," +
                toSQL(fldemail, adText) + "," +
                toSQL(fldaddress1, adText) + "," +
                toSQL(fldaddress2, adText) + "," +
                toSQL(fldaddress3, adText) + "," +
                toSQL(fldcity, adText) + "," +
                toSQL(fldstate_id, adText) + "," +
                toSQL(fldzip, adText) + "," +
                toSQL(fldcountry_id, adNumber) + "," +
                toSQL(fldphone_day, adText) + "," +
                toSQL(fldphone_evn, adText) + "," +
                toSQL(fldfax, adText) + ")";
          break;
  
      }

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

      String fldmember_id="";
      String fldmember_login="";
      String fldmember_password="";
      String fldfirst_name="";
      String fldlast_name="";
      String fldemail="";
      String fldaddress1="";
      String fldaddress2="";
      String fldaddress3="";
      String fldcity="";
      String fldstate_id="";
      String fldzip="";
      String fldcountry_id="";
      String fldphone_day="";
      String fldphone_evn="";
      String fldfax="";


      boolean bPK = true;

      if ( "".equals(sFormErr)) {
        // Load primary key and form parameters
        pmember_id = getParam( request, "member_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldmember_id = getParam( request, "member_id");
        fldmember_login = getParam( request, "member_login");
        fldmember_password = getParam( request, "member_password");
        fldfirst_name = getParam( request, "first_name");
        fldlast_name = getParam( request, "last_name");
        fldemail = getParam( request, "email");
        fldaddress1 = getParam( request, "address1");
        fldaddress2 = getParam( request, "address2");
        fldaddress3 = getParam( request, "address3");
        fldcity = getParam( request, "city");
        fldstate_id = getParam( request, "state_id");
        fldzip = getParam( request, "zip");
        fldcountry_id = getParam( request, "country_id");
        fldphone_day = getParam( request, "phone_day");
        fldphone_evn = getParam( request, "phone_evn");
        fldfax = getParam( request, "fax");
        pmember_id = getParam( request, "PK_member_id");
      }

      
      if ( isEmpty(pmember_id)) { bPK = false; }
      
      sWhere += "member_id=" + toSQL(pmember_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_member_id\" value=\""+pmember_id+"\"/>";

      sSQL = "select * from members where " + sWhere;


      out.println("    <table style=\"style=\"border-style: outset; border-width: 2\"\">");
      out.println("     <tr>\n      <td style=\"background-color: #990000; text-align: Center; border-style: outset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">New User Registration</font></td>\n     </tr>");
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
        if ( "".equals(sFormErr)) {
          // Load data from recordset when form displayed first time
          fldmember_login = (String) rsHash.get("member_login");
          fldmember_password = (String) rsHash.get("member_password");
          fldfirst_name = (String) rsHash.get("first_name");
          fldlast_name = (String) rsHash.get("last_name");
          fldemail = (String) rsHash.get("email");
          fldaddress1 = (String) rsHash.get("address1");
          fldaddress2 = (String) rsHash.get("address2");
          fldaddress3 = (String) rsHash.get("address3");
          fldcity = (String) rsHash.get("city");
          fldstate_id = (String) rsHash.get("state_id");
          fldzip = (String) rsHash.get("zip");
          fldcountry_id = (String) rsHash.get("country_id");
          fldphone_day = (String) rsHash.get("phone_day");
          fldphone_evn = (String) rsHash.get("phone_evn");
          fldfax = (String) rsHash.get("fax");
        }

        if (sAction.equals("") || ! "Form".equals(sForm)) {
      
          fldmember_id = (String) rsHash.get("member_id");
          fldmember_login = (String) rsHash.get("member_login");
          fldmember_password = (String) rsHash.get("member_password");
          fldfirst_name = (String) rsHash.get("first_name");
          fldlast_name = (String) rsHash.get("last_name");
          fldemail = (String) rsHash.get("email");
          fldaddress1 = (String) rsHash.get("address1");
          fldaddress2 = (String) rsHash.get("address2");
          fldaddress3 = (String) rsHash.get("address3");
          fldcity = (String) rsHash.get("city");
          fldstate_id = (String) rsHash.get("state_id");
          fldzip = (String) rsHash.get("zip");
          fldcountry_id = (String) rsHash.get("country_id");
          fldphone_day = (String) rsHash.get("phone_day");
          fldphone_evn = (String) rsHash.get("phone_evn");
          fldfax = (String) rsHash.get("fax");
        }
        
      }
      else {
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Login*</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"member_login\" maxlength=\"15\" value=\""+toHTML(fldmember_login)+"\" size=\"15\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Password*</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"password\"  name=\"member_password\" maxlength=\"15\" value=\""+toHTML(fldmember_password)+"\" size=\"15\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">First Name*</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"first_name\" maxlength=\"20\" value=\""+toHTML(fldfirst_name)+"\" size=\"20\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Last Name*</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"last_name\" maxlength=\"20\" value=\""+toHTML(fldlast_name)+"\" size=\"20\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Email*</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"email\" maxlength=\"30\" value=\""+toHTML(fldemail)+"\" size=\"20\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Address1</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"address1\" maxlength=\"50\" value=\""+toHTML(fldaddress1)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Address2</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"address2\" maxlength=\"50\" value=\""+toHTML(fldaddress2)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Address3</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"address3\" maxlength=\"50\" value=\""+toHTML(fldaddress3)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">City</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"city\" maxlength=\"30\" value=\""+toHTML(fldcity)+"\" size=\"\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">State</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); 
      out.print("<select name=\"state_id\">"+getOptions( conn, "select state_id, state_desc from lookup_states order by 2",false,false,fldstate_id)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Zip</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"zip\" maxlength=\"10\" value=\""+toHTML(fldzip)+"\" size=\"\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Country</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); 
      out.print("<select name=\"country_id\">"+getOptions( conn, "select country_id, country_desc from lookup_countries order by 2",false,false,fldcountry_id)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Phone Day</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"phone_day\" maxlength=\"20\" value=\""+toHTML(fldphone_day)+"\" size=\"20\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Phone Evn</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"phone_evn\" maxlength=\"20\" value=\""+toHTML(fldphone_evn)+"\" size=\"20\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFCC66; border-style: inset; border-width: 1\"><font style=\"font-size: 10pt; color: #000000\">Fax</font></td><td style=\"background-color: #FFFFEE; border-style: inset; border-width: 1\">"); out.print("<input type=\"text\"  name=\"fax\" maxlength=\"20\" value=\""+toHTML(fldfax)+"\" size=\"20\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "Form".equals(sForm))) {
        
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"Form\"><input type=\"hidden\" value=\"\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Register\" onclick=\"document.Form.FormAction.value = 'insert';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"Form\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"member_id\" value=\""+toHTML(fldmember_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>