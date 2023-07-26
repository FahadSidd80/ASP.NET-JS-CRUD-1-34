<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="WebAppl_DB_L27_03112023_Image_Upload_Master.RegistrationForm" %>
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
       
            
    </table>
</asp:Content>
