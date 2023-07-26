<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="WebAppl_DB_L23_1_03012023_Master_Page_2.RegistrationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function Validation() {
            var msgalrt = "";
            msgalrt = checkname();
            //msgalrt += checkcity();
            //msgalrt += checkage();

            if (alrt == "") {
                return true;
            } else {
                alert(msgalrt);
                return false;
            }
        }

        function checkname() {
            //var Tb = document.getElementById('txtname');// it works when no master
            //var Tb = document.getElementById('ContentPlaceHolder1_txtname');// it works when master
            var Tb = document.getElementById('<%=txtname.ClientID%>');// it works in both cases
            if (Tb.value == "") {
                return 'please enter your name !! \n';
            }
            else {
                return "";
            }
        }
        <%--function checkcity() {
            var Tb = document.getElementById('<%=txtcity.ClientID%>');
            if (Tb.value == "") {
                return 'Please enter your city !!\n ';
            } else {
                return "";
            }
        }
        function checkage() {
            var Tb = document.getElementById('<%=txtage.ClientID%>');
            if (Tb.value=="") {
                return 'please enter your age !!\n';
            } else {
                return "";
            }
        }--%>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Name :</td>
            <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>City :</td>
            <td><asp:TextBox ID="txtcity" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Age :</td>
            <td><asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btnsave" runat="server" Text="Save" ForeColor="White" BackColor="Gray" OnClick="btnsave_Click" OnClientClick="return Validation()" /></td>
        </tr>
    </table>
</asp:Content>
