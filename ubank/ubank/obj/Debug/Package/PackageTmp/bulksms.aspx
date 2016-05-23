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
                                         <li class="first active">
                                                <a href="#">Bulk SMS  </a>
                                         </li>
                                         <li>
                                                <a href="logs.aspx">Logs</a>
                                         </li>
                                         
                                  </ul>
                                  <br class="clear" />
                           </div>
                     </div>
              
                     
                     
                                  
                                                
                                                
<p>Open Excel File.Fill first column with MSISDN and 2nd column with Text Message</p>
                        <p>Click File->SaveAs->.CSV File</p>
                        <p>Upload .CSV file for Bulk SMS</p>

    <!--<label for="file">File: </label>--> 
    <asp:Label  ID="Label1" runat="server" Text=""></asp:Label>
            <br />
<asp:Label  ID="Label2" runat="server" Text="Upload File:"></asp:Label>
                  <asp:FileUpload ID="FileUpload1" runat="server" Width="358px" />
    <br />
     <asp:Button  ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload File" BackColor="#33CC33" BorderStyle="Solid" Width="97px" Height="40px" BorderColor="#003300" BorderWidth="2px" />
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

