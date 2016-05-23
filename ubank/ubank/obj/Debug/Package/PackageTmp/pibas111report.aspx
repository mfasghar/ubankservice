s<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pibas111report.aspx.cs" Inherits="ubank.pibas111report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="main-div">
        <h1>LMF RePayments</h1>
             <asp:Label ID="Label5" runat="server" Text="Date should be Greater than From Date and less than To Date." Visible="False" Font-Bold="True" ForeColor="#FB2304"></asp:Label> 
            <asp:Literal ID="litmsg" runat="server"></asp:Literal>
        <div class="inner-main-div">
            <div class="pull-left input-text-txt">From Date :</div>
            <div class="pull-right">
                 <asp:TextBox ID="TextBox1" CssClass="input-txt" runat="server" Text="null" placeholder ="MM\DD\YYYY" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" ></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" TargetControlID="TextBox1" />
               </div>
            <div class="clear-fix"></div>
        </div>
        <div class="inner-main-div">
            <div class="pull-left input-text-txt">To Date :</div>
            <div class="pull-right">
                   <asp:TextBox ID="TextBox2" CssClass="input-txt" runat="server" Text="null" placeholder ="MM\DD\YYYY" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" ></asp:TextBox>
                     <ajaxToolkit:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" BehaviorID="TextBox2_CalendarExtender" TargetControlID="TextBox2" />
                   
            </div>
            <div class="clear-fix"></div>
        </div>
        <div class="inner-main-div">
            <div class="pull-left input-text-txt">Branch Code :</div>
            <div class="pull-right"><asp:TextBox CssClass="input-txt" ID="txtBranchCode" runat="server"></asp:TextBox></div>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtBranchCode" runat="server" ForeColor="Red" ErrorMessage="* Required"></asp:RequiredFieldValidator>--%>
            <div class="clear-fix"></div>
        </div>
        <div class="inner-main-div">
            <div class="pull-left input-text-txt">RO Code :</div>
            <div class="pull-right"><asp:TextBox CssClass="input-txt" ID="txtRoCode" runat="server"></asp:TextBox></div>
             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtRoCode" runat="server" ForeColor="Red" ErrorMessage="* Required"></asp:RequiredFieldValidator>--%>
           <div class="clear-fix"></div>
        </div>
        <asp:Button ID="btnSubmit" runat="server" CssClass="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="abc" />
        
    </div>
        <div class="div-grid-view">
            <div id="ExportToExcel" Visible="false" runat="server" style="width: 30%;text-align: center;margin: 0 auto;">
                <div>Click XLS Icon to download the file</div>
                <asp:ImageButton Width="80px" runat="server" ImageUrl="excel-xls.png" OnClick="ExportToExcel_Click" ValidationGroup="abc" />
            </div>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" >  
                 <AlternatingRowStyle BackColor="White" />  
                 <columns>  
                     <asp:TemplateField HeaderText="BranchCode">  
                         <ItemTemplate>  
                             <asp:Label ID="lblBranchCode" runat="server" Text='<%#Bind("BranchCode") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField>  
                     <asp:TemplateField HeaderText="RoCode">  
                         <ItemTemplate>  
                             <asp:Label ID="lblRoCode" runat="server" Text='<%#Bind("RoCode") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField> 
                     <asp:TemplateField HeaderText="RoName">  
                         <ItemTemplate>  
                             <asp:Label ID="lblRoName" runat="server" Text='<%#Bind("RoName") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField> 
                     <asp:TemplateField HeaderText="LoanCode">  
                         <ItemTemplate>  
                             <asp:Label ID="lblLoanCode" runat="server" Text='<%#Bind("LoanCode") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField>  
                     <asp:TemplateField HeaderText="CellNo">  
                         <ItemTemplate>  
                             <asp:Label ID="lblCellNo" runat="server" Text='<%#Bind("CellNo") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField>  
                     <asp:TemplateField HeaderText="CNIC">  
                         <ItemTemplate>  
                             <asp:Label ID="lblCNIC" runat="server" Text='<%#Bind("CNIC") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField>                       
                     <asp:TemplateField HeaderText="BRM">  
                         <ItemTemplate>  
                             <asp:Label ID="lblBorrowerCode" runat="server" Text='<%#Bind("BorrowerCode") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField> 
                     <asp:TemplateField HeaderText="PC">  
                         <ItemTemplate>  
                             <asp:Label ID="lblPC" runat="server" Text='<%#Bind("PC") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Product">  
                         <ItemTemplate>  
                             <asp:Label ID="lblPC" runat="server" Text='<%#Bind("ProductName") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField> 
                     <asp:TemplateField HeaderText="DisbAmnt">  
                         <ItemTemplate>  
                             <asp:Label ID="lblDisbAmnt" runat="server" Text='<%#Bind("DisbAmnt") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField> 
                     <asp:TemplateField HeaderText="DueDate">  
                         <ItemTemplate>  
                             <asp:Label ID="lblDateDue" runat="server" Text='<%#Bind("DateDue") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="InstAmnt">  
                         <ItemTemplate>  
                             <asp:Label ID="lblInstAmnt" runat="server" Text='<%#Bind("InstAmnt") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField> 
                      
                     <asp:TemplateField HeaderText="InstPrincipal">  
                         <ItemTemplate>  
                             <asp:Label ID="lblInstPrincipal" runat="server" Text='<%#Bind("InstPrincipal") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField> 
                     <asp:TemplateField HeaderText="InstMarkup">  
                         <ItemTemplate>  
                             <asp:Label ID="lblInstMKPNormal" runat="server" Text='<%#Bind("InstMKPNormal") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField> 
                     <%--<asp:TemplateField HeaderText="InstMKPGP">  
                         <ItemTemplate>  
                             <asp:Label ID="lblInstMKPGP" runat="server" Text='<%#Bind("InstMKPGP") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField> --%>
                     <asp:TemplateField HeaderText="PaidPrincipal">  
                         <ItemTemplate>  
                             <asp:Label ID="lblPaidPrincipal" runat="server" Text='<%#Bind("PaidPrincipal") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField> 
                     <asp:TemplateField HeaderText="PaidMarkup">  
                         <ItemTemplate>  
                             <asp:Label ID="lblPaidMKPNormal" runat="server" Text='<%#Bind("PaidMKPNormal") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField> 
                     <%--<asp:TemplateField HeaderText="PaidMKPGP">  
                         <ItemTemplate>  
                             <asp:Label ID="lblPaidMKPGP" runat="server" Text='<%#Bind("PaidMKPGP") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField> --%>
                     <asp:TemplateField HeaderText="DatePaid">  
                         <ItemTemplate>  
                             <asp:Label ID="lblDatePaid" runat="server" Text='<%#Bind("DatePaid") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField> 
                     <asp:TemplateField HeaderText="OutsidePrinciple">  
                         <ItemTemplate>  
                             <asp:Label ID="lblOutsidePrinciple" runat="server" Text='<%#Bind("OutsidePrinciple") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="OutsideMarkup">  
                         <ItemTemplate>  
                             <asp:Label ID="lblOutsideMKPNormal" runat="server" Text='<%#Bind("OutsideMKPNormal") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField>
                     <%--<asp:TemplateField HeaderText="OutsideMKPGP">  
                         <ItemTemplate>  
                             <asp:Label ID="lblOutsideMKPGP" runat="server" Text='<%#Bind("OutsideMKPGP") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField>--%>
                     <asp:TemplateField HeaderText="DueAmount">  
                         <ItemTemplate>  
                             <asp:Label ID="lblDueAmount" runat="server" Text='<%#Bind("DueAmount") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="DPD">  
                         <ItemTemplate>  
                             <asp:Label ID="lblDPD" runat="server" Text='<%#Bind("DPD") %>'></asp:Label>  
                         </ItemTemplate>  
                     </asp:TemplateField>  
                 </columns>  
                 <EditRowStyle BackColor="#2461BF" />  
                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />  
                 <RowStyle BackColor="#EFF3FB" />  
                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />  
                 <SortedAscendingCellStyle BackColor="#F5F7FB" />  
                 <SortedAscendingHeaderStyle BackColor="#6D95E1" />  
                 <SortedDescendingCellStyle BackColor="#E9EBEF" />  
                 <SortedDescendingHeaderStyle BackColor="#4870BE" />  
             </asp:GridView>  
        </div>

</asp:Content>
