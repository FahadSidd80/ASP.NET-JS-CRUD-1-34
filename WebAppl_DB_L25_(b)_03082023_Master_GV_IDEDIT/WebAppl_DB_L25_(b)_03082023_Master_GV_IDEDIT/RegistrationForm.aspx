<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="WebAppl_DB_L25__b__03082023_Master_GV_IDEDIT.RegistrationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         function Validation() {
             var msg = "";
             msg = checkname();
             msg += checkage();
             msg += checkgender();
             msg += checkcountry();
             msg += checkstate();

             if (msg == "") {
                 return true;
             }
             else {
                 alert(msg);
                 return false;
             }
         }

         function checkname() {
             var TB = document.getElementById('<%=txtname.ClientID%>');
             if (TB.value == "") {
                 return 'please enter your name !!\n';
             }
             else {
                 return "";
             }
         }

         function checkage() {
             var TB = document.getElementById('<%=txtage.ClientID%>');
            if (TB.value == "") {
                return 'please enter your age !!\n';
            }
            else {
                return "";
            }
         }

        

        function checkgender() {
            var RBL = document.getElementById('<%=rblgender.ClientID%>');
             var RBLITEMS = RBL.getElementsByTagName('input');
             var p = 0;

             for (var i = 0; i < RBLITEMS.length; i++) {
                 if (RBLITEMS[i].checked == true) {
                     p = 1;
                 }
             }

             if (p == 0) {
                 return 'please select your gender!!\n'
             }
             else {
                 return "";
             }
        }

         function checkcountry() {
             var DDL = document.getElementById('<%=ddlcountry.ClientID%>');
             if (DDL.value == "0") {
                 return 'please select your country !!\n';
             }
             else {
                 return "";
             }
         }

        function checkstate() {
            var DDL = document.getElementById('<%=ddlstate.ClientID%>');
            if (DDL.value == "0") {
                return 'please select your state !!\n';
            }
            else {
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
            <td><asp:DropDownList ID="ddlcountry" runat="server" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>State :</td>
            <td><asp:DropDownList ID="ddlstate" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btnsave" Text="Save" runat="server" ForeColor="White" BackColor="Gray" OnClick="btnsave_Click" OnClientClick="return Validation()" /></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:GridView ID="grd" runat="server" OnRowCommand="grd_RowCommand" AutoGenerateColumns="false" >
                <Columns>
                    <%-- <asp:TemplateField HeaderText="Emp ID">
                       <ItemTemplate>
                           <%#Eval("pppp") %> aise bhi kar sakte hai like pppp
                       </ItemTemplate>
                   </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="Sr.No">
                       <ItemTemplate>
                           <%#Eval("serialNumber") %>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="Emp ID">
                       <ItemTemplate>
                           <%#Eval("id") %>
                       </ItemTemplate>
                   </asp:TemplateField>--%>
                   <asp:TemplateField HeaderText="Emp Name">
                       <ItemTemplate>
                           <%#Eval("CapName") %>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="Emp Age">
                       <ItemTemplate>
                           <%#Eval("age") %>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="Emp Gender">
                       <ItemTemplate>
                           <%#Eval("gender").ToString()=="1"?"Male":Eval("gender").ToString()=="2"?"Female":"Other"%>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="Emp Country">
                       <ItemTemplate>
                           <%#Eval("cname") %>
                       </ItemTemplate>
                   </asp:TemplateField>
                     <asp:TemplateField HeaderText="Emp State">
                       <ItemTemplate>
                           <%#Eval("sname") %>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action" ItemStyle-BackColor="Blue">
                       <ItemTemplate>
                           <asp:LinkButton ID="btndelete" Text="Delete" runat="server" ForeColor="White" CommandArgument='<%#Eval("id") %>' CommandName="Del"  OnClientClick="return confirm('are you sure you want to delete  ??') "></asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action" ItemStyle-BackColor="Black">
                       <ItemTemplate>
                           <asp:LinkButton ID="btnedit" Text="Edit" runat="server" ForeColor="White" BackColor="Black" CommandArgument='<%#Eval("id") %>' CommandName="Edt"></asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
                </Columns>
                </asp:GridView></td>
        </tr>
            
    </table>
</asp:Content>
