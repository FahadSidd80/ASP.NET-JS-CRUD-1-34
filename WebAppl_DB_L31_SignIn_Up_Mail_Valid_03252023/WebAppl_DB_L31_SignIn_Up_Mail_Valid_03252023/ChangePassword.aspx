<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="WebAppl_DB_L31_SignIn_Up_Mail_Valid_03252023.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table>
                <tr>
                    <td>Old Password :</td>
                    <td><asp:TextBox ID="txtoldpassword" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                      <td>New Password :</td>
                      <td><asp:TextBox ID="txtnewpassword" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                      <td>Confirm New Password :</td>
                      <td><asp:TextBox ID="txtconfirmnewpassword" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btnupdatepassword" runat="server" Text="Update Password" OnClick="btnupdatepassword_Click" /></td>
                    <td><asp:Button ID="btnresetpassword" runat="server" Text="Password Reset"  /></td>
                </tr>
                <tr>
                      <td></td>
                      <td><asp:Label ID="lblmsg" Font-Bold="true" runat="server"></asp:Label></td>
                </tr>
            </table>
</asp:Content>
