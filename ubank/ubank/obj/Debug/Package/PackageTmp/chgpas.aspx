<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="chgpas.aspx.cs" Inherits="ubank.chgpas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center" style="height: 192px">
        <table style="width: 66%; font-size: small;">
            <tr>
                <td align="left">
                    <asp:Label ID="Label1" runat="server" Text="Old Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtConNewPass" ErrorMessage="New password is required" ValidationGroup="ChangePass">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="Label2" runat="server" Text="New Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPass" ErrorMessage="New password is required" ValidationGroup="ChangePass">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="Label3" runat="server" Text="Retype your new password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtConNewPass" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtOldPass" ErrorMessage="Retype New password is required" ValidationGroup="ChangePass">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="left" class="auto-style1"></td>
                <td class="auto-style1">
                    <asp:LinkButton ID="cmdForgotpassword" runat="server" Font-Size="X-Small">Forgot password</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtConNewPass" ErrorMessage="New password does not match with re-typed password" ValidationGroup="ChangePass"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="lblMsg" runat="server" Font-Size="Small" ForeColor="Maroon"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT OrgID, UserID, Password FROM UserManager WHERE (UserID = @UserID) AND (OrgID = @OrgID) AND (Password = @Password)" UpdateCommand="UPDATE UserManager  SET Password = @Password WHERE (OrgID = @OrgID) AND (UserID = @UserID)">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="UserID" SessionField="UserID" Type="String" />
                            <asp:SessionParameter DefaultValue="" Name="OrgID" SessionField="OrgID" Type="Decimal" />
                            <asp:ControlParameter ControlID="txtOldPass" Name="Password" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="txtNewPass" Name="Password" PropertyName="Text" />
                            <asp:SessionParameter Name="OrgID" SessionField="OrgID" />
                            <asp:SessionParameter Name="UserID" SessionField="UserID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="cmdChangePassword" runat="server" onclick="cmdChangePassword_Click" Text="Change Password" ValidationGroup="ChangePass" />
                    <asp:Button ID="cmdCancel" runat="server" onclick="cmdCancel_Click" Text="Cancel" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
