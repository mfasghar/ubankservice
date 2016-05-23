<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="idrequestadd.aspx.cs" Inherits="ubank.idrequestadd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
        .style15
        {
        }
        .style16
        {
            height: 21px;
        }
        .style17
        {
            width: 282px;
        }
        .style18
        {
            height: 21px;
            margin-left: 40px;
        }
        .style19
        {
            height: 17px;
        }
        .style20
        {
            width: 282px;
            height: 17px;
        }
        .style21
        {
            height: 17px;
            width: 106px;
        }
        .style22
        {
            height: 21px;
            width: 106px;
        }
        .style23
        {
            width: 106px;
        }
        .style24
        {
            height: 63px;
        }
        .style25
        {
            height: 63px;
            width: 282px;
        }
        .style26
        {
            height: 63px;
            width: 106px;
        }
        .style28
        {
            height: 16px;
            margin-left: 40px;
        }
        .style29
        {
            height: 16px;
        }
        .style30
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style15" colspan="4" 
                style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #6699FF">
                <asp:Label ID="Label5" runat="server" Text="User ID Creation Request Form" 
                    CssClass="title" Font-Size="Medium" ForeColor="#336699"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style19">
                Request Type</td>
            <td class="style20">
                <asp:DropDownList ID="cmbUserRequestType" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="UserRequestType" 
                    DataValueField="UserRequestTypeID" Height="25px" style="margin-right: 0px" 
                    Width="336px" 
                    onselectedindexchanged="cmbUserRequestType_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strConn %>" 
                    SelectCommand="SELECT [UserRequestTypeID], [UserRequestType] FROM [RefUserRequestType] WHERE ([IsUserRequestTypeActive] = @IsUserRequestTypeActive) ORDER BY [UserRequestTypeID]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="IsUserRequestTypeActive" 
                            Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="style21">
                </td>
            <td class="style19">
                </td>
        </tr>
        <tr>
            <td>
                Branch /Ho</td>
            <td class="style18">
                <asp:DropDownList ID="cmbBranch" runat="server" 
                    DataSourceID="SqlDataSourceBranches" DataTextField="LocationDes" 
                    DataValueField="LocationID" Height="25px" Width="336px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceBranches" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strConn %>" 
                    SelectCommand="SELECT [LocationID], [LocationDes] FROM [RefLocation] WHERE ([BlockLocation] = @BlockLocation) ORDER BY [LocationID]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="False" Name="BlockLocation" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="style22">
                <asp:Label ID="Label8" runat="server" Text="Division"></asp:Label>
            </td>
            <td class="style16">
                <asp:DropDownList ID="cmbDivision" runat="server" Height="25px" Width="336px" 
                    AutoPostBack="True" DataSourceID="SqlDataSourceDivision" 
                    DataTextField="DivisionDesc" DataValueField="DivisionID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceDivision" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strConn %>" 
                    SelectCommand="SELECT [DivisionID], [DivisionDesc] FROM [RefDivision] WHERE ([IsDivisionActive] = @IsDivisionActive) ORDER BY [DivisionID]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="IsDivisionActive" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style16">
                <asp:Label ID="Label6" runat="server" Text="Uase Name"></asp:Label>
            </td>
            <td class="style18">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td class="style22">
                <asp:Label ID="Label7" runat="server" Text="Employee ID"></asp:Label>
            </td>
            <td class="style16">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style15">
                Eamil </td>
            <td class="style17">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
            <td class="style23">
                Cell No.</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style16">
                <asp:Label ID="Label9" runat="server" Text="Application"></asp:Label>
            </td>
            <td class="style18">
                <asp:DropDownList ID="cmdProjectID" runat="server" Height="25px" Width="336px" 
                    AutoPostBack="True" DataSourceID="SqlDataSourceApplicatioin" 
                    DataTextField="ProjectDes" DataValueField="ProjectID">
                    <asp:ListItem>PIBAS</asp:ListItem>
                    <asp:ListItem>Sybase</asp:ListItem>
                    <asp:ListItem>UBPS</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceApplicatioin" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strConn %>" 
                    SelectCommand="SELECT [ProjectID], [ProjectDes] FROM [RefProjects] WHERE ([ProjectActive] = @ProjectActive) ORDER BY [ProjectID]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="ProjectActive" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="style22">
                </td>
            <td class="style16">
                </td>
        </tr>
        <tr>
            <td class="style16">
                System Role</td>
            <td class="style18">
                <asp:DropDownList ID="cmbSystemRoleID" runat="server" Height="25px" 
                    Width="336px" AutoPostBack="True" DataSourceID="SqlDataSourceSystemRoles" 
                    DataTextField="SystemRole" DataValueField="SystemRoleID">
                    <asp:ListItem>CAD</asp:ListItem>
                    <asp:ListItem>Accounts</asp:ListItem>
                    <asp:ListItem>CAD +  Accounts</asp:ListItem>
                    <asp:ListItem>Operations</asp:ListItem>
                    <asp:ListItem>CD In-Charge</asp:ListItem>
                    <asp:ListItem>General Banking Officer</asp:ListItem>
                    <asp:ListItem>CAD Manager</asp:ListItem>
                    <asp:ListItem>Branch Manager</asp:ListItem>
                    <asp:ListItem>BCA</asp:ListItem>
                    <asp:ListItem>IT Officer</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceSystemRoles" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strConn %>" 
                    SelectCommand="SELECT [SystemRoleID], [SystemRole] FROM [RefSystemRole] WHERE (([DivisionID] = @DivisionID) AND ([IsSystemRoleActive] = @IsSystemRoleActive) AND ([ProjectID] = @ProjectID)) ORDER BY [SystemRoleID]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbDivision" Name="DivisionID" 
                            PropertyName="SelectedValue" Type="Decimal" />
                        <asp:Parameter DefaultValue="True" Name="IsSystemRoleActive" Type="Boolean" />
                        <asp:ControlParameter ControlID="cmdProjectID" Name="ProjectID" 
                            PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="style22">
                Tran. Code List</td>
            <td class="style16">
                <asp:ListBox ID="ListBox1" runat="server" 
                    DataSourceID="SqlDataSourceSystemRolsTranList" DataTextField="TranCode" 
                    DataValueField="TranCode" style="margin-left: 0px" Width="273px">
                </asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSourceSystemRolsTranList" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strConn %>" 
                    
                    SelectCommand="SELECT [TranCode] FROM [RefSystemRole] WHERE (([SystemRoleID] = @SystemRoleID) AND ([DivisionID] = @DivisionID) AND ([ProjectID] = @ProjectID))" 
                    onselecting="SqlDataSourceSystemRolsTranList_Selecting">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbSystemRoleID" Name="SystemRoleID" 
                            PropertyName="SelectedValue" Type="Decimal" />
                        <asp:ControlParameter ControlID="cmbDivision" Name="DivisionID" 
                            PropertyName="SelectedValue" Type="Decimal" />
                        <asp:ControlParameter ControlID="cmdProjectID" Name="ProjectID" 
                            PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style24">
                Limits</td>
            <td class="style25">
                <table style="width:100%;">
                    <tr>
                        <td>
                            Debit</td>
                        <td>
                            Credit</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="TextBox5" runat="server" Width="100px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox6" runat="server" Width="100px"></asp:TextBox>
                        </td>
                    </tr>
                    </table>
            </td>
            <td class="style26">
                Supervion Limits</td>
            <td class="style24">
                <table style="width:100%;">
                    <tr>
                        <td>
                            Debit</td>
                        <td>
                            Credit</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="TextBox9" runat="server" Width="100px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox10" runat="server" Width="100px"></asp:TextBox>
                        </td>
                    </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td class="style16">
                IBA Tran. Limits</td>
            <td class="style18">
                <table style="width:100%;">
                    <tr>
                        <td>
                            Debit</td>
                        <td>
                            Credit</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="TextBox12" runat="server" Width="100px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox13" runat="server" Width="100px"></asp:TextBox>
                        </td>
                    </tr>
                    </table>
            </td>
            <td class="style22">
                IBA Supervision limits</td>
            <td class="style16">
                <table style="width:100%;">
                    <tr>
                        <td>
                            Debit</td>
                        <td>
                            Credit</td>
                    </tr>
                    <tr>
                        <td class="style30">
                            <asp:TextBox ID="TextBox14" runat="server" Width="100px"></asp:TextBox>
                        </td>
                        <td class="style30">
                            <asp:TextBox ID="TextBox15" runat="server" Width="100px"></asp:TextBox>
                        </td>
                    </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td class="style16">
                O.D Limit</td>
            <td class="style18">
                &nbsp;</td>
            <td class="style22">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style29">
                Remarks</td>
            <td class="style28" colspan="3">
                <asp:TextBox ID="TextBox16" runat="server" Height="54px" TextMode="MultiLine" 
                    Width="803px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td class="style22">
                &nbsp;</td>
            <td align="right" class="style16">
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                    ValidationGroup="SaveUserApp">Submit</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style15">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
            <td class="style23">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
