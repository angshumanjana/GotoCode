<%@ include file="Common.jsp" %><%!
//
//   Filename: LedgerRecord.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "LedgerRecord.jsp";
              
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
String sRecordErr = "";

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
if ( sForm.equals("Record") ) {
  sRecordErr = RecordAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(sRecordErr)) return;
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
<% Record_Show(request, response, session, out, sRecordErr, sForm, sAction, conn, stat); %>
    <SCRIPT Language="JavaScript">
if (document.forms["Record"])
document.Record.onsubmit=delconf;
function delconf() {
if (document.Record.FormAction.value == 'delete')
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


  String RecordAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String sRecordErr ="";
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

  
      String pPKtransaction_id = "";
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

      


      String fldcomm="";
      String fldtrans_date="";
      String fldinterest="";
      
      String fldwithdrawal="";
      String flddeposit="";
      String fldtrans_id="";
      String fldaccount_number="";
      String fldbalance="";
      

      // Load all form fields into variables
    
      fldtrans_id = getParam(request, "trans_id");
      fldtrans_date = getParam(request, "trans_date");
      fldaccount_number = getParam(request, "account_number");
      
      fldwithdrawal = getParam(request, "withdrawal");
      flddeposit = getParam(request, "deposit");
      fldbalance = getParam(request, "balance");
      fldcomm = getParam(request, "comm");
      fldinterest = getParam(request, "interest");
      
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( isEmpty(fldtrans_id) ) {
          sRecordErr = sRecordErr + "The value in field id is required.<br>";
        }
        if ( isEmpty(fldtrans_date) ) {
          sRecordErr = sRecordErr + "The value in field Date is required.<br>";
        }
        if ( isEmpty(fldcomm) ) {
          sRecordErr = sRecordErr + "The value in field comm is required.<br>";
        }
        if ( isEmpty(fldwithdrawal) ) {
          sRecordErr = sRecordErr + "The value in field W/drawal Amt is required.<br>";
        }
        if ( isEmpty(flddeposit) ) {
          sRecordErr = sRecordErr + "The value in field Deposit Amt is required.<br>";
        }
        if ( ! isNumber(fldaccount_number)) {
          sRecordErr = sRecordErr + "The value in field Number is incorrect.<br>";
        }
        if ( ! isNumber(fldbalance)) {
          sRecordErr = sRecordErr + "The value in field balance is incorrect.<br>";
        }
        if ( ! isNumber(fldinterest)) {
          sRecordErr = sRecordErr + "The value in field interest is incorrect.<br>";
        }
  
        if ( ! isNumber(fldwithdrawal)) {
          sRecordErr = sRecordErr + "The value in field W/drawal Amt is incorrect.<br>";
        }
        if ( ! isNumber(flddeposit)) {
          sRecordErr = sRecordErr + "The value in field Deposit Amt is incorrect.<br>";
        }
        if ( ! isEmpty(fldtrans_id) && isNumber(fldtrans_id)) {
          iCount = 0;
          if ( iAction == iinsertAction ) {
            iCount = dCountRec(stat, "Account_info", "transa_id=" + fldtrans_id);
          }
          else {
            if ( iAction == iupdateAction ) {
              iCount = dCountRec( stat, "Account_info", "trans_id=" + fldtrans_id);
            }
          }
          if (iCount > 0) {
            sRecordErr = sRecordErr + "The value in field Number is already in database.<br>";
          }
        }
        if (sRecordErr.length() > 0 ) {
          return (sRecordErr);
        }
      }


      sSQL = "";
      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into Account_info (" + "trans_id," + "trans_date," + "account_number," + "balance," + "comm," + "interest," +  "withdrawal," + "deposit" + ")" + " values (" + "fldtrans_id," + "fldtrans_date," + "fldaccount_number," + "fldbalance," + "fldcomm," + "fldinterest," +  "fldwithdrawal," + "flddeposit" + ")";
            break;
      
       
      
        case ideleteAction:
           sSQL = "delete from Account_info where trans_id = " + sWhere;
          
        break;
  
      }

      
      

      if ( sRecordErr.length() > 0 ) return sRecordErr;
      try {
        // Execute SQL statement
        
        
        stat.executeUpdate(sSQL);

        stat.executeUpdate("UPDATE Account_info SET balance = balance + balance * 0.02 WHERE balance+comm+interest >= 50000");

        stat.executeUpdate("UPDATE Account_info SET balance = balance + balance * 0.1 WHERE balance+comm+interest >= 40000");

        stat.executeUpdate("DELETE FROM Account_info WHERE balance+comm+interest <= 999");

        java.sql.ResultSet rs = null;

      
      
        rs = openrs( stat, "SELECT * From  Account_info WHERE balance+comm+interest >= 10000");




         File file = new File("/users/mkyong/filename.txt");

			// if file doesnt exists, then create it
			if (!file.exists()) {
				file.createNewFile();
			}

			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			



        while(rs.next()) {
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        
            
        fldtrans_id = (String) rsHash.get("trans_id");
        bw.write(fldtrans_id);
        fldcomm = (String) rsHash.get("comm");
        bw.write(fldcomm);
        fldtrans_date = (String) rsHash.get("trans_date");
        bw.write(fldtrans_date);    
        fldinterest = (String) rsHash.get("interest");
        bw.write(fldinterest);
        fldwithdrawal = (String) rsHash.get("withdrawal");
        bw.write(fldwithdrawal);
        flddeposit = (String) rsHash.get("deposit");
        bw.write(flddeposit);
        fldaccount_number = (String) rsHash.get("account_number");
        bw.write(fldaccount_number);
        fldbalance = (String) rsHash.get("balance");
        bw.write(balance);

		}

       rs.close();

        
    
       
        java.sql.ResultSet rs1 = null;

      
      
        rs1 = openrs( stat, "SELECT trans_id, trans_date, account_number From  Account_info WHERE comm >= 5000");




         File file = new File("/users/mkyong/filename.txt");

			// if file doesnt exists, then create it
			if (!file.exists()) {
				file.createNewFile();
			}

			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			



        while(rs1.next()) {
        String[] aFields = getFieldsName( rs1 );
        getRecordToHash( rs1, rsHash, aFields );
        
            
        fldtransa_id = (String) rsHash.get("trans_id");
        bw.write(fldtrans_id);
       
        fldtrans_date = (String) rsHash.get("trans_date");
        bw.write(fldtrans_date);    
       
        fldaccount_number = (String) rsHash.get("account_number");
        bw.write(fldaccount_number);
       


		}
       rs1.close();
        
       }

      
      catch(java.sql.SQLException e) {
        sRecordErr = e.toString(); return (sRecordErr);
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
    return (sRecordErr);
  }

  


  void Record_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sRecordErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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
      
      String ptrans_id = "";

      String fldtrans_id="";
      String fldcomm="";
      String fldtrans_date="";
      String fldaccount_id="";
      String fldinterest="";
      String fldbalance="";
      String fldwithdrawal="";
      String flddeposit="";


      boolean bPK = true;

      if ( "".equals(sRecordErr)) {
        // Load primary key and form parameters
        ptrans_id = getParam( request, "trans_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldtrans_id = getParam( request, "trans_id");
        fldcomm = getParam( request, "comm");
        fldtrans_date = getParam( request, "trans_date");
        fldaccount_id = getParam( request, "account_id");
        fldbalance = getParam( request, "balance");
        fldinterest = getParam( request, "interest");   
        fldwithdrawal = getParam( request, "withdrawal");
        flddeposit = getParam( request, "deposit");
        
      }

      
      if ( isEmpty(sWhere)) { bPK = false; }
      
     // sWhere += "transaction_id=" + toSQL(ptransaction_id, adNumber);
      //primaryKeyParams += "<input type=\"hidden\" name=\"PK_transaction_id\" value=\""+ptransaction_id+"\"/>";

      //sSQL = "select * from transactions where " + "transaction_id = " + sWhere;


      out.println("    <table bgcolor=\"#FFFFFF\" border=\"0\">");
      out.println("     <tr>\n      <td bgcolor=\"#cccccc\" align=\"center\" colspan=\"2\"><font face=\"arial\" style=\"font:bold\">Transaction</font></td>\n     </tr>");
      if ( ! sRecordErr.equals("")) {
        out.println("     <tr>\n      <td bgcolor=\"#eeeecc\" colspan=\"2\"><font face=\"arial\" size=\"2\">"+sRecordErr+"</font></td>\n     </tr>");
      }
      sRecordErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"Record\">");

      java.sql.ResultSet rs3 = null;

      if ( bPK &&  ! (sAction.equals("insert") && "Record".equals(sForm))) {

        // Open recordset
        rs3 = openrs( stat, sSQL);
        rs3.next();
        String[] aFields = getFieldsName( rs3 );
        getRecordToHash( rs3, rsHash, aFields );
        rs3.close();
        fldtransaction_id = (String) rsHash.get("transaction_id");
        if ( "".equals(sRecordErr)) {
          // Load data from recordset when form displayed first time
          fldtrans_id = getParam( request, "trans_id");
        fldcomm = getParam( request, "comm");
        fldtrans_date = getParam( request, "trans_date");
        fldaccount_id = getParam( request, "account_id");
        fldbalance = getParam( request, "balance");
        fldinterest = getParam( request, "interest");   
        fldwithdrawal = getParam( request, "withdrawal");
        flddeposit = getParam( request, "deposit");
        }

        if (sAction.equals("") || ! "Record".equals(sForm)) {
      
          fldtrans_id = getParam( request, "trans_id");
        fldcomm = getParam( request, "comm");
        fldtrans_date = getParam( request, "trans_date");
        fldaccount_id = getParam( request, "account_id");
        fldbalance = getParam( request, "balance");
        fldinterest = getParam( request, "interest");   
        fldwithdrawal = getParam( request, "withdrawal");
        flddeposit = getParam( request, "deposit");
        }
        
      }
      else {
        if ( "".equals(sRecordErr)) {
          fldwithdrawal_amount= "0";
          flddeposit_amount= "0";
        }
fldtransaction_date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td bgcolor=\"#336699\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Number</font></td><td bgcolor=\"#eeeecc\">"); out.print("<input type=\"text\"  name=\"transaction_number\" maxlength=\"10\" value=\""+toHTML(fldtransaction_number)+"\" size=\"10\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#336699\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Date</font></td><td bgcolor=\"#eeeecc\">"); out.print("<input type=\"text\"  name=\"transaction_date\" maxlength=\"10\" value=\""+toHTML(fldtransaction_date)+"\" size=\"10\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#336699\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Account</font></td><td bgcolor=\"#eeeecc\">"); 
      out.print("<select name=\"account_id\">"+getOptions( conn, "select account_id, account_name from accounts order by 2",false,true,fldaccount_id)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#336699\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Description</font></td><td bgcolor=\"#eeeecc\">"); out.print("<input type=\"text\"  name=\"transaction_description\" maxlength=\"50\" value=\""+toHTML(fldtransaction_description)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#336699\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">W/drawal Amt</font></td><td bgcolor=\"#eeeecc\">"); out.print("<input type=\"text\"  name=\"withdrawal_amount\" maxlength=\"15\" value=\""+toHTML(fldwithdrawal_amount)+"\" size=\"15\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#336699\"><font face=\"arial\" size=\"2\" color=\"#FFFFFF\">Deposit Amt</font></td><td bgcolor=\"#eeeecc\">"); out.print("<input type=\"text\"  name=\"deposit_amount\" maxlength=\"15\" value=\""+toHTML(flddeposit_amount)+"\" size=\"15\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "Record".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.Record.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.Record.FormAction.value = 'delete';\">");out.print("<input type=\"submit\" value=\"Cancel\" onclick=\"document.Record.FormAction.value = 'cancel';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"Record\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Insert\" onclick=\"document.Record.FormAction.value = 'insert';\">");out.print("<input type=\"submit\" value=\"Cancel\" onclick=\"document.Record.FormAction.value = 'cancel';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"Record\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"transaction_id\" value=\""+toHTML(fldtrans_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>