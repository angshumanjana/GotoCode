<%@ include file="Common.jsp" %><%!
//
//   Filename: Default.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "Default.jsp";
              
static final String PageBODY = "bgcolor=\"#ffffff\"";
static final String FormTABLE = "bgcolor=\"#FFFFFF\" border=\"0\"";
static final String FormHeaderTD = "bgcolor=\"#cccccc\" align=\"center\"";
static final String FormHeaderFONT = "face=\"arial\" style=\"font:bold\"";
static final String FieldCaptionTD = "bgcolor=\"#336699\"";
static final String FieldCaptionFONT = "face=\"arial\" size=\"2\" color=\"#FFFFFF\"";
static final String DataTD = "bgcolor=\"#eeeecc\"";
static final String DataFONT = "face=\"arial\" size=\"2\"";
static final String ColumnFONT = "face=\"arial\" size=\"2\" color=\"#FFFFFF\"";
static final String ColumnTD = "bgcolor=\"#336699\"";
%><%

boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sGridErr = "";
String sFilterErr = "";
String sTotalErr = "";

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

%>            
<html>
<head>
<title>Ledger</title>
<meta name="GENERATOR" content="YesSoftware CodeCharge v.1.2.0 / JSP.ccp build 05/21/01"/>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body bgcolor="#ffffff">
<jsp:include page="Header.jsp" flush="true"/>
 <table>
  <tr>
   
   <td valign="top">
<% Filter_Show(request, response, session, out, sFilterErr, sForm, sAction, conn, stat); %>
    
   </td>
  </tr>
 </table>
 <table>
  <tr>
   <td valign="top">
<% Grid_Show(request, response, session, out, sGridErr, sForm, sAction, conn, stat); %>
    
   </td>
  </tr>
 </table>
 <table>
  <tr>
   <td valign="top">
<% Total_Show(request, response, session, out, sTotalErr, sForm, sAction, conn, stat); %>
    
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

  void Grid_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sGridErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException  {
  
    String sWhere = "";
    int iCounter=0;
    int iPage = 0;
    boolean bIsScroll = true;
    boolean hasParam = false;
    String sOrder = "";
    String sSQL="";
    String transitParams = "";
    String sQueryString = "";
    String sPage = "";
    int RecordsPerPage = 20;
    String sSortParams = "";
    String formParams = "";

      String paccount_id="";


    transitParams = "account_id=" + toURL(getParam( request, "account_id")) + "&";
    formParams = "account_id=" + toURL(getParam( request, "account_id")) + "&"; 
    // Build WHERE statement
        
    //-- Check account_id parameter and create a valid sql for where clause
  
    paccount_id = getParam( request, "account_id");
    if ( ! isNumber (paccount_id)) {
      paccount_id = "";
    }
    
    if (paccount_id != null && ! paccount_id.equals("")) {
            
        hasParam = true;
        sWhere += "t.account_id=" + paccount_id;
    }
    
    if (hasParam) { sWhere = " AND (" + sWhere + ")"; }
    // Build ORDER statement
    String sSort = getParam( request, "FormGrid_Sorting");
    String sSorted = getParam( request, "FormGrid_Sorted");
    String sDirection = "";
    String sForm_Sorting = "";
    int iSort = 0;
    try {
      iSort = Integer.parseInt(sSort);
    }
    catch (NumberFormatException e ) {
      sSort = "";
    }
    if ( iSort == 0 ) {
      sForm_Sorting = "";
    }
    else {
      if ( sSort.equals(sSorted)) { 
        sSorted="0";
        sForm_Sorting = "";
        sDirection = " DESC";
        sSortParams = "FormGrid_Sorting=" + sSort + "&FormGrid_Sorted=" + sSort + "&";
      }
      else {
        sSorted=sSort;
        sForm_Sorting = sSort;
        sDirection = " ASC";
        sSortParams = "FormGrid_Sorting=" + sSort + "&FormGrid_Sorted=" + "&";
      }
    
      if ( iSort == 1) { sOrder = " order by t.transaction_number" + sDirection; }
      if ( iSort == 2) { sOrder = " order by t.transaction_date" + sDirection; }
      if ( iSort == 3) { sOrder = " order by t.transaction_description" + sDirection; }
      if ( iSort == 4) { sOrder = " order by a.account_name" + sDirection; }
      if ( iSort == 5) { sOrder = " order by t.withdrawal_amount" + sDirection; }
      if ( iSort == 6) { sOrder = " order by t.deposit_amount" + sDirection; }
    }
  

  // Build full SQL statement
  
  sSQL = "select t.account_id as t_account_id, " +
    "t.deposit_amount as t_deposit_amount, " +
    "t.transaction_date as t_transaction_date, " +
    "t.transaction_description as t_transaction_description, " +
    "t.transaction_id as t_transaction_id, " +
    "t.transaction_number as t_transaction_number, " +
    "t.withdrawal_amount as t_withdrawal_amount, " +
    "a.account_id as a_account_id, " +
    "a.account_name as a_account_name " +
    " from transactions t, accounts a" +
    " where a.account_id=t.account_id  ";
  
  sSQL = sSQL + sWhere + sOrder;

  String sNoRecords = "     <tr>\n      <td colspan=\"7\" bgcolor=\"#eeeecc\"><font face=\"arial\" size=\"2\">No records</font></td>\n     </tr>";


  String tableHeader = "";
      tableHeader = "     <tr>\n      <td bgcolor=\"#336699\"><a &\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\"></font></a></td>\n      <td bgcolor=\"#336699\"><a href=\""+sFileName+"?"+formParams+"FormGrid_Sorting=1&FormGrid_Sorted="+sSorted+"&\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Number</font></a></td>\n      <td bgcolor=\"#336699\"><a href=\""+sFileName+"?"+formParams+"FormGrid_Sorting=2&FormGrid_Sorted="+sSorted+"&\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Date</font></a></td>\n      <td bgcolor=\"#336699\"><a href=\""+sFileName+"?"+formParams+"FormGrid_Sorting=3&FormGrid_Sorted="+sSorted+"&\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Description</font></a></td>\n      <td bgcolor=\"#336699\"><a href=\""+sFileName+"?"+formParams+"FormGrid_Sorting=4&FormGrid_Sorted="+sSorted+"&\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Account</font></a></td>\n      <td bgcolor=\"#336699\"><a href=\""+sFileName+"?"+formParams+"FormGrid_Sorting=5&FormGrid_Sorted="+sSorted+"&\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">W/drawal Amt</font></a></td>\n      <td bgcolor=\"#336699\"><a href=\""+sFileName+"?"+formParams+"FormGrid_Sorting=6&FormGrid_Sorted="+sSorted+"&\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Deposit Amt</font></a></td>\n     </tr>";
  
  
  try {
    out.println("    <table bgcolor=\"#FFFFFF\" border=\"0\">");
    
    out.println(tableHeader);

  }
  catch (Exception e) {}

  
  try {
    // Select current page
    iPage = Integer.parseInt(getParam( request, "FormGrid_Page"));
  }
  catch (NumberFormatException e ) {
    iPage = 0;
  }

  if (iPage == 0) { iPage = 1; }
  RecordsPerPage = 10;
  try {
    java.sql.ResultSet rs = null;
    // Open recordset
    rs = openrs( stat, sSQL);
    iCounter = 0;
    absolute (rs, (iPage-1)*RecordsPerPage+1);
    java.util.Hashtable rsHash = new java.util.Hashtable();
    String[] aFields = getFieldsName( rs );

    // Show main table based on recordset
    while ( (iCounter < RecordsPerPage) && rs.next() ) {

      getRecordToHash( rs, rsHash, aFields );
      String fldaccount_id = (String) rsHash.get("a_account_name");
      String flddeposit_amount = (String) rsHash.get("t_deposit_amount");
      String fldtransaction_date = (String) rsHash.get("t_transaction_date");
      String fldtransaction_description = (String) rsHash.get("t_transaction_description");
      String fldtransaction_id = (String) rsHash.get("t_transaction_id");
      String fldtransaction_number = (String) rsHash.get("t_transaction_number");
      String fldwithdrawal_amount = (String) rsHash.get("t_withdrawal_amount");
      String fldField1= "Edit";

      out.println("     <tr>");
      
      out.print("      <td bgcolor=\"#eeeecc\">"); out.print("<a href=\"LedgerRecord.jsp?"+transitParams+"transaction_id="+toURL((String) rsHash.get("t_transaction_id"))+"&\"><font face=\"arial\" size=\"2\">"+toHTML(fldField1)+"</font></a>");

      out.println("</td>");
      out.print("      <td bgcolor=\"#eeeecc\">"); out.print("<font face=\"arial\" size=\"2\">"+toHTML(fldtransaction_number)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td bgcolor=\"#eeeecc\">"); out.print("<font face=\"arial\" size=\"2\">"+toHTML(fldtransaction_date)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td bgcolor=\"#eeeecc\">"); out.print("<font face=\"arial\" size=\"2\">"+toHTML(fldtransaction_description)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td bgcolor=\"#eeeecc\">"); out.print("<font face=\"arial\" size=\"2\">"+toHTML(fldaccount_id)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td bgcolor=\"#eeeecc\">"); out.print("<font face=\"arial\" size=\"2\">"+toHTML(fldwithdrawal_amount)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td bgcolor=\"#eeeecc\">"); out.print("<font face=\"arial\" size=\"2\">"+toHTML(flddeposit_amount)+"&nbsp;</font>");
      out.println("</td>");
      out.println("     </tr>");
    
      iCounter++;
    }
    if (iCounter == 0) {
      // Recordset is empty
      out.println(sNoRecords);
    
      out.print("     <tr>\n      <td colspan=\"7\" bgcolor=\"#336699\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">");
      out.print("<a href=\"LedgerRecord.jsp?"+formParams+"\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("</td>\n     </tr>");
    
      iCounter = RecordsPerPage+1;
      bIsScroll = false;
    }

    else {

  
    // Parse scroller
    boolean bInsert = false;
    boolean bNext = rs.next();
    if ( !bNext && iPage == 1 ) {
    
      out.print("     <tr>\n      <td colspan=\"7\" bgcolor=\"#336699\">\n       <font face=\"arial\" size=\"2\" color=\"#FFFFFF\">");
      out.print("\n        <a href=\"LedgerRecord.jsp?"+formParams+"\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("\n      </td>\n     </tr>");
    
    }
    else {
      out.print("     <tr>\n      <td colspan=\"7\" bgcolor=\"#336699\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">");
    
      out.print("\n       <a href=\"LedgerRecord.jsp?"+formParams+"\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      bInsert = true;
    
      if ( iPage == 1 ) {
        out.print("\n       <a href_=\"#\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Previous</font></a>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormGrid_Page="+(iPage - 1)+"#Form\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Previous</font></a>");
      }
  
      out.print("\n       [ "+iPage+" ]");
  
      if (!bNext) { 
        out.print("\n       <a href_=\"#\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Next</font></a><br>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormGrid_Page="+(iPage + 1)+"#Form\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Next</font></a><br>");
      }
    
      if ( ! bInsert ) {
        out.print("     <tr>\n      <td colspan=\"7\" bgcolor=\"#336699\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">");
        out.print("\n        <a href=\"LedgerRecord.jsp?"+formParams+"\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      }
    
      out.println("</td>\n     </tr>");
    }
  
    }

    if ( rs != null ) rs.close();
    out.println("    </table>");
    
  }
  catch (Exception e) { out.println(e.toString()); }
}


  void Filter_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sFilterErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
    try {
      

      String fldaccount_id="";


      String sSQL="";
      String transitParams = "";
      String sQueryString = "";
      String sPage = "";
      

      out.println("    <table bgcolor=\"#FFFFFF\" border=\"0\">");
      out.println("     <tr>\n      <td bgcolor=\"#cccccc\" align=\"center\" colspan=\"3\"><a name=\"Filter\"><font face=\"arial\" style=\"font:bold\">Filter</font></a></td>\n     </tr>");
      out.println("     <form method=\"get\" action=\"Default.jsp\" name=\"Filter\">\n     <tr>");
      // Set variables with search parameters
      
      fldaccount_id = getParam( request, "account_id");

      // Show fields
      

      out.println("      <td bgcolor=\"#336699\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Account</font></td>");
      out.print("      <td bgcolor=\"#eeeecc\">"); 
      out.print("<select name=\"account_id\">"+getOptions( conn, "select account_id, account_name from accounts order by 2",true,false,fldaccount_id)+"</select>");
       out.println("</td>");
      
      out.println("      <td ><input type=\"submit\" value=\"Search\"/></td>");
      out.println("     </tr>\n     </form>\n    </table>");
      out.println("");
    }
    catch (Exception e) { out.println(e.toString()); }
  }


  void Total_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sTotalErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException  {
  
    String sWhere = "";
    int iCounter=0;
    int iPage = 0;
    boolean bIsScroll = true;
    boolean hasParam = false;
    String sOrder = "";
    String sSQL="";
    String transitParams = "";
    String sQueryString = "";
    String sPage = "";
    int RecordsPerPage = 20;
    String sSortParams = "";
    String formParams = "";


 
    // Build WHERE statement
        

  // Build full SQL statement
  
  sSQL = "SELECT sum(withdrawal_amount) as sum_w, sum(deposit_amount) as sum_d, sum(deposit_amount) - sum(withdrawal_amount) as bal FROM transactions";
  

  String sNoRecords = "     <tr>\n      <td colspan=\"3\" bgcolor=\"#eeeecc\"><font face=\"arial\" size=\"2\">No records</font></td>\n     </tr>";


  String tableHeader = "";
    tableHeader = "     <tr>\n      <td colspan=\"1\" bgcolor=\"#336699\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Total W/drawals</font></td>\n      <td colspan=\"1\" bgcolor=\"#336699\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Total Deposits</font></td>\n      <td colspan=\"1\" bgcolor=\"#336699\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Balance</font></td>\n     </tr>";
  
  
  try {
    out.println("    <table bgcolor=\"#FFFFFF\" border=\"0\">");
    
    out.println(tableHeader);

  }
  catch (Exception e) {}

  
  try {
    java.sql.ResultSet rs = null;
    // Open recordset
    rs = openrs( stat, sSQL);
    iCounter = 0;
    
    java.util.Hashtable rsHash = new java.util.Hashtable();
    String[] aFields = getFieldsName( rs );

    // Show main table based on recordset
    while ( rs.next() ) {

      getRecordToHash( rs, rsHash, aFields );
      String fldbal = (String) rsHash.get("bal");
      String fldsum_d = (String) rsHash.get("sum_d");
      String fldsum_w = (String) rsHash.get("sum_w");

      out.println("     <tr>");
      
      out.print("      <td bgcolor=\"#eeeecc\">"); out.print("<font face=\"arial\" size=\"2\">"+toHTML(fldsum_w)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td bgcolor=\"#eeeecc\">"); out.print("<font face=\"arial\" size=\"2\">"+toHTML(fldsum_d)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td bgcolor=\"#eeeecc\">"); out.print("<font face=\"arial\" size=\"2\">"+toHTML(fldbal)+"&nbsp;</font>");
      out.println("</td>");
      out.println("     </tr>");
    
      iCounter++;
    }
    if (iCounter == 0) {
      // Recordset is empty
      out.println(sNoRecords);
    
      iCounter = RecordsPerPage+1;
      bIsScroll = false;
    }

    if ( rs != null ) rs.close();
    out.println("    </table>");
    
  }
  catch (Exception e) { out.println(e.toString()); }
}
%>