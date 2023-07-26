<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="LoginPageAdminMaster.aspx.cs" Inherits="WebAppl_DB_L30_03212023_Chkbx_Edit_LoginPage.LoginPageAdminMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
               
    <tr>
        <td>Email :</td>
        <td><asp:TextBox ID="txtemail" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Password :</td>
        <td><asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox></td>
    </tr>
     <tr>
        <td></td>
        <td><asp:button ID="btnlogin" Text="Login" runat="server" OnClick="btnlogin_Click"></asp:button></td>
    </tr>  
    <tr>
        <td></td>
        <td><asp:Label ID="lblmsg" runat="server" Font-Bold="true"></asp:Label></td>
        <%--<td><asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label></td>--%>
       
    </tr>
            </table>
</asp:Content>
