<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bulksms.aspx.cs" Inherits="WebApplication1.bulkSMS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
       WarpSpeed by Free Website Templates
       www.freewebsitetemplat.es 
       Images by Fotogrph http://fotogrph.com/
       Released under the Creative Commons Attribution 3.0 License.
-->
<html xmlns="http://www.w3.org/1999/xhtml">
       <head>
              <meta http-equiv="content-type" content="text/html; charset=utf-8" />
              <meta name="description" content="" />
              <meta name="keywords" content="test" />
              <title>Bulk SMS</title>
              <link href="http://fonts.googleapis.com/css?family=Antic" rel="stylesheet" type="text/css" />
              <link href="http://fonts.googleapis.com/css?family=Shanti" rel="stylesheet" type="text/css" />
              
           <link href="CSS%20Files/Styles.css" rel="stylesheet" />
       </head>
       <body>
        <form runat="server">
              <div id="outer">
             &nbsp;<div id="header">
                
                           <div id="logo">
                   
                                                
                                  <h2><a href="#">Bulk<span>SMS</span></a></h2>
                           </div>
                           <div id="nav" class="left">
                                  <ul>
                                         <li >
                                                <a href="#">Bulk SMS  </a>
                                         </li>
                                         <li class="first active">
                                                <a href="logs.aspx">Logs</a>
                                         </li>
                                         
                                  </ul>
                                  <br class="clear" />
                           </div>
                     </div>
              
                     
                     

    <!--<label for="file">File: </label>--> 
   <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
             </asp:GridView>

                                         
                                  

                           
                     
              </div>
              <div id="copyright">
                     </div>
            </form>
       </body>
</html>

