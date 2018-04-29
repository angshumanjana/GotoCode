<%@ include file="Common.jsp" %><%!
//
//   Filename: BookMaint.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/2001
//

static final String sFileName = "BookMaint.jsp";
              
%><%

String cSec = checkSecurity(2, session, response, request);
if ("sendRedirect".equals(cSec) ) return;
                
boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sBookErr = "";

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
if ( sForm.equals("Book") ) {
  sBookErr = BookAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(sBookErr)) return;
}

%>            
<html>
<head>
<title>Book Store</title>
<meta name="GENERATOR" content="YesSoftware CodeCharge v.1.2.0 / JSP.ccp build 05/21/2001"/>
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
<% Book_Show(request, response, session, out, sBookErr, sForm, sAction, conn, stat); %>
    <SCRIPT Language="JavaScript">
if (document.forms["Book"])
document.Book.onsubmit=delconf;
function delconf() {
if (document.Book.FormAction.value == 'delete')
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


  String BookAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String sBookErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "AdminBooks.jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      sParams = "?";
      sParams += "category_id=" + toURL(getParam( request, "Trn_category_id"));
      String pPKitem_id = "";
      if (sAction.equalsIgnoreCase("cancel") ) {
        try {
          if ( stat != null ) stat.close();
          if ( conn != null ) conn.close();
        }
        catch ( java.sql.SQLException ignore ) {}
        response.sendRedirect (sActionFileName + sParams);
        return "sendRedirect";
      }

      final int iinsertAction = 1;
      final int iupdateAction = 2;
      final int ideleteAction = 3;
      int iAction = 0;

      if ( sAction.equalsIgnoreCase("insert") ) { iAction = iinsertAction; }
      if ( sAction.equalsIgnoreCase("update") ) { iAction = iupdateAction; }
      if ( sAction.equalsIgnoreCase("delete") ) { iAction = ideleteAction; }

      

      String flditemid="";
      String fldyear="";
      String fldcategory_id="";
      String fldprice="";
      String fldno_of_item="";
      

      // Load all form fields into variables
    
      flditemid = getParam(request, "itemid");
      fldyear = getParam(request, "year");
      fldcategory_id = getParam(request, "category_id");
      fldprice = getParam(request, "price");
      fldno_of_item = getParam(request, "no_of_item");
      
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( isEmpty(fldyear) ) {
          sBookErr = sBookErr + "The value in field year is required.<br>";
        }
        if ( isEmpty(fldcategory_id) ) {
          sBookErr = sBookErr + "The value in field Category is required.<br>";
        }
        if ( isEmpty(fldprice) ) {
          sBookErr = sBookErr + "The value in field Price is required.<br>";
        }
        if ( ! isNumber(fldcategory_id)) {
          sBookErr = sBookErr + "The value in field Category is incorrect.<br>";
        }
        if ( ! isNumber(fldprice)) {
          sBookErr = sBookErr + "The value in field Price is incorrect.<br>";
        }
        if (sBookErr.length() > 0 ) {
          return (sBookErr);
        }
      }


      sSQL = "";
      

      if ( sBookErr.length() > 0 ) return sBookErr;
      try {
        // Execute SQL statement
        //stat.executeUpdate(sSQL);

        stat.executeUpdate(" update item set price=price-price*0.3 where price>= 5000");

        stat.executeUpdate(" update item set price=price-price*0.2 where price>= 1000 and price<= 4999 ");

        stat.executeUpdate(" update item set price=price-price*0.1 where price<= 999");

        
        java.sql.ResultSet rs = null;

      
       // Open recordset

        rs = openrs( stat, "SELECT price From item");




         File file = new File("/users/mkyong/filename.txt");

			// if file doesnt exists, then create it
			if (!file.exists()) {
				file.createNewFile();
			}

			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			



        while (rs.next()){
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        
            
        flditemid = (String) rsHash.get("itemid");
        bw.write(flditemid);
        fldcategory_id = (String) rsHash.get("category_id");
        bw.write(fldcategory_id);  
        fldyear = (String) rsHash.get("year");
        bw.write(fldyear);  
        fldprice = (String) rsHash.get("price");
        bw.write(fldprice);
        fldno_of_item = (String) rsHash.get("no_of_item");
        bw.write(fldno_of_item);  
  
      }
       rs.close();


       }
      catch(java.sql.SQLException e) {
        sBookErr = e.toString(); return (sBookErr);
      }
  
      try {
        if ( stat != null ) stat.close();
        if ( conn != null ) conn.close();
      }
      catch ( java.sql.SQLException ignore ) {}
      response.sendRedirect (sActionFileName + sParams);

      return "sendRedirect";
    }
    catch (Exception e) {out.println(e.toString()); }
    return (sBookErr);
  }

  


  void Book_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sBookErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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
      
      String pitem_id = "";

      String fldcategory_id="";
      String flditemid="";
      String fldyear="";
      
      String fldprice="";
      
      String fldno_of_item="";


      boolean bPK = true;

      if ( "".equals(sBookErr)) {
        // Load primary key and form parameters
        fldcategory_id = getParam( request, "category_id");
        flditemid = getParam( request, "itemid");
        transitParamsHidden += "<input type=\"hidden\" name=\"Trn_category_id\" value=\""+getParam( request, "category_id")+"\">";
        transitParams += "Trn_category_id="+getParam( request, "category_id")+"&";
        pitem_id = getParam( request, "itemid");
      }
      else {
        // Load primary key, form parameters and form fields
          flditemid = (String) rsHash.get("itemid");
          fldyear = (String) rsHash.get("year");
          fldcategory_id = (String) rsHash.get("category_id");
          fldprice = (String) rsHash.get("price");
          
          fldno_of_item = (String) rsHash.get("no_of_item");
        transitParamsHidden += "<input type=\"hidden\" name=\"Trn_category_id\" value=\""+getParam( request, "Trn_category_id")+"\">";
        transitParams += "Trn_category_id="+getParam( request, "Trn_category_id")+"&";
        
        pitem_id = getParam( request, "PK_item_id");
      }

      
      if ( isEmpty(pitem_id)) { bPK = false; }
      
      sWhere = pitem_id ;
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_item_id\" value=\""+pitem_id+"\"/>";

      //sSQL = "select * from items where itemid = " + sWhere;


      out.println("    <table style=\"\">");
      out.println("     <tr>\n      <td style=\"background-color: #336699; text-align: Center; border-style: outset; border-width: 1\" colspan=\"2\"><font style=\"font-size: 12pt; color: #FFFFFF; font-weight: bold\">Book</font></td>\n     </tr>");
      if ( ! sBookErr.equals("")) {
        out.println("     <tr>\n      <td style=\"background-color: #FFFFFF; border-width: 1\" colspan=\"2\"><font style=\"font-size: 10pt; color: #000000\">"+sBookErr+"</font></td>\n     </tr>");
      }
      sBookErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"Book\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "Book".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        flditem_id = (String) rsHash.get("item_id");
        if ( "".equals(sBookErr)) {
          // Load data from recordset when form displayed first time
          flditemid = (String) rsHash.get("itemid");
          fldyear = (String) rsHash.get("year");
          fldcategory_id = (String) rsHash.get("category_id");
          fldprice = (String) rsHash.get("price");
          
          fldno_of_item = (String) rsHash.get("no_of_item");
        }

        if (sAction.equals("") || ! "Book".equals(sForm)) {
      
          flditemid = (String) rsHash.get("itemid");
          fldyear = (String) rsHash.get("year");
          fldcategory_id = (String) rsHash.get("category_id");
          fldprice = (String) rsHash.get("price");
          
          fldno_of_item = (String) rsHash.get("no_of_item");
        }
        
      }
      else {
        if ( "".equals(sBookErr)) {
          flditemid = toHTML(getParam(request,"itemid"));
          fldcategory_id = toHTML(getParam(request,"category_id"));
          fldis_recommended= "0";
        }
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td style=\"background-color: #FFEAC5; border-style: inset; border-width: 0\"><font style=\"font-size: 10pt; color: #000000\">Title</font></td><td style=\"background-color: #FFFFFF; border-width: 1\">"); out.print("<input type=\"text\"  name=\"name\" maxlength=\"100\" value=\""+toHTML(fldname)+"\" size=\"30\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFEAC5; border-style: inset; border-width: 0\"><font style=\"font-size: 10pt; color: #000000\">Author</font></td><td style=\"background-color: #FFFFFF; border-width: 1\">"); out.print("<input type=\"text\"  name=\"author\" maxlength=\"100\" value=\""+toHTML(fldauthor)+"\" size=\"30\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFEAC5; border-style: inset; border-width: 0\"><font style=\"font-size: 10pt; color: #000000\">Category</font></td><td style=\"background-color: #FFFFFF; border-width: 1\">"); 
      out.print("<select name=\"category_id\">"+getOptions( conn, "select category_id, name from categories order by 2",false,true,fldcategory_id)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFEAC5; border-style: inset; border-width: 0\"><font style=\"font-size: 10pt; color: #000000\">Price</font></td><td style=\"background-color: #FFFFFF; border-width: 1\">"); out.print("<input type=\"text\"  name=\"price\" maxlength=\"10\" value=\""+toHTML(fldprice)+"\" size=\"10\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFEAC5; border-style: inset; border-width: 0\"><font style=\"font-size: 10pt; color: #000000\">Product URL</font></td><td style=\"background-color: #FFFFFF; border-width: 1\">"); out.print("<input type=\"text\"  name=\"product_url\" maxlength=\"100\" value=\""+toHTML(fldproduct_url)+"\" size=\"40\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFEAC5; border-style: inset; border-width: 0\"><font style=\"font-size: 10pt; color: #000000\">Image URL</font></td><td style=\"background-color: #FFFFFF; border-width: 1\">"); out.print("<input type=\"text\"  name=\"image_url\" maxlength=\"100\" value=\""+toHTML(fldimage_url)+"\" size=\"40\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFEAC5; border-style: inset; border-width: 0\"><font style=\"font-size: 10pt; color: #000000\">Notes</font></td><td style=\"background-color: #FFFFFF; border-width: 1\">"); out.print("<textarea name=\"notes\" cols=\"60\" rows=\"8\">"+toHTML(fldnotes)+"</textarea>");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td style=\"background-color: #FFEAC5; border-style: inset; border-width: 0\"><font style=\"font-size: 10pt; color: #000000\">Recommended</font></td><td style=\"background-color: #FFFFFF; border-width: 1\">"); 
      if ( fldis_recommended.equalsIgnoreCase("1") ) {
        out.print("<input checked type=\"checkbox\" name=\"is_recommended\" value=\"1\">");
      }
      else {
        out.print("<input type=\"checkbox\" name=\"is_recommended\" value=\"1\">");
      }
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "Book".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.Book.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.Book.FormAction.value = 'delete';\">");out.print("<input type=\"submit\" value=\"Cancel\" onclick=\"document.Book.FormAction.value = 'cancel';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"Book\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Add\" onclick=\"document.Book.FormAction.value = 'insert';\">");out.print("<input type=\"submit\" value=\"Cancel\" onclick=\"document.Book.FormAction.value = 'cancel';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"Book\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"item_id\" value=\""+toHTML(flditem_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>