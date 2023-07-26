<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="WebAppl_DB_L23_E_03022023_Master_JS_GV_Del.RegistrationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script type="text/javascript">
 
       function Validation() {
           var msg = "";
           msg = checkname();
           msg += checkage();
           msg += checkgender();
           msg += checkcountry();

           if (msg == "") {
               return true;
           }
           else {
               alert(msg);
               return false; 
           }
       }

       function checkname() {
           var Tb = document.getElementById('<%=txtname.ClientID%>');
           if (Tb.value == "") {
               return 'please enter your name !!\n';
           } else {
               return "";
           }
       }
       function checkage() {
           var Tb = document.getElementById('<%=txtage.ClientID%>');
           if (Tb.value == "") {
               return 'please enter your age !!\n';
           } else {
               return "";
           }
       }
       function checkgender() {
           var rbl = document.getElementById('<%=rblgender.ClientID%>');
           var rblitems = rbl.document.getElementsByTagName('input');
           var p = 0;
           for (int i = 0; i < rblitems.length; i++) {
               if (rblitems[i].checked == true) {
                   p = 1;
               }
               else {
                   p = 0;
               }
           }
           if (p == 0) {
               return 'please eneter your gender !!\n';
           }
           else {
               return "";
           }
       }
       function checkcountry() {
           var ddl = document.getElementById('<%=ddlcountry.ClientID%>');
           if (ddl.value == "0") {
               return 'please enter your country !!\n';
           } else {
               return "";
           }
       }
   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Name :</td>
            <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Age :</td>
            <td><asp:TextBox ID="txtage" runat="server"></asp:TextBox> </td>
        </tr>
        <tr>
            <td>Gender :</td>
            <td><asp:RadioButtonList ID="rblgender" runat="server" RepeatColumns="3">
                <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                <asp:ListItem Text="Other" Value="3"></asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td>Country :</td>
            <td><asp:DropDownList ID="ddlcountry" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btnsave" Text="Save" runat="server" ForeColor="White" BackColor="Gray" OnClick="btnsave_Click" OnClientClick="return Validation()" /></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:GridView ID="grd" runat="server" OnRowCommand="grd_RowCommand" AutoGenerateColumns="false" >
                <Columns>
                   <asp:TemplateField HeaderText="Emp Name">
                       <ItemTemplate>
                           <%#Eval("name") %>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="Emp Age">
                       <ItemTemplate>
                           <%#Eval("age") %>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="Emp Gender">
                       <ItemTemplate>
                           <%#Eval("gender").ToString()=="1"?"male":Eval("gender").ToString()=="2"?"Female":"Other"%>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="Emp Country">
                       <ItemTemplate>
                           <%#Eval("cname") %>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action" ItemStyle-BackColor="Blue">
                       <ItemTemplate>
                           <asp:LinkButton ID="btndelete" Text="Delete" runat="server" ForeColor="White"  OnClientClick="return confirm('are you sure you want to delete  ??')"></asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
                </Columns>
                </asp:GridView></td>
        </tr>
            
    </table>
</asp:Content>
