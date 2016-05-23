<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="security_incident.aspx.cs" Inherits="ubank.security_incident" %>
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
        .auto-style34 {
            height: 63px;
            width: 491px;
        }
        .auto-style35 {
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
        .auto-style45 {
            width: 95px;
            height: 54px;
        }
        .auto-style46 {
            height: 54px;
            width: 491px;
        }
        .auto-style47 {
            width: 238px;
            height: 54px;
        }
        .auto-style48 {
            width: 467px;
            height: 54px;
        }
    </style>
   
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent"  runat="server">

    <table style="width:100%;" cellspacing="1" cellpadding="1">
        <tr>
            <td class="auto-style37" colspan="4" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #999999">
                                                    <asp:Label ID="Label20" runat="server" Font-Size="X-Large" Text="IT Security Incident Management Module "></asp:Label>
                                                    <cc1:AnimationExtender ID="Label20_AnimationExtender" runat="server" BehaviorID="Label20_AnimationExtender" TargetControlID="Label20">
                                                    </cc1:AnimationExtender>
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
                                                    <asp:Label ID="Label7" runat="server" Font-Size="Small" Font-Bold="True" Font-Underline="False" ForeColor="Black">Location</asp:Label>
                                                    </td>
            <td class="auto-style15">
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
            <td class="auto-style13">
                                                    <asp:Label ID="Label23" runat="server" Font-Size="Small" Font-Bold="True" Font-Underline="False" ForeColor="Black">Employee ID</asp:Label>
                                                    </td>
            <td class="auto-style16">
                                                <asp:TextBox ID="emp_iddd" runat="server" Width="224px" BorderColor="#666666"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style45">
                                                    <asp:Label ID="Label21" runat="server" Font-Size="Small" Font-Bold="True" Font-Underline="False" ForeColor="Black">Name</asp:Label>
                                                    </td>
            <td class="auto-style46">
                                                    <asp:TextBox ID="name" runat="server" Width="228px" BorderColor="#666666"></asp:TextBox>
                                                </td>
            <td class="auto-style47">
                                                    <asp:Label ID="Label22" runat="server" Font-Size="Small" Font-Bold="True" Font-Underline="False" ForeColor="Black">Designation </asp:Label>
                                                </td>
            <td class="auto-style48">
                                                  <asp:TextBox ID="designation" runat="server" Width="224px"></asp:TextBox>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    </td>
        </tr>
        <tr>
            <td class="auto-style26">
                                                    <asp:Label ID="Label24" runat="server" Font-Size="Small" Font-Bold="True" Font-Underline="False" ForeColor="Black">System</asp:Label>
                                                </td>
            <td class="auto-style36">
                                                    <asp:DropDownList ID="combProjectDesc" runat="server" Font-Size="Small" Width="235px" DataSourceID="SqlDataSource1" DataTextField="ProjectDes" DataValueField="ProjectID" AutoPostBack="True" ValidationGroup="addtask" Height="20px">
                                                    </asp:DropDownList>
                                                  <cc1:ListSearchExtender ID="combProjectDesc_ListSearchExtender" runat="server" BehaviorID="combProjectDesc_ListSearchExtender" TargetControlID="combProjectDesc" PromptText="">
                                                    </cc1:ListSearchExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator71" runat="server" 
                            ControlToValidate="combProjectDesc" ErrorMessage="Please enter your Request Description" 
                            ForeColor="#FF3300" ValidationGroup="addtask" InitialValue="0">*</asp:RequiredFieldValidator>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT * FROM [RefProjects]"></asp:SqlDataSource>
                                                </td>
            <td class="auto-style28">
                                                    <asp:Label ID="Label2" runat="server" Font-Size="Small" Font-Bold="True" Font-Underline="False" ForeColor="Black">Module</asp:Label>
                                                </td>
            <td class="auto-style29">
                                                    <asp:DropDownList ID="combprojCat" runat="server" Font-Size="Small" Width="235px" DataSourceID="SqlDataSource3" DataTextField="ProjectCatDesc" DataValueField="ProjectCatID" AutoPostBack="True" ValidationGroup="addtask">
                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                    </asp:DropDownList>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator121" runat="server" 
                            ControlToValidate="combprojCat" ErrorMessage="Please enter your Request Description" 
                            ForeColor="#FF3300" ValidationGroup="addtask">*</asp:RequiredFieldValidator>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT * FROM [RefProjectCateg] WHERE ([ProjectID] = @ProjectID)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="combProjectDesc" Name="ProjectID" PropertyName="SelectedValue" Type="Decimal" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
        </tr>
        <tr>
            <td class="auto-style21">
                                                    <asp:Label ID="Label4" runat="server" Font-Size="Small" style="margin-right: 1px" Font-Bold="True" Font-Underline="False" ForeColor="Black">Priority</asp:Label>
                                                </td>
            <td class="auto-style34">
                                                    <asp:DropDownList ID="DropDownList3" runat="server" width="239px" Height="20px"  >
                                                        <asp:ListItem Value="Normal">Normal</asp:ListItem>
                                                        <asp:ListItem>Medium</asp:ListItem>
                                                        <asp:ListItem>High</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
            <td class="auto-style23">
                                                    &nbsp;</td>
            <td class="auto-style24">
                                                    <cc1:ListSearchExtender ID="combprojCat_ListSearchExtender" runat="server" BehaviorID="combprojCat_ListSearchExtender" TargetControlID="combprojCat" PromptText="">
                                                    </cc1:ListSearchExtender>
                                                </td>
        </tr>
        <tr>
            <td class="auto-style8">
                                                    <asp:Label ID="Label5" runat="server" Font-Size="Small" Height="98px" Width="109px" Font-Bold="True" Font-Underline="False" ForeColor="Black">Issue Description</asp:Label>
                                                    
                                                </td>
            <td class="auto-style35" colspan="3">
                                                    
                                                    <asp:TextBox ID="txtRequestDes" runat="server" BorderStyle="Solid" Font-Size="Small" Height="58px" MaxLength="200" tabIndex="3" TextMode="MultiLine" Width="718px" BorderColor="#666666">N/A</asp:TextBox>

                                                   

                                                </td>
        </tr>
        <tr>
            <td align="right" colspan="4">
                                              <asp:Button ID="Button2" Class="btn btn-primary" runat="server" Height="32px" tabIndex="10" Text="Submit"  ValidationGroup="addtask" Width="124px" BackColor="#0066FF" BorderColor="#333333" BorderStyle="Solid" ForeColor="White" OnClick="Button2_Click"  />
                                                    
                                                   
                                                </td>
        </tr>
    </table>

</asp:Content>
