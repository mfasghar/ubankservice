<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sercurity_complaint_detail.aspx.cs" Inherits="ubank.sercurity_complaint_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

   
    <style type="text/css">
        .auto-style1
        {
            height: 16px;
            }
        .auto-style18 {
            height: 32px;
        }
        .auto-style19 {
        }
        .auto-style20 {
            height: 32px;
            width: 83px;
        }
        .auto-style21 {
            height: 22px;
        }
        .auto-style22 {
            height: 20px;
        }
        </style>

   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


      <div class="page-header" >
    <h1>IT Security Incident Management Module 
          </h1>
          <h1 style="text-align: center; empty-cells: hide;">
        <asp:FormView ID="FormView2" runat="server"   CaptionAlign="Bottom"  DataKeyNames="complaint_id" DataSourceID="SqlDataSource2" Font-Size="Medium" Width="922px" >
        <EditItemTemplate>
            complaint_id:
            <asp:Label ID="complaint_idLabel1" runat="server" Text='<%# Eval("complaint_id") %>' />
            <br />
            subject:
            <asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("subject") %>' />
            <br />
            category:
            <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
            <br />
            date:
            <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
            <br />
            Assigne_to:
            <asp:TextBox ID="Assigne_toTextBox" runat="server" Text='<%# Bind("Assigne_to") %>' />
            <br />
            priority:
            <asp:TextBox ID="priorityTextBox" runat="server" Text='<%# Bind("priority") %>' />
            <br />
            location:
            <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
            <br />
            status:
            <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
            <br />
            desription:
            <asp:TextBox ID="desriptionTextBox" runat="server" Text='<%# Bind("desription") %>' />
            <br />
            emp_name:
            <asp:TextBox ID="emp_nameTextBox" runat="server" Text='<%# Bind("emp_name") %>' />
            <br />
            emp_designation:
            <asp:TextBox ID="emp_designationTextBox" runat="server" Text='<%# Bind("emp_designation") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            subject:
            <asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("subject") %>' />
            <br />
            category:
            <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
            <br />
            date:
            <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
            <br />
            Assigne_to:
            <asp:TextBox ID="Assigne_toTextBox" runat="server" Text='<%# Bind("Assigne_to") %>' />
            <br />
            priority:
            <asp:TextBox ID="priorityTextBox" runat="server" Text='<%# Bind("priority") %>' />
            <br />
            location:
            <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
            <br />
            status:
            <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
            <br />
            desription:
            <asp:TextBox ID="desriptionTextBox" runat="server" Text='<%# Bind("desription") %>' />
            <br />
            emp_name:
            <asp:TextBox ID="emp_nameTextBox" runat="server" Text='<%# Bind("emp_name") %>' />
            <br />
            emp_designation:
            <asp:TextBox ID="emp_designationTextBox" runat="server" Text='<%# Bind("emp_designation") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">complaint_id:</td>
                    <td style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="complaint_idLabel" runat="server" Text='<%# Eval("complaint_id") %>' />
                    </td>
                    <td style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">date:</td>
                    <td style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">subject:</td>
                    <td style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="subjectLabel" runat="server" Text='<%# Bind("subject") %>' />
                    </td>
                    <td style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">category:</td>
                    <td style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="categoryLabel" runat="server" Text='<%# Bind("category") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style22" style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">Assigne_to:</td>
                    <td class="auto-style22" style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="Assigne_toLabel" runat="server" Text='<%# Bind("Assigne_to") %>' />
                    </td>
                    <td class="auto-style22" style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">emp_name:</td>
                    <td class="auto-style22" style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="emp_nameLabel" runat="server" Text='<%# Bind("emp_name") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">priority:</td>
                    <td style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="priorityLabel" runat="server" Text='<%# Bind("priority") %>' />
                    </td>
                    <td style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">status:</td>
                    <td style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="statusLabel" runat="server" Text='<%# Bind("status") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">desription: </td>
                    <td colspan="3" style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="desriptionLabel" runat="server" Text='<%# Bind("desription") %>' />
                    </td>
                </tr>
            </table>
           

        </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT complaint_id, subject, category, date, Assigne_to, priority, location, status, desription, emp_name, emp_designation FROM RefComplaints WHERE (complaint_id = @complaint_id)">
            <SelectParameters>
                <asp:SessionParameter Name="complaint_id" SessionField="id" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table style="width:100%;">
           

                <div>

                      
             <tr >
                <td align="left" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; word-spacing: normal; text-align: left; font-size: large; font-weight: bold; color: #0099FF;" colspan="3">
                    change current status</td>

               
            </tr>

             <tr >
                <td align="left" class="auto-style19">
                    <asp:Label ID="Label1" runat="server" Text="Activity" Font-Size="Small" Font-Bold="False"></asp:Label>

                </td>

               
                <td align="left" colspan="2">
                    <asp:DropDownList ID="activity" runat="server" DataSourceID="SqlDataSource3" DataTextField="ActivityDes" DataValueField="ActivityID" Font-Size="Small" Height="20px" Width="398px"></asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ActivityID], [ActivityDes] FROM [RefActivity]"></asp:SqlDataSource>

                </td>

               
            </tr>

            <tr>

                 <td align="left" class="auto-style19"> 

                    
                    <asp:Label ID="Label2" runat="server" Text="Description" Font-Size="Small" Font-Bold="False"></asp:Label>
                    
                </td>

                 <td align="left" colspan="2"> 

                    
                   <asp:TextBox ID="TextBox1" runat="server" Width="559px" Height="64px" TextMode="MultiLine" Font-Size="Small" ></asp:TextBox>

                </td>

            </tr>


            <tr align="center" >
                
                <td align="right" class="auto-style20">

                    
                    <asp:Label ID="Label321" runat="server" Text="Assigne To" Font-Size="Small" Font-Bold="False"></asp:Label>
                    
                </td>
                
                <td align="left"  >

                     <asp:DropDownList ID="assinge_to" runat="server" DataSourceID="SqlDataSource4" DataTextField="UserName" DataValueField="UserID" Font-Size="Small" Height="20px" Width="398px"></asp:DropDownList>

                     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [UserName], [UserID] FROM [UserManager]">
                     </asp:SqlDataSource>
                </td>
                
                <td align="right" class="auto-style18">

                     </td>
                
            
                   </tr>


            <tr align="center" >
                
                <td align="right" class="auto-style1" colspan="3">

                     <asp:LinkButton ID="LinkButton1" runat="server"  ValidationGroup="addtask" Font-Size="Small" OnClick="LinkButton1_Click">Submit</asp:LinkButton>
                </td>
                </div>
                
            
                   </tr>


            <tr align="center" >
                
                <td align="left" class="auto-style1" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; word-spacing: normal; text-align: left; font-size: large; font-weight: bold; color: #0099FF;" colspan="3">

                     Complaint History</td>
                
            
                   </tr>
            <tr align="left">
              
                <td align="left" class="auto-style19" colspan="3">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" Font-Size ="Small" Width="805px" CaptionAlign="Left">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" VerticalAlign="Middle"  />
                        <Columns>
                            <asp:BoundField DataField="complaint_id" HeaderText="complaint_id" SortExpression="complaint_id" >
                            </asp:BoundField>
                            <asp:BoundField DataField="ActivityDes" HeaderText="ActivityDes" SortExpression="ActivityDes" >
                            </asp:BoundField>
                            <asp:BoundField DataField="Activity_description" HeaderText="Activity_description" SortExpression="Activity_description" />
                            <asp:BoundField DataField="Activity_time" HeaderText="Activity_time" SortExpression="Activity_time" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT RefActivityDetails.complaint_id, RefActivity.ActivityDes, RefActivityDetails.Activity_description, RefActivityDetails.Activity_time FROM RefActivityDetails INNER JOIN RefActivity ON RefActivityDetails.ActivityID = RefActivity.ActivityID WHERE (RefActivityDetails.complaint_id = @complaint_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="complaint_id" SessionField="id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
              
            </tr>
            <tr>
                <td align="left" class="auto-style19">
                    &nbsp;</td>
                <td align="left" class="auto-style12" colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
          </h1>
    </div>


    </asp:Content>
