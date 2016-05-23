<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="actionregaddforall.aspx.cs" Inherits="ubank.actionregaddforall" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
   
   
    <style type="text/css">
        .auto-style8
        {
            width: 95px;
        }
        .auto-style10 {
            height: 48px;
        }
        .auto-style11 {
            width: 95px;
            height: 49px;
        }
        .auto-style13 {
            width: 238px;
            height: 49px;
        }
        .auto-style15 {
            height: 49px;
            width: 491px;
        }
        .auto-style16 {
            width: 467px;
            height: 49px;
        }
        .auto-style21 {
            width: 95px;
            height: 63px;
        }
        .auto-style23 {
            width: 238px;
            height: 63px;
        }
        .auto-style24 {
            width: 467px;
            height: 63px;
        }
        .auto-style26 {
            width: 95px;
            height: 47px;
        }
        .auto-style27 {
            height: 39px;
        }
        .auto-style28 {
            width: 238px;
            height: 47px;
        }
        .auto-style29 {
            height: 47px;
        }
        .auto-style30 {
            width: 95px;
            height: 41px;
        }
        .auto-style31 {
            height: 41px;
            width: 491px;
        }
        .auto-style32 {
            width: 238px;
            height: 41px;
        }
        .auto-style33 {
            width: 467px;
            height: 41px;
        }
        .auto-style34 {
            height: 63px;
            width: 491px;
        }
        .auto-style35 {
            height: 62px;
        }
        .auto-style36 {
            height: 47px;
            width: 491px;
        }
        .auto-style37 {
            width: 467px;
            height: 42px;
        }
        .auto-style41 {
            width: 510px;
            height: 20px;
        }
        .auto-style42 {
            width: 193px;
            height: 20px;
        }
        .auto-style44 {
            height: 20px;
        }
    </style>
   
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent"  runat="server">

    <table style="width:100%;" cellspacing="1" cellpadding="1">
        <tr>
            <td class="auto-style37" colspan="4" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #999999">
                                                    <asp:Label ID="Label20" runat="server" Font-Size="X-Large" Text="Support Incident Records"></asp:Label>
                                                    </td>
        </tr>
        <tr>
            <td class="auto-style10" colspan="4" style="text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; font-size: small; font-weight: normal; color: #333333">
                                                    
                                                    <table style="width:100%;">
                                                        <tr>
                                                            <td class="auto-style41"></td>
                                                            <td align="right" class="auto-style42">
                                                    <asp:Label ID="Label6" runat="server" Font-Size="Small" Font-Bold="True" Font-Underline="False" ForeColor="Black">Request Date</asp:Label>
                                                            </td>
                                                            <td align="center" class="auto-style44">
                                                  <asp:Label
                                                        id="lblServerTime"
                                                        Runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    
                                                    </td>
        </tr>
        <tr>
            <td class="auto-style11">
                                                    <asp:Label ID="Label21" runat="server" Font-Size="Small" Text="Reported Channel" Font-Bold="True" Font-Underline="False" ForeColor="Black"></asp:Label>
                                                    </td>
            <td class="auto-style15">
                                                    <asp:DropDownList ID="reported_channel" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Report_description" DataValueField="Reported_channel_ID" Width="235px" OnSelectedIndexChanged="reported_channel_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT Reported_channel_ID, Report_description FROM Reported_channel UNION SELECT 999 AS Reported_channel_ID, 'Other' AS Report_description FROM Reported_channel AS Reported_channel_1"></asp:SqlDataSource>
                                                </td>
            <td class="auto-style13">
                                                    <asp:Label ID="other" runat="server" Font-Size="Small" Text="Other Channel" Font-Bold="True" Font-Underline="False" ForeColor="Black" Visible="False"></asp:Label>
                                                </td>
            <td class="auto-style16">
                                                <asp:TextBox ID="otherchaneel" runat="server" Height="22px" Visible="False" Width="235px"></asp:TextBox>
                                                
                                                </td>
        </tr>
        <tr>
            <td class="auto-style30">
                                                    <asp:Label ID="Label7" runat="server" Font-Size="Small" Font-Bold="True" Font-Underline="False" ForeColor="Black">Location</asp:Label>
                                                    </td>
            <td class="auto-style31">
                                                    <asp:DropDownList ID="cmbLocationID" runat="server" DataSourceID="SqlDataSource2" DataTextField="LocationDes" DataValueField="LocationID" Font-Size="Small" tabIndex="2" Width="235px" Height="23px" Font-Underline="False">
                                                    </asp:DropDownList>
                                                    <cc1:ListSearchExtender ID="cmbLocationID_ListSearchExtender" runat="server" BehaviorID="cmbLocationID_ListSearchExtender" TargetControlID="cmbLocationID" PromptText="">
                                                    </cc1:ListSearchExtender>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LocationID], [LocationDes] FROM [RefLocation] WHERE (([BlockLocation] = @BlockLocation) AND ([BlockForActionReg] = @BlockForActionReg))">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="False" Name="BlockLocation" Type="Boolean" />
                                                            <asp:Parameter DefaultValue="False" Name="BlockForActionReg" Type="Boolean" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
            <td class="auto-style32">
                                                    <asp:Label ID="Label19" runat="server" Font-Size="Small" Font-Bold="True" Font-Underline="False" ForeColor="Black">System</asp:Label>
                                                </td>
            <td class="auto-style33">
                                                    <asp:DropDownList ID="combProjectDesc" runat="server" Font-Size="Small" Width="235px" DataSourceID="SqlDataSource4" DataTextField="ProjectDes" DataValueField="ProjectID" AutoPostBack="True" ValidationGroup="addtask" Height="20px">
                                                    </asp:DropDownList>
                                                    <cc1:ListSearchExtender ID="combProjectDesc_ListSearchExtender" runat="server" BehaviorID="combProjectDesc_ListSearchExtender" TargetControlID="combProjectDesc" PromptText="">
                                                    </cc1:ListSearchExtender>
                                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator71" runat="server" 
                            ControlToValidate="combProjectDesc" ErrorMessage="Please enter your Request Description" 
                            ForeColor="#FF3300" ValidationGroup="addtask" InitialValue="0">*</asp:RequiredFieldValidator>
                                                    &nbsp;
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ProjectID], [ProjectDes] FROM [RefProjects] WHERE ([ProjectActive] = @ProjectActive)">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="True" Name="ProjectActive" Type="Boolean" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
        </tr>
        <tr>
            <td class="auto-style21">
                                                    <asp:Label ID="Label2" runat="server" Font-Size="Small" Font-Bold="True" Font-Underline="False" ForeColor="Black">Module</asp:Label>
                                                </td>
            <td class="auto-style34">
                                                    <asp:DropDownList ID="combprojCat" runat="server" Font-Size="Small" Width="235px" DataSourceID="SqlDataSource5" DataTextField="ProjectCatDesc" DataValueField="ProjectCatID" AutoPostBack="True" ValidationGroup="addtask">
                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                    </asp:DropDownList>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator121" runat="server" 
                            ControlToValidate="combprojCat" ErrorMessage="Please enter your Request Description" 
                            ForeColor="#FF3300" ValidationGroup="addtask">*</asp:RequiredFieldValidator><asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ProjectCatDesc], [ProjectCatID] FROM [RefProjectCateg] WHERE ([ProjectID] = @ProjectID)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="combProjectDesc" Name="ProjectID" PropertyName="SelectedValue" Type="Decimal" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
            <td class="auto-style23">
                                                    <asp:Label ID="Label12" runat="server" Font-Size="Small" Font-Bold="True" Font-Underline="False" ForeColor="Black">Assigne To</asp:Label>
                                                </td>
            <td class="auto-style24">
                                                    <cc1:ListSearchExtender ID="combprojCat_ListSearchExtender" runat="server" BehaviorID="combprojCat_ListSearchExtender" TargetControlID="combprojCat" PromptText="">
                                                    </cc1:ListSearchExtender>
                                                    <asp:DropDownList ID="combAssignename" runat="server" Width="235px" DataSourceID="SqlDataSource10" DataTextField="UserID" DataValueField="UserID" ValidationGroup="addtask" AutoPostBack="True" Height="23px">
                                                   
                                                              
                                                         </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="combAssignename" ErrorMessage="Please enter your Request Description" 
                            ForeColor="#FF3300" ValidationGroup="addtask">*</asp:RequiredFieldValidator>
                                                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [UserID] FROM [sirGroup] WHERE ([ProjectCatID] = @ProjectCatID)" >
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="combprojCat" Name="ProjectCatID" PropertyName="SelectedValue" Type="Decimal" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
        </tr>
        <tr>
            <td class="auto-style26">
                                                    <asp:Label ID="Label4" runat="server" Font-Size="Small" style="margin-right: 1px" Font-Bold="True" Font-Underline="False" ForeColor="Black">Priority</asp:Label>
                                                </td>
            <td class="auto-style36">
                                                    <asp:DropDownList ID="DropDownList3" runat="server" width="239px" Height="20px">
                                                        <asp:ListItem Value="Normal">Normal</asp:ListItem>
                                                        <asp:ListItem>Medium</asp:ListItem>
                                                        <asp:ListItem>High</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
            <td class="auto-style28">
                                                    <asp:Label ID="Label13" runat="server" Font-Size="Small" Font-Bold="True" Font-Underline="False" ForeColor="Black">Upload File</asp:Label>
                                                </td>
            <td class="auto-style29">
                                                    <asp:FileUpload ID="FileUpload1" runat="server" Height="28px" Width="244px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style8" rowspan="2">
                                                    <asp:Label ID="Label5" runat="server" Font-Size="Small" Height="98px" Width="109px" Font-Bold="True" Font-Underline="False" ForeColor="Black">Request Description</asp:Label>
                                                    
                                                </td>
            <td class="auto-style35" colspan="3">
                                                    
                                                    <asp:DropDownList ID="problem_request" runat="server" DataSourceID="SqlDataSource3" DataTextField="Problem_description" DataValueField="Reported_problem_ID" Width="235px" AutoPostBack="True" OnSelectedIndexChanged="problem_request_SelectedIndexChanged">
                                                    <asp:ListItem Value="0" Text="Choose One"></asp:ListItem>
                                                    </asp:DropDownList>

                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" InitialValue ="0"
                            ControlToValidate="problem_request" ErrorMessage="Please enter your Request Description" 
                            ForeColor="#FF3300" ValidationGroup="addtask">*</asp:RequiredFieldValidator>

                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT 0 AS Reported_problem_ID, 'choose one' AS Problem_description FROM [RefReported Problem] UNION SELECT 999 AS Reported_problem_ID, 'Other' AS Problem_description FROM [RefReported Problem] AS [RefReported Problem_2] UNION SELECT Reported_problem_ID, Problem_description FROM [RefReported Problem] AS [RefReported Problem_1] WHERE (ProjectCatID = @ProjectCatID)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="combprojCat" Name="ProjectCatID" PropertyName="SelectedValue" Type="Decimal" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                </td>
        </tr>
        <tr>
            <td class="auto-style27" colspan="3">
                                                    <asp:TextBox ID="txtRequestDes" runat="server" BorderStyle="Ridge" Font-Size="Small" Height="52px" MaxLength="200" tabIndex="3" TextMode="MultiLine" Width="718px"  Visible="False">N/A</asp:TextBox>
                                                </td>
        </tr>
        <tr>
            <td align="right" colspan="4">
                                              <asp:Button ID="Button2" Class="btn btn-primary" runat="server" Height="32px" tabIndex="10" Text="Submit" OnClick="Button2_Click" ValidationGroup="addtask" Width="124px" BackColor="#0066FF" BorderColor="#333333" BorderStyle="Solid" ForeColor="White"  />
                                                    
                                                   
                                                </td>
        </tr>
    </table>

</asp:Content>
