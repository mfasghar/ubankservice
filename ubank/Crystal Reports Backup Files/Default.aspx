<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="ubank._Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
  
    <script type="text/javascript" src="js/stmenu.js"></script>

    <Scripts>
            <asp:ScriptReference Name="jquery" />
        </Scripts>
        <script type="text/javascript">
            $(document).ready(function () {startTicker('#tweets', 3, 4500); });
    </script>

    <style type="text/css">

         .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
    }
    .modalPopup
    {
        background-color: #FFFFFF;
        border-width: 3px;
        border-style: solid;
        border-color: black;
        padding-top: 10px;
        padding-left: 10px;
        width: 300px;
        height: 140px;
    }
    .style11
    {
        width: 202px;
    }
    .style19
    {
        width: 338px;
        height: 15px;
    }
    .style20
    {
        width: 338px;
    }
    .style22
    {
        width: 700px;
    }
        .style25
        {
            width: 313px;
        }
        .style27
        {
            width: 338px;
            height: 24px;
        }
        .style28
        {
            width: 700px;
            height: 24px;
        }
        .style29
        {
            height: 24px;
        }
        .style31
        {
            width: 700px;
            height: 15px;
        }
        .style32
        {
        }
        .style33
        {
            height: 24px;
            width: 313px;
        }
        .style34
        {
            height: 15px;
            width: 313px;
        }
        .auto-style21
        {
            height: 28px;
            width: 207px;
        }
        .auto-style22
        {
            height: 15px;
            width: 207px;
        }
        .auto-style24
        {
            height: 28px;
            width: 247px;
        }
        .auto-style25
        {
            height: 15px;
            width: 247px;
        }
        .auto-style26
        {
            height: 28px;
        }
        .auto-style27
        {
            height: 28px;
            width: 232px;
        }
        .auto-style28
        {
            height: 15px;
            width: 232px;
        }
        </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <Div style="background-image: url('pic/system_home.jpg'); background-repeat: no-repeat; height: 418px; width: 932px;">
        <table style="width: 98%; height: 98px;">
            <tr>
                <td class="auto-style21" >
                    </td>
                <td class="auto-style27">
                    </td>
                <td align="left" class="auto-style24" valign="top">
                </td>
                <td class="auto-style26">
                    </td>
            </tr>
            <tr>
                <td  rowspan="0" class="auto-style22" align="left" valign="top" >
                <script type="text/javascript" src="js/mainmenu.js"></script>    
                 
                </td>
                <td class="auto-style28" align="left" valign="top">
                    <asp:HyperLink ID="HyperLink50"  NavigateUrl="~/rep_DepositSummary.aspx" runat="server" 
                        Font-Size="X-Small" Target="_blank" ForeColor="#3366FF">Deposit Summary Report</asp:HyperLink>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    .<br />
                    <br />
                    <asp:HyperLink ID="HyperLink46"  NavigateUrl="Infrastructure_Team.aspx" runat="server" 
                        Font-Size="X-Small" Target="_blank" ForeColor="#3366FF">Contact IT Infrastructure Team</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink47"  NavigateUrl="ADCH_Team.aspx" Target="_blank" runat="server" Font-Size="X-Small" 
                        ForeColor="#3366FF">Contact ADCH Team</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink48" NavigateUrl="IT_Operation.aspx" runat ="server" 
                        Font-Size="X-Small" Target="_blank" ForeColor="#3366FF">Contact IT Operation Team</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink49" runat="server" Font-Size="X-Small" 
                         NavigateUrl="Application_Team.aspx" Target="_blank"
                          ForeColor ="#3366FF">Contact IT Application Team </asp:HyperLink>
                    <br />
                    <br />
                    <br />
                    </td>
                <td align="left" class="auto-style25" valign="top">
                    <asp:HyperLink ID="HyperLink29" runat="server" Font-Size="X-Small" 
                        ForeColor="#3366FF" 
                        NavigateUrl="~/manuals/PIBAS Plus.CHM" Target="_blank" 
                        ToolTip="Download save the file and open it to view the PIBAS Pluse Manual" Width="101px">PIBAS Plus</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink31" runat="server" Font-Size="X-Small" 
                        ForeColor="#3366FF" NavigateUrl="~/manuals/LMF.CHM" 
                        Target="_blank" Width="109px">PIBAS LMF Module </asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink32" runat="server" Font-Size="X-Small" 
                        ForeColor="#3366FF" 
                        NavigateUrl="~/manuals/PIBAS Training Sessions/Reports.CHM" 
                        tabIndex="13" Target="_blank" Width="151px">PIBAS Reports Description</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink43" runat="server" Font-Size="X-Small" 
                        ForeColor="#3366FF" 
                        NavigateUrl="~/manuals/User Manual for AML Module.pdf" 
                        tabIndex="13" Target="_blank">User Manual for AML Module</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink44" runat="server" Font-Size="X-Small" 
                        ForeColor="#3366FF" 
                        NavigateUrl="~/manuals/PIBAS Training Sessions/Training - PIBAS General Ledger.pptx" 
                        tabIndex="13" Target="_blank" Width="151px">General Ledger Training</asp:HyperLink>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink20" runat="server" Font-Size="X-Small" 
                        ForeColor="#3366FF" k
                        NavigateUrl="~/manuals/sybase/Sybase Training Manual.pdf" 
                        tabIndex="9" Target="_blank" Width="157px">Sybase Manual</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink23" runat="server" Font-Size="X-Small" 
                        ForeColor="#3366FF" 
                        NavigateUrl="~/manuals/sybase/Sybase Presentation v3.pdf" 
                        tabIndex="13" Target="_blank" Width="151px">Sybase Presentation</asp:HyperLink>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink33" runat="server" Font-Size="X-Small" 
                        ForeColor="#3366FF" 
                        NavigateUrl="~/Forms/UbankITTeamAndVendorContactDetails.pdf" 
                        tabIndex="13" Target="_blank">UBank IT Team Contact Detail</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink45" runat="server" Font-Size="X-Small" 
                        ForeColor="#3366FF" 
                        NavigateUrl="~/Forms/20146241465249691NewIncomeTaxActiveTaxpayerslist.xlsx" 
                        tabIndex="13" Target="_blank">Taxpayer List (2014)</asp:HyperLink>
                </td>
                <td rowspan="6" valign="top" align="left">
                    <asp:ListView ID="lvTweets" runat="server" DataSourceID="SqlDataSource1">
        <LayoutTemplate>
            <div class="ticker twoRows medium">
                <ul id="tweets" style="font-size: x-small">
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                </ul>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <li style="font-size: x-small"  >
                <div class="header1" style="font-size: x-small">
                    <%#FormatSummary(Eval("News").ToString())%>
                </div>
                <div class="footer1" style="font-size: x-small">Updated @ <%# FormatPubDate(Convert.ToDateTime(Eval("NewsDate")))%></div>
            </li>
        </ItemTemplate>
    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT Top 3 [News], [NewsDate] FROM [News] WHERE ([IsNewsActive] = @IsNewsActive) order by newid()">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="True" Name="IsNewsActive" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
               
                </td>
            </tr>

        </table>
    </Div>

   
</asp:Content>
